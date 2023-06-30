

let Router = require('koa-router');
let compose = require('koa-compose')

const uploadController = require('../controllers/cms_upload_controller.js')

function uploadRouter(router) {
  router
    .post('/upload/img', uploadController.uploadImg)
}

function upload() {
  const router = new Router({ prefix: '/api' });
  uploadRouter(router);
  return compose([router.routes(), router.allowedMethods()]);
}

module.exports = upload
