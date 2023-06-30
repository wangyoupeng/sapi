
const redis = require('ioredis');

const redisOption = {
  host: "127.0.0.1",
  prot: 6379
}

const opt = { ...redisOption };

console.log('load-redis-option', JSON.stringify(opt));

const client = redis.createClient(opt);

module.exports = {
  async set(key, value) {
    await redis.set(key, value);
  },
  
  async get(key) {
    return await redis
  },

  async setWithExpiration(key, value, seconds) {
    await redis.set(key, value, 'EX', seconds);
  },
  
  // 添加其他常见的 Redis 操作
};
