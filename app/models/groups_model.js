
const db = require('./db.js');
const TableName = "groups"

module.exports = {
  Lock: async () => {
    let sql = `LOCK ${TableName} WRITE`;
    return await db.query(sql, []);
  },
  UnLock: async () => {
    let sql = `UNLOCK ${TableName}`;
    return await db.query(sql, []);
  },
  LockRows: async(ids) => {
    const placeholdersList = []
    ids.map((i) => {
      placeholdersList.push('?')
      return i.id
    })
    let sql = `SELECT * FROM ${TableName} WHERE id in (${placeholdersList.toString()}) FOR UPDATE`;
    return await db.query(sql, [...ids]);
  },
  Add: async (itemInfo) => {
    const sql = `insert into ${TableName} 
      (name, description) 
      values(?,?)`;
    return await db.query(sql, [
      itemInfo.name,
      itemInfo.description || "",
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
    return {list, count}
  },
  UpdateById: async (id, updateInfo) => {
    let setStr = ""
    let paramsList = []
    for(let k in updateInfo){
      setStr += `, ${k}=? `
      paramsList.push(updateInfo[k])
    }
    paramsList.push(id)
    const sql = `update ${TableName} set is_del=0 ${setStr} where id=?`;
    return await db.query(sql, paramsList);
  },
  
}