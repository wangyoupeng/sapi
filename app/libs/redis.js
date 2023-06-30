
const redis = require('redis');

const redisOption = {
  host: "127.0.0.1",
  prot: 6379
}

const opt = { ...redisOption };

console.log('load-redis-option', JSON.stringify(opt));

const client = redis.createClient(opt);

client.on('error', (err) => { console.log(`Redis Error ${err}`, 'App'); });
client.on('ready', () => { console.log('Redis Ready Now', 'App'); });
client.on('connect', () => {});

client.setValueWithExpire = async function(k, v, expire) {
  await client.setAsync(k, v);
  await client.expireAsync(k, parseInt(expire));
};


// const cache = await client.getAsync(id);

module.exports = client;
