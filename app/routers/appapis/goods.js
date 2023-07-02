const appGoodsController = require('../../controllers/app_goods_controller')

// 缓存 get端请求
const cacheMiddlware = require("../../middleware/cache");

module.exports =(router) => {
  router
    // .post('/goods/list', cmsGoodsController.add)
    .get('/goods', appGoodsController.list)
    // .get('/goods',cacheMiddlware, appGoodsController.list) // with cache
}