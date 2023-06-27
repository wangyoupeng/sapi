const appGoodsController = require('../../controllers/app_goods_controller')


module.exports =(router) => {
  router
    // .post('/goods/list', cmsGoodsController.add)
    .get('/goods', appGoodsController.list)
}