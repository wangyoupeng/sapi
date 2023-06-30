/*
 */
const Koa = require('koa');
const KoaStatic = require('koa-static');
const KoaBody = require('koa-body');
const checkJwt = require('./app/middleware/jwt');


let { Port, staticDir } = require('./config');


let app = new Koa();


// 处理异常
const error = require('./app/middleware/error');
app.use(error);



// 为静态资源请求重写url
const rewriteUrl = require('./app/middleware/rewriteUrl');
app.use(rewriteUrl);
// 使用koa-static处理静态资源
app.use(KoaStatic(staticDir));

// 限流
const rateLimit = require('./app/middleware/rateLimit');
app.use(rateLimit)

// 处理请求体数据
const koaBodyConfig = require('./app/middleware/koaBodyConfig');
app.use(KoaBody(koaBodyConfig));

// 全局api log
const toplog = require('./app/middleware/toplog');
app.use(toplog);

// // login 路由注册
const authApi = require('./app/routers/auth.js');
app.use(authApi())

// 图片处理
const uploadApi = require('./app/routers/upload.js');
app.use(uploadApi())


// app 路由注册 暂时做 checkJwt 校验
const appApis = require('./app/routers/appapis.js');
app.use(appApis());

// authJwtMiddleware 登陆即权限检查
app.use(checkJwt)

// cms API 路由
const cmsApis = require('./app/routers/cmsapis.js');
app.use(cmsApis());

app.listen(Port, () => {
  console.log(`服务器启动在${ Port }端口`);
});