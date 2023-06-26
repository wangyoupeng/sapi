/*
 * @Description: 用户模块数据持久层
 */
const db = require('./db.js');
const TableName = "users"
module.exports = {
  // 连接数据库根据用户名和密码查询用户信息
  FindOne: async (username, pwd) => {
    const sql = `select id, name from ${TableName} where is_del = ? and name = ? and pwd = ?`;
    return await db.query(sql, [0, username, pwd]);
  },
  // 连接数据库根据用户名查询用户信息
  FindUserName: async (username) => {
    const sql = `select * from ${TableName} where username = ?`;
    return await db.query(sql, [username]);
  },
  // 连接数据库插入用户信息
  Register: async (username, pwd) => {
    const sql = `insert into ${TableName} values(null,?,?,null)`;
    return await db.query(sql, [username, password]);
  }
}