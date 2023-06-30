const appGoodsController = require('../../controllers/app_goods_controller')

// 缓存 get端请求
const usecacheMiddlware = require("../../middleware/cache");

module.exports =(router) => {
  router
    // .post('/goods/list', cmsGoodsController.add)
    .get('/goods', appGoodsController.list) // usecacheMiddlware
}