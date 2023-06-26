const moment = require('moment')

module.exports = async (ctx, next) => {
  let datetimeMoment = moment()
  console.log(`${datetimeMoment.format("yyyy-MM-DD HH:mm:ss.SSS")} ${ctx.request.method}  ${ctx.path} , ${JSON.stringify(ctx.request.body || {})}`)
  const countTime = datetimeMoment.valueOf();
  await next();
  let datetimeEndMoment = moment()
  console.log(`${datetimeEndMoment.format("yyyy-MM-DD HH:mm:ss.SSS")} res: ${ctx.path} ${ datetimeEndMoment.valueOf() - countTime }ms`, JSON.stringify(ctx.response || {}))
}