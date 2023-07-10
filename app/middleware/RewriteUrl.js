/*
 * @Description: 重写静态资源URL
 */
module.exports = async (ctx, next) => {
  if (ctx.url.startsWith('/public')) {
    ctx.url = ctx.url.replace('/public', '');
  }
  if (ctx.url.startsWith('/images')) {
    ctx.url = ctx.url.replace('/images', '/api/images');
  }
  await next();
}