/*
 * @Description: 订单模块数据持久层
 */
const db = require('./db.js');
const TableName = "orders"

module.exports = {
  CreateWhitTransaction: async ({ user_id, goodsItemList}) => {
    // 参数校验
    
    try {
      // 开启事务
      await db.beginTransaction();
      // 创建订单
      sql = `insert into ${TableName} 
      (name, description, image_url, price, stock) 
      values(?,?,?,?,?)`;
      await db.query(sql, ['John Doe', 28]);
      // 扣减库存
      // await db.query('UPDATE users SET age = ? WHERE name = ?', [30, 'John Doe']);
      await commitTransaction();
      ctx.body = '事务执行成功！';
    } catch (err) {
      // 回滚事务并处理错误
      await db.rollbackTransaction(err);
      ctx.body = '创建事务执行失败';
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
    if(filterText) sql += ` and name like "%${ filterText }%"`
    sql += ` ORDER BY id DESC`
    sql += ` limit ${pageSize} offset ${currentPage * pageSize - pageSize}`
    let list = await db.query(sql);
    // count
    let countSql = `select count(*) as total from ${TableName} where is_del=0`
    if(filterText) countSql += ` and name like "%${ filterText }%"`
    let count = await db.query(countSql)
    // return res
    return {list , count}
  },
  
}