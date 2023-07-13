
const controller = require('../../controllers/cms_groups_controller')

module.exports = ( router ) => {
  router
    .post('/groups/add', controller.add)
    .get('/groups', controller.list)
    // .post('/groups/edit', controller.updateById)
    // .post('/groups/delete', controller.removeById)
}