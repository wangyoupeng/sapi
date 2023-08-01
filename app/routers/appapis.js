const Router = require('koa-router');
const compose = require('koa-compose')
const requireDir = require('require-dir');

const routes = requireDir('./appapis');

// 购物车模块 api 限流 
const rateLimitmy = require('../middleware/rateLimitMy');
// rateLimitmy({limit: 1000 , interval: 10000, }) key user_id

module.exports = function() {
  const router = new Router({ prefix: '/appapi' });
  Object.keys(routes).forEach(name => routes[name](router));
  return compose([rateLimitmy({limit: 10 , interval: 10000, key: 'cart', isAddUserId: true}), router.routes(), router.allowedMethods()]);
}