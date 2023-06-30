
const uploadController = require('../../controllers/upload_controller')

module.exports = ( router ) => {
  router
    .post('/upload/img', uploadController.uploadImg)
}