const appCartController = require('../../controllers/app_cart_controller')
// 购物车模块 api 限流 
const rateLimitmy = require('../../middleware/rateLimitMy');

let rateLimitmyCartMidd =  rateLimitmy({limit: 10 , interval: 10000, key: 'cart', isAddUserId: true})

module.exports =(router) => {
  router
    .post('/cart/add',rateLimitmyCartMidd, appCartController.AddCart)
    .post('/cart/dec',rateLimitmyCartMidd,  appCartController.DecCart)
    .post('/cart/inc',rateLimitmyCartMidd,  appCartController.IncCart)
    .post('/cart/goodsdel',rateLimitmyCartMidd, appCartController.DeleteGoods)
    .get('/cart/list',appCartController.ListCart)
}