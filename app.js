const Koa = require('koa');
const path = require('path');
const KoaStatic = require('koa-static');
const KoaBody = require('koa-body');
const checkJwt = require('./app/middleware/jwt');
const config = require('config');
const logger = require('./app/libs/logger')


let app = new Koa();

const cors = require('koa2-cors');
app.use(cors({
  origin: '*'
}));

// 处理异常
const catchError = require('./app/middleware/error');
app.use(catchError()); 


// 全局api log
const toplog = require('./app/middleware/toplog');
app.use(toplog);

// 处理请求体数据
const koaBodyConfig = require('./app/middleware/koaBodyConfig');
app.use(KoaBody(koaBodyConfig,{}));

const bodyParser = require('koa-bodyparser');
app.use(bodyParser());

// // 为静态资源请求重写url
const rewriteUrl = require('./app/middleware/rewriteUrl');
app.use(rewriteUrl);

// // 使用koa-static处理静态资源
app.use(KoaStatic(path.resolve('./public')));

// // 限流 三方
// const rateLimit = require('./app/middleware/rateLimit');
// app.use(rateLimit)

const rateLimitmy = require('./app/middleware/rateLimitMy');
app.use(rateLimitmy({limit: 1000 , interval: 10000}))

// const cacheMiddlware = require("./app/middleware/cache");
// app.use(cacheMiddlware) // 已单独注册到 /goods 路由 不再全局注册


// // 图片处理 alioss
const uploadApi = require('./app/routers/upload.js');
app.use(uploadApi())


// login 路由注册
const authApi = require('./app/routers/auth.js');
app.use(authApi())


// authJwtMiddleware 登陆即权限检查
app.use(checkJwt) // 白名单

const appApis = require('./app/routers/appapis.js');
app.use(appApis()); // 

// cms API 路由
const cmsApis = require('./app/routers/cmsapis.js');
app.use(cmsApis());

app.listen(config.app.port, () => {
  logger.log(`server start at env: ${ config.app.env }  port: ${ config.app.port }`);
});