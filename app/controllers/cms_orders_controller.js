
const { sendApiResult } = require('../libs/util');
const orderModel = require('../models/order_model');
// user_id 从前端携带的 token（jwt）中获取，放到验证中间件添加到ctx中
// 如果没有登陆，返回未登陆， 页面提示登陆；
// 接口内从ctx中获取 urer_id
// 参考后端服务, app端略去, 给定默认用户 user_id
// const user_id = 10000

async function OrderList(ctx){
  const { filterText, pageSize = 10, currentPage = 1 } = ctx.query;
  // 参数校验 TODO
  let user_id = ctx.state.user.userId
  let params = { pageSize,currentPage, user_id }
  if(filterText) params.filterText = filterText
  let {list, count} = await orderModel.List(params)
  

  sendApiResult(ctx, {data: { list, total: count[0].total }})
}

module.exports = {
  OrderList
}


