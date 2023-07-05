const jwt = require('../libs/jwt');
const { sendApiResult } = require('../libs/util');
const usersModel = require('../models/users_model');

async function login( ctx ){
  const { username, pwd } = ctx.request.body;
  
  // 根据用户提供的用户名和密码进行验证 数据库查询 users
  //
  let list = await usersModel.FindByName(username)
  if(list.length == 0){
    sendApiResult(ctx, { data: {}, code : 200, message: "用户不存在"})
    return false;
  }
  
  let uItem  = list[0]
  //验证密码
  console.log("-----11----: ",pwd, uItem.pwd, uItem.salt)
  let isPwdOk = usersModel.authUser(pwd, uItem.pwd, uItem.salt)
  console.log("-----66----: ",pwd, uItem.pwd, uItem.salt)
  if(!isPwdOk){
    sendApiResult(ctx, { data: {}, code : 200, message: "用户/名密码错误"})
    return false;
  }
  let userInfo = {
    userId: uItem.id,
    userName : uItem.name
  }
  // 如果验证成功，则创建 JWT 并发送响应
  const payload = { ...userInfo};
  const token = jwt.generateToken(payload);
  sendApiResult(ctx, {data: { token, userInfo }})
}

async function regist( ctx ){
  const { username, password, email } = ctx.request.body;
  console.log("======== 11")
  // 根据用户提供的用户名和密码进行验证 数据库查询 users
  let list = await usersModel.FindUserName(username)
  if(list.length > 0){
    sendApiResult(ctx, { data: {}, message: "用户已存在"})
    return false;
  }
  // insert user
  let insertRes = await usersModel.Create(username, password, email)
  console.log("-------- createuser insertRes : ", insertRes)
  sendApiResult(ctx, {data: {}, message: 'ok'})
}

module.exports = {
  login,
  regist,
}