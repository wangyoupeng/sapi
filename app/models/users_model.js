/*
 * @Description: 用户模块数据持久层
 */
const db = require('./db.js');
const TableName = "users"
const crypto = require('crypto');

function getHashPwd(pwd, salt){
  return crypto.pbkdf2Sync(pwd, salt, 1000, 64, 'sha512').toString('hex');
}
// 注册时进行密码的哈希加密
function getHashPwdAndSalt(pwd) {
  const salt = crypto.randomBytes(16).toString('hex'); // 生成随机的盐值
  const hashPwd = getHashPwd(pwd, salt) // 生成哈希密码
  return { salt, hashPwd}
}
// 登录时进行密码验证
function authUser(password, hashPwd, salt) {
  // 验证密码
  const hash = getHashPwd(password, salt)
  return hash === hashPwd
  
}
async function ListByUserIds(ids = []){
  if(ids.length < 1) ids = [0]
  const uniqueIds = [...new Set(ids)];
  let idList = uniqueIds.map(i => parseInt(i))
  let sql = `select * from ${TableName} where is_del=0 `;
  sql += ` and id in (${ idList.toString() })`
  return await db.query(sql);
}


module.exports = {
  FindByName: async (username) => {
    const sql = `select id, name, pwd, salt from ${TableName} where is_del = ? and name = ?`;
    return await db.query(sql, [0, username]);
  },
  // 连接数据库根据用户名和密码查询用户信息
  FindOne: async (username, pwd) => {
    const sql = `select id, name from ${TableName} where is_del = ? and name = ? and pwd = ?`;
    return await db.query(sql, [0, username, pwd]);
  },
  // 连接数据库根据用户名查询用户信息
  FindUserName: async (username) => {
    const sql = `select * from ${TableName} where name = ?`;
    return await db.query(sql, [username]);
  },
  // 连接数据库插入用户信息
  Create: async (username, pwd, email = "") => {
    let { hashPwd, salt } = getHashPwdAndSalt(pwd)
    const sql = `insert into ${TableName} (name, pwd, salt, email) values(?,?,?,?)`;
    return await db.query(sql, [username, hashPwd, salt, email]);
  },
  getHashPwdAndSalt,
  authUser,
  ListByUserIds,
  GetMapByUserIds: async (ids = []) => {
    if(ids.length < 1) ids = [0]
    let uList = await ListByUserIds(ids)
    let uMap = {}
    uList.map(i => {
      uMap[i.id] = {
        id: i.id,
        name: i.name,
        headimgurl: i.headimgurl
      }
    })
    return uMap
  },
}