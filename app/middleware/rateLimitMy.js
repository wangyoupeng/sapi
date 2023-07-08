// const {set, get, setWithExpiration} = require("../libs/redis")
const redis = require("../libs/redis.js")

const conf = {
  limit: 10,
  interval: 10000
}
module.exports = () => {
  let limit = conf.limit;
  let interval = conf.interval;
  return async (ctx, next) => {
    const key = `ratelimit`;

  // 从 Redis 中获取令牌桶数据
    let cacheStr = await redis.get(key)
    if (!cacheStr) cacheStr = `0_${limit}`
    let [countTimestampStr, buckets] = cacheStr.split('_')

    // 计算当前时间与上次限流时间的时间间隔
    const now = Date.now();
    let countTimestamp = parseInt(countTimestampStr); // 容错
    let remaining = parseInt(buckets)

    if (now < countTimestamp && remaining < 1) {
      // 限流：时间间隔内请求超过限制
      ctx.throw(429, 'Rate Limit Exceeded');
    } else {
      // let nextInterval = interval;
      if(now >= countTimestamp){
        // 请求通过，重置
        remaining = Math.max(0, limit - 1);
        countTimestamp = now + interval;
      } else {
        remaining -= 1
      }
      // 在 Redis 中存储更新的令牌桶数据
      redis.setWithExpiration(key, `${countTimestamp}_${remaining}`, parseInt(interval / 1000));

      // 添加响应头信息，用于显示令牌桶状态
      ctx.set('X-RateLimit-Limit', limit);
      ctx.set('X-RateLimit-Remaining', remaining);
      ctx.set('X-RateLimit-Reset', countTimestamp);
      
    }
    await next();
  };
};