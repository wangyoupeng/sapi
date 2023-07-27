
const db = require('./db.js');
const TableName = "`attribute_values`"

module.exports = {
  List: async ({ attribute_ids = [0], pageSize = 100, currentPage = 1}) => {
    // search
    let sql = `select * from ${TableName} where is_del=0 `;
    if(attribute_ids.length > 0) sql += ` and attribute_id in (${ attribute_ids.toString() })`
    sql += ` ORDER BY id ASC`
    sql += ` limit ${pageSize} offset ${currentPage * pageSize - pageSize}`
    let list = await db.query(sql);
    return {list}
  },
  
}