const jwt = require('jsonwebtoken');
const moment = require('moment');
const logger = require('./logger')

// 密钥，用于解析验证 JWT
const secretKey = 'secret_key_8w_wyp';

const generateToken = (payload, expiresIn = '1h') => {
  return {
    token: jwt.sign(payload, secretKey, { expiresIn }),
    exp:  moment().add(1, 'hour').unix()
  }
};
const generateRefreshToken = (payload, expiresIn = '24h') => {
  return {
    token: jwt.sign(payload, secretKey, { expiresIn }),
    exp: moment().add(24, 'hour').unix()
  }
};

const verifyToken = (token) => {
  try {
    const decoded = jwt.verify(token, secretKey);
    // decoded::: { userId: 10004, userName: 'wyp', iat: 1689300795, exp: 1689304395 }
    return decoded;
  } catch (error) {
    logger.log("verifyToken error ,token 过期了 .. ");
    return null;
  }
};

module.exports = { generateToken, verifyToken, generateRefreshToken };