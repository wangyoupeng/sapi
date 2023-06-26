const jwt = require('../libs/jwt');
const { sendApiResult } = require('../libs/util');

const authJwtMiddleware = async(ctx, next) => {
  const authorizationHeader = ctx.headers['authorization'];
  const token = authorizationHeader ? authorizationHeader.split(' ')[1] : null;
  console.log('000 ', token)
  if (token) {
    const decoded = jwt.verifyToken(token);
    if (decoded) {
      ctx.state.user = decoded;// payload: { userId, userName}
      await next();
    } else {
      return sendApiResult(ctx, {code: 400, message:"无效的token， 请重新登录" })
    }
  } else {
    return sendApiResult(ctx, {code: 400, message:"无效的token， 请重新登录" })
  }
  
};

module.exports = authJwtMiddleware;