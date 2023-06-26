
module.exports = async (ctx, next) => {
  try {
    await next();
  } catch (error) {
    console.error(error);
    ctx.body = {
      code: '500',
      msg: '服务器未知错误'
    }
  }
}