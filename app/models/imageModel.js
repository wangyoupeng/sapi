const db = require('./db.js');

const TABLENAME = "images"

async function InsertOne(userName, password) {
  const sql = `select * from ${TABLENAME} where userName = ? and password = ?`;
  return await db.query(sql, [userName, password]);
}
async function FindByMd5 (md5) {
  const sql = `select * from ${TABLENAME} where md5 = ?`;
  return await db.query(sql, [md5]);
}

module.exports = {
  InsertOne,
  FindByMd5
}