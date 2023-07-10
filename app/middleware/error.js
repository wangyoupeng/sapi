const { sendApiResult } = require('../libs/util');
const logger = require("../libs/logger")
// middlewares/catcherror.js
const catchError = () => {
  return async (ctx, next) => {
    try {
      console.log('00000000000000')
        await next();
        console.log('11111111111111')
    } catch(error){
      console.log('2222222222222222')
      logger.log(error)
      sendApiResult(ctx, {error, message: error.message || "An unknown error occurred"})
    }
  }
}
module.exports = catchError