/*
 * @Description: 订单模块数据持久层
 */
const db = require('./db.js');
const TableName = "orders"
const TableNameOrderItems = "order_items"

// 生成不重复的订单号
function generateOrderNumber() {
  const timestamp = Date.now().toString(); // 当前时间戳
  const randomNum = Math.floor(Math.random() * 1000).toString().padStart(3, '0'); // 三位随机数
  const orderNumber = `${timestamp}${randomNum}`;
  return orderNumber;
}

module.exports = {
  CreateWhitTransaction: async ({ user_id, goodsIdItemMap, }) => { //goodsItemList
    // 参数校验
    
    try {
      // 开启事务
      await db.beginTransaction();
      // 创建订单
      let orderNo = generateOrderNumber();
      
      let sql = `insert into ${TableName} 
      (order_no, user_id) 
      values(?,?)`;
      let {insertId} = await db.query(sql, [orderNo,user_id ]); // 可认为是order_id

      // 保存orderItem
      console.log("xxxxxxxxxxxxx:::",goodsIdItemMap )
      for(let k = 0; k < Object.keys(goodsIdItemMap).length ; k ++){
        let gItem = goodsIdItemMap[Object.keys(goodsIdItemMap)[k]] || {}
        let sql = `insert into ${TableNameOrderItems} 
          (order_id, order_no,user_id,goods_id , goods_name, amount, price,price_total) 
          values
          (?, ?,?,?,?,?,?,?)`;
        await db.query(sql, [insertId, orderNo,user_id,Object.keys(goodsIdItemMap)[k], gItem.name,gItem.amount,gItem.price,gItem.amount * gItem.price]); // 可认为是order_id
      }
      // 扣减库存 （TODO 暂时不扣）
      await db.commitTransaction();
      return 'ok'
      // 减购物车：
    } catch (err) {
      // 回滚事务并处理错误
      await db.rollbackTransaction(err);
      return 'ok'
    }


    // -------------------- 事务 start ------------
      
      // 减少库存 -------------- 事务
      // 生成订单 -------------- 事务
      // 生成 订单明细orderItem
    // -------------------- 事务 end ---------
    const sql = `insert into ${TableName} 
      (name, description, image_url, price, stock) 
      values(?,?,?,?,?)`;
    return await db.query(sql, [
      // itemInfo.name,
      // itemInfo.description || "",
      // itemInfo.imageUrl || "",
      // itemInfo.price || 0,
      // itemInfo.stock || 0,
    ]);
  },
  
  // 连接数据库,获取用户的所有收藏商品信息
  List: async ({ filterText, pageSize = 10, currentPage = 1}) => {
    // search
    let sql = `select * from ${TableName} where is_del=0 `;
    sql += ` ORDER BY id DESC`
    sql += ` limit ${pageSize} offset ${currentPage * pageSize - pageSize}`
    let list = await await db.query(sql);
    // count
    let countSql = `select count(*) as total from ${TableName} where is_del=0`
    let count = await await db.query(countSql)
    // return res
    const placeholdersList = []
    let orderIdList = list.map((i) => {
      placeholdersList.push('?')
      return i.id
    })
    
    let orderItemSql = `select order_id, amount, goods_name from ${TableNameOrderItems} where is_del=0 and order_id in ( ${ placeholdersList.join(', ') } ) `;
    let itemList = await db.query(orderItemSql,orderIdList);
    let orderIdOrderItemMap = {}
    // console.log('---------', typeof itemList, itemList)
    for(let i of itemList){
      if(orderIdOrderItemMap[i.order_id]){
        orderIdOrderItemMap[i.order_id].push({
          goods_name: i.goods_name,
          amount: i.amount,
        })
      } else {
        orderIdOrderItemMap[i.order_id] = [{
          goods_name: i.goods_name,
          amount: i.amount,
        }]
      }
    }

    let newList = list.map((item) => {
      let orderItems = orderIdOrderItemMap[item.id] || []
      return {...{orderItems}, ...item}
    })

    // console.log('--------- 2222:', JSON.stringify(newList))

    return {list: newList , count}
  },
  
}