
const { sendApiResult } = require('../libs/util');
const orderModel = require('../models/order_model');

async function OrderList(ctx){
  const { filterText, pageSize = 10, currentPage = 1 } = ctx.query;
  // 参数校验 TODO
  let user_id = ctx.state.user.userId
  let params = { pageSize,currentPage, user_id }
  if(filterText) params.filterText = filterText
  let {list, total} = await orderModel.List(params)
  

  sendApiResult(ctx, {data: { list, total }})
}

module.exports = {
  OrderList
}


