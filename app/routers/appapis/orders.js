const appOrderController = require('../../controllers/app_order_controller')


module.exports =(router) => {
  router
    .post('/orders/new', appOrderController.OrderNew)
    .get('/orders/list', appOrderController.OrderList)
}