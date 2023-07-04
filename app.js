const Koa = require('koa');
const KoaStatic = require('koa-static');
const KoaBody = require('koa-body');
const checkJwt = require('./app/middleware/jwt');


let { Port, staticDir } = require('./config');


let app = new Koa();

// 处理异常
const error = require('./app/middleware/error');
app.use(error());

// 全局api log
const toplog = require('./app/middleware/toplog');
app.use(toplog);



// 处理请求体数据
const koaBodyConfig = require('./app/middleware/koaBodyConfig');
app.use(KoaBody(koaBodyConfig));

// 为静态资源请求重写url
const rewriteUrl = require('./app/middleware/rewriteUrl');
app.use(rewriteUrl);

// 使用koa-static处理静态资源
app.use(KoaStatic(staticDir));

const bodyParser = require('koa-bodyparser');
app.use(bodyParser());

// 限流
// const rateLimit = require('./app/middleware/rateLimit');
// app.use(rateLimit)

const cacheMiddlware = require("./app/middleware/cache");
app.use(cacheMiddlware)


// 图片处理
const uploadApi = require('./app/routers/upload.js');
app.use(uploadApi())

const appApis = require('./app/routers/appapis.js');
app.use(appApis());

// login 路由注册
const authApi = require('./app/routers/auth.js');
app.use(authApi())


// authJwtMiddleware 登陆即权限检查
// app.use(checkJwt)

// cms API 路由
const cmsApis = require('./app/routers/cmsapis.js');
app.use(cmsApis());

app.listen(Port, () => {
  console.log(`服务器启动在${ Port }端口`);
});