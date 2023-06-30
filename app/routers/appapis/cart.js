const appCartController = require('../../controllers/app_cart_controller')


module.exports =(router) => {
  router
    .post('/cart/add', appCartController.AddCart)
    .post('/cart/goodsdel', appCartController.DeleteGoods)
    .get('/cart/list', appCartController.ListCart)
}