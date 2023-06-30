
const cmsGoodsController = require('../../controllers/cms_goods_controller')

module.exports = ( router ) => {
  router
    .post('/goods/add', cmsGoodsController.add)
    .get('/goods', cmsGoodsController.list)
    .post('/goods/edit', cmsGoodsController.updateById)
    .post('/goods/delete', cmsGoodsController.removeById)
}