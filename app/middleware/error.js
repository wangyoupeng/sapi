
const jsonError = require("koa-json-error")
const { errorConfig } = require('../../config')

module.exports = () => {
  const env = process.env.NODE_ENV || 'development';
  const envConfig = errorConfig[env];
  return jsonError(envConfig)
}