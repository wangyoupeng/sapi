
const redis = require('ioredis');
const config = require('config');
const logger = require('./logger')


const opt = { ...config.redis };

logger.log('init_redis_connected: ', JSON.stringify(opt));

const client = redis.createClient(opt);

async function set(key, value) {
  await client.set(key, value);
}

async function get(key) {
  return await client.get(key)
}

async function setWithExpiration(key, value, seconds) {
  await client.set(key, value, 'EX', seconds);
}
module.exports = {
  set,
  get,
  setWithExpiration,
  redisClient: client,
}
