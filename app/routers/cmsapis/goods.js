
const cmsGoodsController = require('../../controllers/cms_goods_controller')

module.exports = ( router ) => {
  router
    .post('/goods/add', cmsGoodsController.add)
    .get('/goods', cmsGoodsController.list)
    .put('/goods/edit', cmsGoodsController.updateById)
    .delete('/goods/delete', cmsGoodsController.removeById)
}