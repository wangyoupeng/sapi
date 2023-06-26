const jwt = require('../libs/jwt');
const { sendApiResult } = require('../libs/util');
const usersModel = require('../models/users_model');

async function login( ctx ){
  const { username, pwd } = ctx.request.body;
  
  // 根据用户提供的用户名和密码进行验证 数据库查询 users
  //
  let list = await usersModel.FindOne(username, pwd)
  console.log("------111---", list)
  if(list.length == 0){
    sendApiResult(ctx, { data: {}, code : 200, message: "用户/名密码错误"})
    return false;
  }
  
  let uItem  = list[0]
  let userInfo = {
    userId: uItem.id,
    userName : uItem.name
  }
  console.log("------222---", userInfo)

  // 如果验证成功，则创建 JWT 并发送响应
  const payload = { ...userInfo};
  console.log("------333---", payload)
  const token = jwt.generateToken(payload);
  console.log("------444---", token)
    sendApiResult(ctx, {data: { token, userInfo }})
}

module.exports = {
  login,
}