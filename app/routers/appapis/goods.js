const appGoodsController = require('../../controllers/app_goods_controller')
const appGroupsController = require('../../controllers/app_groups_controller')

// 缓存 get端请求
const cacheMiddlware = require("../../middleware/cache");

module.exports =(router) => {
  router
    .get('/goods', appGoodsController.list)
    .get('/groups', appGroupsController.list)
}