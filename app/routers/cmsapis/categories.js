
const cmsCategoriesController = require('../../controllers/cms_categories_controller')

module.exports = ( router ) => {
  router
    .post('/categories/add', cmsCategoriesController.add)
    .get('/categories', cmsCategoriesController.list)
    // .post('/categories/edit', cmsCategoriesController.updateById)
    // .post('/categories/delete', cmsCategoriesController.removeById)
}