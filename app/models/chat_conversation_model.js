
const db = require('./db.js');
const TableName = "`chat_conversations`"
const UserConversationTableName = "`chat_user_conversation`"
const UserTableName = "`users`"
const MessageTableName = "`chat_conversation_messages`"

module.exports = {
  ListFriendsByUserId: async ({ user_id = 1 }) => {
    if(!user_id) return [];
    // search
    let sql = `select a.id as id, c.id as user_id, c.name as name, c.headimgurl as headimgurl, 'conv' as type  
    from ${TableName} as a 
    left join ${UserConversationTableName} as b on a.id = b.conversation_id  
    left join ${UserTableName} as c on b.user_id = c.id
    where a.is_del=0 
      and a.user_ids_key like  '%${user_id}%'
      and b.is_del=0
      and c.is_del=0
      and c.id != ${user_id}`
    let list = await db.query(sql);
    return list
  },
  AddMessage: async (itemInfo) => {
    const sql = `insert into ${MessageTableName} 
      (conversation_id, sender_id, receiver_id, content) 
      values(?,?,?,?)`;
    return await db.query(sql, [
      itemInfo.conversation_id,
      itemInfo.sender_id,
      itemInfo.receiver_id,
      itemInfo.content,
    ]);
  },
  ListMessage: async (itemInfo, limit = 20) => {
    let conversation_id = itemInfo.id || 0
    const sql = `select * from ${MessageTableName} 
      where conversation_id = ${conversation_id} 
      order by id desc limit ${limit}`;
    return await db.query(sql);
  },
  
}