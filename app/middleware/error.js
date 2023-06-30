
module.exports = async (ctx, next) => {
  try {
    await next();
  } catch (error) {
    throw error
    console.error(error);
    ctx.body = {
      code: '500',
      msg: error
    }
  }
}