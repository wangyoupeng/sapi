const imageModel = require('../models/image_model');
const fs = require('fs');
const multer = require('koa-multer');
const logger = require('../libs/logger')
const { put, viewImage } = require('../libs/alioss');
const { sendApiResult } = require('../libs/util');
async function showImages(ctx){
  let { imgpath } = ctx.params
  // ctx.status = 302;
  let url = viewImage(`/images/${imgpath}`)
  ctx.redirect(url);
}
async function uploadImage(ctx){
  const file = ctx.request.files.file;
  const name = file.name;
  const resultUrl = await put({fileName: name, filePath: file.path});
  ctx.body = {
    code: 0,
    message: "上传成功",
    data: {
      url: resultUrl
    }
  };
}
async function uploadImg(ctx){
  // 定义存储配置
  const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, '../../public/uploadimgs/'); // 指定上传文件的存储目录
    },
    filename: function (req, file, cb) {
      cb(null, Date.now() + '-' + file.originalname); // 自定义文件名，避免重复
    }
  });
  // 创建 multer 实例
  const upload = multer({ storage });
  upload.single('image'), (ctx) => {
    const file = ctx.req.file; // 获取上传的文件信息
  
    if (!file) {
      ctx.body = '没有上传文件';
    } else {
      ctx.body = '文件上传成功';
    }
  }
  logger.log(" ctx.req.file ::::: ",  ctx.req.file )
  ctx.body = {
    code: 0,
    message: "上传成功",
    data: {
      url: `${ctx.request.files.file.path.split("public")[1]}`
    }
  };
}
module.exports = {
  uploadImg,
  uploadImage,
  showImages,
}