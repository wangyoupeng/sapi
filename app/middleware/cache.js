
const redis = require('../libs/redis');
const logger = require('../libs/logger');

// 应用 / 路由级别 Redis 缓存中间件
// 注意不要重复注册
async function cacheMiddleware(ctx, next) {
  if(ctx.request.method === 'GET'){
    const allParams = { ... ctx.query ||{}, ...ctx.params || {}}
    const cacheKey = `cache_${ctx.url}_${JSON.stringify(allParams)}`;
    const cacheData = await redis.get(cacheKey)
    if (cacheData) {
      logger.log("cache ....  命中缓存 .... ", ctx.body)
      ctx.body = JSON.parse(cacheData);
    } else {
      await next();
      if(ctx.body && (ctx.body.message == 'ok' || ctx.body.message == 'OK')){
        logger.log("cache .... 缓存结果.... ")
        // 将响应结果存储到缓存中，设置过期时间为 15s
        await redis.setWithExpiration(cacheKey, JSON.stringify(ctx.body), 15) // 缓存15s
      }
    }
  } else {
    await next()
  }
  
}

module.exports = cacheMiddleware
