/*
 * @Description: 汇总模块子路由
 */
const Router = require('koa-router');

let Routers = new Router({ prefix: '/api/v1' });

// ********** app routers ***********
const userRouter = require('./userRouter');
const resourcesRouter = require('./resourcesRouter');
const productRouter = require('./productRouter');
const shoppingCartRouter = require('./shoppingCartRouter');
const orderRouter = require('./orderRouter');
const collectRouter = require('./collectRouter');
Routers.use(userRouter.routes());
Routers.use(resourcesRouter.routes());
Routers.use(productRouter.routes());
Routers.use(shoppingCartRouter.routes());
Routers.use(orderRouter.routes());
Routers.use(collectRouter.routes());

module.exports = Routers;