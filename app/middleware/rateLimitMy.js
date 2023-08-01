// const {set, get, setWithExpiration} = require("../libs/redis")
const redis = require("../libs/redis.js")
// let { limit, interval } = require("config").ratelimit
let ratelimit = require("config").ratelimit
const { sendApiResult } = require('../libs/util');
/**
 * 
 * @param {*} lim 自定义限制次数 默认走config
 * @param {*} inter 自定义时间长度 单位 ms 默认走config
 * @returns 
 */
module.exports = (conf = {}) => {
  let {limit , interval, key = "", isAddUserId = false} = conf
  if(!limit) limit = ratelimit.limit;
  if(!interval) interval = ratelimit.interval;
  
  return async (ctx, next) => {
    let keyt = ""
    // 配置参数处理
    if(isAddUserId){
      keyt = `${'ratelimit'}:${key}:${ctx.state.user?.userId || "1111"}`
    } else {
      keyt = `${'ratelimit'}:${key}`;
    }
    
    // console.log('---11--:',key, limit , interval)
  // 从 Redis 中获取令牌桶数据
    let cacheStr = await redis.get(keyt)
    if (!cacheStr) cacheStr = `0_${limit}`
    let [countTimestampStr, buckets] = cacheStr.split('_')

    // 计算当前时间与上次限流时间的时间间隔
    const now = Date.now();
    let countTimestamp = parseInt(countTimestampStr); // 容错
    let remaining = parseInt(buckets)

    if (now < countTimestamp && remaining < 1) {
      // 限流：时间间隔内请求超过限制
      // ctx.throw(429, 'Rate Limit Exceeded');
      sendApiResult(ctx, {code: 429, message: 'Rate Limit Exceeded'})
      return;
    } else {
      // let nextInterval = interval;
      if(now >= countTimestamp){
        // 请求通过，重置
        remaining = Math.max(0, limit - 1)
        countTimestamp = now + interval;

      } else {
        remaining = remaining - 1
      }
      // 在 Redis 中存储更新的令牌桶数据
      console.log(keyt, `${countTimestamp}_${remaining}`)
      let ress = await redis.setWithExpiration(keyt, `${countTimestamp}_${remaining}`, parseInt(interval / 1000));
      // 添加响应头信息，用于显示令牌桶状态
      ctx.set('X-RateLimit-Limit', limit);
      ctx.set('X-RateLimit-Remaining', remaining);
      ctx.set('X-RateLimit-Reset', countTimestamp);
      
    }
    await next();
  };
};