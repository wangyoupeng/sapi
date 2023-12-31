
const db = require('./db.js');
const TableName = "`chat_rooms`"
const UserRoomTableName = "`chat_user_room`"
const MessageTableName = "`chat_room_messages`"

module.exports = {
  Add: async (itemInfo) => {
    const sql = `insert into ${TableName} 
      (name, headimgurl) 
      values(?,?)`;
    return await db.query(sql, [
      itemInfo.name,
      itemInfo.headimgurl || "",
    ]);
  },
  List: async ({ filterText }) => {
    // search
    let sql = `select * from ${TableName} where is_del=0 `;
    if(filterText) sql += ` and name like "%${ filterText }%"`
    sql += ` ORDER BY id DESC`
    sql += ` limit ${pageSize} offset ${currentPage * pageSize - pageSize}`
    let list = await db.query(sql);
    return list
  },
  ListRoomsByUserId: async ({ user_id = 1 }) => {
    if(!user_id) return [];
    // search
    let sql = `select b.id as id, b.name as name, b.headimgurl as headimgurl, 'room' as type   
      from ${UserRoomTableName} as a 
      left join ${TableName} as b on a.room_id = b.id  
      where a.is_del=0 
        and a.user_id =  ${user_id}
        and b.is_del=0`;
    sql += ` ORDER BY b.id asc`
    let list = await db.query(sql);
    return list
  },
  AddMessage: async (itemInfo) => {
    const sql = `insert into ${MessageTableName} 
      (room_id, sender_id, content) 
      values(?,?,?)`;
    return await db.query(sql, [
      itemInfo.room_id,
      itemInfo.sender_id,
      itemInfo.content
    ]);
  },
  ListMessage: async (itemInfo, limit = 20) => {
    let room_id = itemInfo.id || 0
    const sql = `select * from ${MessageTableName} 
      where room_id = ${room_id} 
      order by id desc limit ${limit}`;
    return await db.query(sql);
  },
  
}