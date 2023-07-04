const rateLimit = require("koa-ratelimit");
// const { redisClient } = require("../libs/redis")
// 限制每分钟最多 100 个请求
const db = new Map();
rateLimit({
  driver: 'memory',
  db: db,
  // driver: 'redis',
  // db: redisClient,
  duration: 1000, // 设置限流的时间段，单位为毫秒
  max: 3, // 设置时间段内最多允许的请求数量
  message: "请求过于频繁，请稍后再试", // 超过限制的提示信息
  // errorMessage: "请求过于频繁，请稍后再试", // 超过限制的提示信息
});
module.exports = rateLimit