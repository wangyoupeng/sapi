const jwt = require('jsonwebtoken');

// 密钥，用于解析验证 JWT
const secretKey = 'secret_key_8w_wyp';

const generateToken = (payload, expiresIn = '1h') => {
  return jwt.sign(payload, secretKey, { expiresIn });
};

const verifyToken = (token) => {
  try {
    const decoded = jwt.verify(token, secretKey);
    return decoded;
  } catch (error) {
    console.log("verifyToken error :::: ",error);
    return null;
  }
};

module.exports = { generateToken, verifyToken };