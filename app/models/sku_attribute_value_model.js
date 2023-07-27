
const db = require('./db.js');
const TableName = "`sku_attribute_values`"

module.exports = {
  List: async ({ sku_ids = [0]}) => {
    // search
    let sql = `select * from ${TableName} where is_del=0 `;
    if(sku_ids.length > 0) sql += ` and sku_id in (${ sku_ids.toString() })`
    sql += ` ORDER BY id ASC`
    let list = await db.query(sql);
    return {list}
  },
  
}