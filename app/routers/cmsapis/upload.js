
const uploadController = require('../../controllers/uploadController')

module.exports = ( router ) => {
  router
    .post('/upload/img', uploadController.uploadImg)
}