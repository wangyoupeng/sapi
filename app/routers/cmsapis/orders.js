
const cmsGoodsController = require('../../controllers/cms_orders_controller')


module.exports =(router) => {
  router
    .get('/orders/list', cmsGoodsController.OrderList)
}