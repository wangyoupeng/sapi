
const cmsGoodsController = require('../../controllers/cms_goods_controller')


module.exports =(router) => {
  router
    .post('/orders/list', cmsGoodsController.add)
}