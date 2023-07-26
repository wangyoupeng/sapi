async function midd(ctx, next) {
  // 设置允许的跨域来源
  ctx.set('Access-Control-Allow-Origin', '*');
  
  // 设置允许的请求方法
  ctx.set('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
  
  // 设置允许的请求头
  ctx.set('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  
  // 允许发送跨域凭证（如 Cookie）
  ctx.set('Access-Control-Allow-Credentials', true);
  
  // 处理预检请求（OPTIONS 请求）
  if (ctx.method === 'OPTIONS') {
    // 设置预检请求的有效期（单位：秒）
    ctx.set('Access-Control-Max-Age', '86400');
    // 返回 204 No Content 状态码表示预检成功
    ctx.status = 204;
  } else {
    // 继续处理实际请求
    await next();
  }
}

module.exports = midd