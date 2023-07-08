const { sendApiResult } = require('../libs/util');
const logger = require("../libs/logger")
// middlewares/catcherror.js
const catchError = () => {
  return async (ctx, next) => {
    try {
        await next();
    } catch(error){
      logger.log(error)
      sendApiResult(ctx, {error, message: error.message || "An unknown error occurred"})
    }
  }
}
module.exports = () => catchError