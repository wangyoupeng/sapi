/*
 * @Description: 商品模块数据持久层
 */
// 拟废弃
const db = require('./db.js');
const TableName = "skus"

module.exports = {
  Lock: async () => {
    let sql = `LOCK ${TableName} WRITE`;
    return await db.query(sql, []);
  },
  UnLock: async () => {
    let sql = `UNLOCK ${TableName}`;
    return await db.query(sql, []);
  },
  LockRows: async(goodsIds) => {
    const placeholdersList = []
    goodsIds.map((i) => {
      placeholdersList.push('?')
      return i.id
    })
    let sql = `SELECT * FROM ${TableName} WHERE id in (${placeholdersList.toString()}) FOR UPDATE`;
    return await db.query(sql, [...goodsIds]);
  },
  Add: async (itemInfo) => {
    const sql = `insert into ${TableName} 
      (name, description, image_url, price, stock) 
      values(?,?,?,?,?)`;
    return await db.query(sql, [
      itemInfo.name,
      itemInfo.description || "",
      itemInfo.imageUrl || "",
      itemInfo.price ? parseInt(itemInfo.price) : 0,
      itemInfo.stock ? parseInt(itemInfo.stock) : 0,
    ]);
  },
  DeleteById: async (id) => {
    const sql = `delete from ${TableName}  where id=?`;
    return await db.query(sql, [id]);
  },
  RemoveById: async (id) => {
    const sql = `update ${TableName} SET is_del = 1 where id=?`;
    return await db.query(sql, [id]);
  },
  // 连接数据库,获取用户的所有收藏商品信息
  List: async ({ filterText, pageSize = 10, currentPage = 1, idList}) => {
    // search
    let sql = `select * from ${TableName} where is_del=0 `;
    if(filterText) sql += ` and name like "%${ filterText }%"`
    if(idList && idList.length > 0) {
      sql += ` and id in (${ idList.toString() }) `
    }
    sql += ` ORDER BY id DESC`
    sql += ` limit ${pageSize} offset ${currentPage * pageSize - pageSize}`
    let list = await db.query(sql);
    // count
    let countSql = `select count(*) as total from ${TableName} where is_del=0`
    if(filterText) countSql += ` and name like "%${ filterText }%"`
    if(idList && idList.length > 0) {
      countSql += ` and id in (${ idList.toString() }) `
    }
    let count = await db.query(countSql)
    // return res
    return {list, count}
  },
  // 连接数据库,获取用户的某个收藏商品信息
  UpdateById: async (id, updateInfo) => {
    let setStr = ""
    let paramsList = []
    if(updateInfo.stock) updateInfo.stock = parseInt(updateInfo.stock)
    if(updateInfo.price) updateInfo.price = parseInt(updateInfo.price * 100)
    for(let k in updateInfo){
      setStr += `, ${k}=? `
      paramsList.push(updateInfo[k])
    }
    paramsList.push(id)
    const sql = `update ${TableName} set is_del=0 ${setStr} where id=?`;
    return await db.query(sql, paramsList);
  },
  StockCutById: async (id, amount) => {
    let sql = `UPDATE ${TableName} SET stock = stock - ? WHERE id = ?;`
    return await db.query(sql, [amount, id]);
  },
  ListByIds: async (idList) => {
    const placeholders = idList.map(() => '?').join(', ');
    let sql = `select * from ${TableName} where is_del=0 and id in ( ${ placeholders } ) `;
    return await db.query(sql,idList);
  },
  
}