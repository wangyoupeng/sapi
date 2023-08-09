const appAboutusController = require('../../controllers/app_aboutus_controller')


module.exports =(router) => {
  router
    .get('/aboutus/list', appAboutusController.List)
}