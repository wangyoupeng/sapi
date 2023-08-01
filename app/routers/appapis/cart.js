const appCartController = require('../../controllers/app_cart_controller')

module.exports =(router) => {
  router
    .post('/cart/add', appCartController.AddCart)
    .post('/cart/dec', appCartController.DecCart)
    .post('/cart/inc', appCartController.IncCart)
    .post('/cart/goodsdel', appCartController.DeleteGoods)
    .get('/cart/list', appCartController.ListCart)
}