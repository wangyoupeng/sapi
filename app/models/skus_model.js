/*
 * @Description: 商品模块数据持久层
 */
const db = require('./db.js');
const TableName = "skus"

module.exports = {
  Add: async (itemInfo) => {
    const sql = `insert into ${TableName} 
      (name, description, image_url, price, stock) 
      values(?,?,?,?,?)`;
    return await db.query(sql, [
      itemInfo.name,
      itemInfo.description || "",
      itemInfo.imageUrl || "",
      itemInfo.price || 0,
      itemInfo.stock || 0,
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
  ListBySpuId: async (spu_id) => {
    // search
    let sql = `select * from ${TableName} where is_del=0 `;
    sql += ` and spu_id = "${ spu_id }"`
    sql += ` ORDER BY price DESC`
    let list = await db.query(sql);
    return {list}
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
    return {list, total: count[0].total}
  },
  // 连接数据库,获取用户的某个收藏商品信息
  UpdateById: async (id, updateInfo) => {
    let setStr = ""
    let paramsList = []
    for(let k in updateInfo){
      setStr += `${k}=?`
      paramsList.push(updateInfo[k])
    }
    paramsList.push(id)
    const sql = `update ${TableName} set ${setStr} where id =?`;
    return await db.query(sql, paramsList);
  },
  
}