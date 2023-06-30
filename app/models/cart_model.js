
const db = require('./db.js');
const TableName = "carts"
module.exports = {
  // 连接数据库根据用户名和密码查询用户信息
  Find: async ({user_id, goods_id}) => {
    const sql = `select goods_id from ${TableName} where user_id = ? and goods_id = ?`;
    return await db.query(sql, [user_id, goods_id]);
  },
  Insert:async ({user_id, goods_id, amount = 1}) => {
    const sql = `insert into ${TableName} (user_id, goods_id, amount) values(?,?,?)`;
    return await db.query(sql, [user_id, goods_id, amount]);
  },
  AddAmount:async ({user_id, goods_id, amount}) => { // 兼容减商品
    const sql = `update ${TableName} 
      SET amount = amount + ?
      where user_id = ? and goods_id = ?`
    return await db.query(sql, [amount, user_id, goods_id]);
  },
  List: async ({user_id}) => { 
//     SELECT users.name, orders.product
// FROM users
// INNER JOIN orders ON users.id = orders.user_id;
    let sql = `select 
      carts.goods_id as goods_id, carts.amount as amount, goods.name as name, goods.image_url as imageUrl, goods.price as price 
      from ${TableName} 
      left join skus as goods on ${TableName}.goods_id = goods.id 
      where carts.user_id = ? `
    // sql += ` ORDER BY goods.create_time asc`
    let list = await db.query(sql, [user_id]);
    return list
  },
  ClearGoods: async ({user_id = 'xxxx', goods_id = 0}) => { // todo
    const sql1 = `select goods_id from ${TableName} 
      order by id desc limit 1`
    let res1 =  await db.query(sql1, []);
    const sql = `delete from ${TableName} 
      where user_id = ? and goods_id = ?`
    return await db.query(sql, [user_id, goods_id || res1[0].goods_id]);
  },
  ClearCert: async (user_id) => { // todo
    const sql = `delete from ${TableName} 
      where user_id = ?`
    return await db.query(sql, [user_id]);
  },
}