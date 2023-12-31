/*
 * @Description: 商品模块数据持久层
 */
const db = require('./db.js');
const TableName = "spus"

module.exports = {
  Add: async (itemInfo) => {
    const sql = `insert into ${TableName} 
      (spu_id, name, description, image_url) 
      values(?,?,?,?)`;
    return await db.query(sql, [
      itemInfo.spu_id,
      itemInfo.name,
      itemInfo.description || "",
      itemInfo.imageUrl || "",
    ]);
  },
  DeleteById: async (id) => {
    const sql = `delete from ${TableName}  where id=?`;
    return await db.query(sql, [id]);
  },
  DeleteBySpuId: async (spu_id) => {
    const sql = `delete from ${TableName}  where spu_id=?`;
    return await db.query(sql, [spu_id]);
  },
  RemoveById: async (id) => {
    const sql = `update ${TableName} SET is_del = 1 where id=?`;
    return await db.query(sql, [id]);
  },
  RemoveBySpuId: async (id) => {
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