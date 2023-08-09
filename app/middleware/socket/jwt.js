const jwt = require('../../libs/jwt');

// 令牌校验中间件
const authJwtMiddleware = (socket, next) => {
  const token = socket.handshake.auth.token;

  if (token) {
    const decoded = jwt.verifyToken(token);
    if (decoded) {
      // 令牌有效，将解码的用户信息添加到socket对象中
      socket.user = decoded; // payload: { userId, userName}
      next();
    } else {
      // 更改状态 wyp 
      return next(new Error('Authentication error'));
    }
  } else {
    return next(new Error('Authentication error'));
  }
}

module.exports = authJwtMiddleware;