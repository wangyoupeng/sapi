
let Router = require('koa-router');
let compose = require('koa-compose')

const commonController = require('../controllers/common_controller.js')

function localAuth(router) {
  router
    // Web 应用用户登录
    .post('/login', commonController.login)
    .post('/regist', commonController.regist)
    // Web 应用用户登出
    .get('/signout', async (ctx) => {
      // todo
    });
}

function auth() {
  const router = new Router({ prefix: '/api' });
  localAuth(router);
  return compose([router.routes(), router.allowedMethods()]);
}

module.exports = auth
