/*
 * @Description: koaBody 配置
 */
let { uploadDir } = require('../../config');
const logger = require('../libs/logger');

const koaBodyConfig = {
  multipart: true,
  parsedMethods: ['POST', 'PUT', 'PATCH', 'GET', 'HEAD', 'DELETE'], // parsedMethods默认是['POST', 'PUT', 'PATCH']
  formidable: {
    uploadDir: uploadDir, // 设置文件上传目录
    keepExtensions: true, // 保持文件的后缀
    maxFieldsSize: 10 * 1024 * 1024, // 文件上传大小限制
    onFileBegin: (name, file) => { // 文件上传前的设置
      // logger.log(`name: ${name}`);
      // logger.log(file);
    }
  }
}

module.exports = koaBodyConfig;

