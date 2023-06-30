const imageModel = require('../models/imageModel');
const fs = require('fs');

async function uploadImg(ctx){
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