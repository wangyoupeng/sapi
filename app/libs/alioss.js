const OSS = require('ali-oss')
const path = require("path")
const config = require("config")
const logger = require('./logger')

let params = {
  region: config.alioss.region,
  accessKeyId: config.alioss.accessKeyId,
  accessKeySecret: config.alioss.accessKeySecret,
  bucket: config.alioss.bucket,
}
const client = new OSS(params);

const headers = {
  // 指定Object的存储类型。
  'x-oss-storage-class': 'Standard',
  // 指定Object的访问权限。
  'x-oss-object-acl': 'private',
  // 通过文件URL访问文件时，指定以附件形式下载文件，下载后的文件名称定义为example.jpg。
  // 'Content-Disposition': 'attachment; filename="example.jpg"'
  // 设置Object的标签，可同时设置多个标签。
  'x-oss-tagging': 'Tag1=1&Tag2=2',
  // 指定PutObject操作时是否覆盖同名目标Object。此处设置为true，表示禁止覆盖同名Object。
  'x-oss-forbid-overwrite': 'true',
};

async function put ({fileName, filePath}) {
  try {
    // 填写OSS文件完整路径和本地文件的完整路径。OSS文件完整路径中不能包含Bucket名称。
    // 如果本地文件的完整路径中未指定本地路径，则默认从示例程序所属项目对应本地路径中上传文件。
    const result = await client.put(
      `/images/${new Date().getTime()}_${fileName}`,
      path.normalize(filePath)
      // 自定义headers
      ,{headers}
    );
    // 'http://bawei-wyp.oss-cn-beijing.aliyuncs.com/images/1688956708169_fangbianmian2.png'
    return `${'/images/'}${result.url.split('/images/')[1]}`
  } catch (e) {
    logger.log(e);
    throw(e)
  }
}


function viewImage(imagePath) {
  try {
    const imageUrl = client.signatureUrl(imagePath);
    // 可以将图片链接渲染到页面上或进行其他处理
    return imageUrl
  } catch (error) {
    logger.log(error);
  }
}

async function get (filepath) {
  try {
    // 填写Object完整路径和本地文件的完整路径。Object完整路径中不能包含Bucket名称。
    // 如果指定的本地文件存在会覆盖，不存在则新建。
    // 如果未指定本地路径，则下载后的文件默认保存到示例程序所属项目对应本地路径中。
    const result = await client.get(filepath);
    return result
  } catch (e) {
    console.log(e);
  }
}

module.exports = {
  put,
  viewImage,
  get
}