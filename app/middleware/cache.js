
const redis = require('../libs/redis');

// 应用 / 路由级别 Redis 缓存中间件
// 注意不要重复注册
async function cacheMiddleware(ctx, next) {
  // ctx.request.body
  if(ctx.request.method === 'GET'){
    const allParams = { ... ctx.query ||{}, ...ctx.params || {}}
    const cacheKey = `cache_${ctx.url}_${JSON.stringify(allParams)}`;
    // 尝试从 Redis 中获取缓存数据
    const cacheData = await redis.get(cacheKey)
    if (cacheData) {
      console.log("cache ....  命中缓存 .... ", ctx.body)
      // 如果有缓存数据，则直接返回缓存数据
      ctx.body = JSON.parse(cacheData);
    } else {
      // 否则，执行下一个中间件
      await next();
      // 判断 结果正确才缓存， 失败不缓存
      if(ctx.body && (ctx.body.message == 'ok' || ctx.body.message == 'OK')){
        console.log("cache .... 缓存结果.... ")
        // 将响应结果存储到缓存中，设置过期时间为 15s
        await redis.setWithExpiration(cacheKey, JSON.stringify(ctx.body), 15) // 缓存15s
      }
    }
  } else {
    await next()
  }
  
}

module.exports = cacheMiddleware
