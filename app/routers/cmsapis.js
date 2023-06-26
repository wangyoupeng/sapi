const Router = require('koa-router');
const compose = require('koa-compose')
const requireDir = require('require-dir');

const routes = requireDir('./cmsapis');

module.exports = function() {
  const router = new Router({ prefix: '/api' });
  Object.keys(routes).forEach(name => routes[name](router));
  return compose([router.routes(), router.allowedMethods()]);
}