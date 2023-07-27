
const db = require('./db.js');
const TableName = "`attributes`"
const Spu_Attribute_TableName = "`spu_attributes`"

// SELECT *
// FROM 表1
// LEFT JOIN 表2
// ON 表1.列 = 表2.列;

module.exports = {
  ListBySpuId: async (spu_id) => {
    // search
    let sql = `select aaa.id as id, aaa.name as name, bbb.spu_id as spu_id from ${TableName} as aaa `;
    sql += `LEFT JOIN ${Spu_Attribute_TableName} as bbb on aaa.id = bbb.attribute_id `
    sql += `where bbb.spu_id = "${ spu_id }" `

    // select * from `attributes` as aaa LEFT JOIN `spu_attributes` as bbb on bbb.attribute_id = aaa.id where bbb.spu_id = "10004" =>undefined


    let list = await db.query(sql);
    return {list}
  },
  
}