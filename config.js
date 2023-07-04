/*
 * @Description: 全局配置信息
 */
const path = require('path');

module.exports = {
  Port: 3000, // 启动端口
  staticDir: path.resolve('./public'), // 静态资源路径
  uploadDir: path.resolve('public/uploadimgs/'), // 上传文件路径
  // 数据库连接设置
  dbConfig: {
    connectionLimit: 100,
    host: 'localhost',
    user: 'root',
    password: 'wyp137177',
    database: 'store'
  },
  errorConfig : {
    development: {
      debug: true
    },
    production: {
      debug: false
    }
  },
}