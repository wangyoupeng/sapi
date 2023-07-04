
const redis = require('ioredis');

const redisOption = {
  host: "127.0.0.1",
  prot: 6379
}

const opt = { ...redisOption };

console.log('load-redis-option', JSON.stringify(opt));

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
