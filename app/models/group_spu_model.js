
const db = require('./db.js');
const TableName = "`group_spu`"

module.exports = {
  ListByGroupId: async ({ group_id }) => {
    // search
    let sql = `select * from ${TableName} where is_del=0 `;
    if(group_id && group_id > 0) sql += ` and group_id = ${ group_id }`
    let list = await db.query(sql);
    return {list}
  },
}