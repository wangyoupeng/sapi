const jwt = require('../libs/jwt');
const { sendApiResult } = require('../libs/util');
const logger = require('../libs/logger');

const authJwtMiddleware = async(ctx, next) => {
  const authorizationHeader = ctx.headers['authorization'];
  // logger.log("--------------auth 000 authorizationHeader :::", authorizationHeader)
  const token = authorizationHeader ? authorizationHeader.split(' ')[1] : null;
  // logger.log('--------------auth 111: ', token)
  if (token) {
    const decoded = jwt.verifyToken(token);
    if (decoded) {
      ctx.state.user = decoded;// payload: { userId, userName}
      await next();
    } else {
      // 更改状态 wyp 
      return sendApiResult(ctx, {code: 401, message:"无效的token， 请重新登录1" })
    }
  } else {
    return sendApiResult(ctx, {code: 401, message:"无效的token， 请重新登录2" })
  }
  
};

module.exports = authJwtMiddleware;