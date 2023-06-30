const imageModel = require('../models/imageModel');
const fs = require('fs');
const multer = require('koa-multer');

async function uploadImg(ctx){
  console.log("--------------- 000 -----------------")
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
  console.log(" ctx.req.file ::::: ",  ctx.req.file )
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
}