const moment = require('moment')
const logger = require("../libs/logger.js")


// 写入文件用 log4js 包来实现logger
module.exports = async (ctx, next) => {
  if(ctx.path.indexOf("images") > -1){
    await next();
  } else {
    let datetimeMoment = moment()
    logger.log(`${ctx.request.method}  ${ctx.path} , ${JSON.stringify(ctx.request.body || {})}`)
    const countTime = datetimeMoment.valueOf();
    await next();
    let datetimeEndMoment = moment()
    logger.log(`res: ${ctx.path} ${ datetimeEndMoment.valueOf() - countTime }ms`, JSON.stringify(ctx.response || {}))
  }
  
}