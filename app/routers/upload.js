

let Router = require('koa-router');
let compose = require('koa-compose')

const uploadController = require('../controllers/cms_upload_controller.js')

function uploadRouter(router) {
  router
    .post('/upload/image', uploadController.uploadImage) // 上传到 ali-oss
    .post('/upload/img', uploadController.uploadImage) // 上传到本地 uploadImg
    .get('/images/:imgpath', uploadController.showImages) // 查看图片
}

function upload() {
  const router = new Router({ prefix: '/api' });
  uploadRouter(router);
  return compose([router.routes(), router.allowedMethods()]);
}

module.exports = upload
