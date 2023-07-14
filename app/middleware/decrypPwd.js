const crypto = require('crypto');
const logger = require("../libs/logger")

// 前端js用
// function encryptText(text) {
//   const cipher = crypto.createCipher('aes-256-cbc', secretKey);
//   let encrypted = cipher.update(text, 'utf8', 'hex');
//   encrypted += cipher.final('hex');
//   return encrypted;
// }

// 解密函数
function decryptText(username, pwdd) {
  let secretKey = username+'bawei'
  const decipher = crypto.createDecipher('aes-256-cbc', secretKey);
  let decrypted = decipher.update(pwdd, 'hex', 'utf8');
  decrypted += decipher.final('utf8');
  return decrypted;
}


// 写入文件用 log4js 包来实现logger
module.exports = async (ctx, next) => {
  logger.log("login crypto---start:", ctx.request.body)
  const { username, pwd } = ctx.request.body;
  let pwdTest = decryptText(username, pwd) // 明文密码
  ctx.request.body.pwd = pwdTest;
  logger.log("login crypto---end:", ctx.request.body)
  await next();
}