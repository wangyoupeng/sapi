
let Router = require('koa-router');
let compose = require('koa-compose')
let decrypPwdMiddware = require('../middleware/decrypPwd')

const commonController = require('../controllers/common_controller.js')

function localAuth(router) {
  router
    // Web 应用用户登录
    .post('/login', decrypPwdMiddware, commonController.login)
    .post('/refresh/token', commonController.refreshtoken)
    .post('/regist', commonController.regist)
    .get('/signout', async (ctx) => {
      // 令牌黑名单(redis) 实现 TODO
    });
}

function auth() {
  const router = new Router({ prefix: '/api' });
  localAuth(router);
  return compose([router.routes(), router.allowedMethods()]);
}

module.exports = auth
