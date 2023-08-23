
const { sendApiResult } = require('../libs/util');
const orderModel = require('../models/order_model');
const cartModel = require('../models/cart_model');
const goodsModel = require('../models/goods_model');
const logger = require('../libs/logger')


async function OrderNew (ctx){
  let user_id = ctx.state.user.userId
  logger.log("------- 000000 ordernew ---- ::",ctx.request.body)
  // {
  //   list: [ { goods_id: 10001, amount: 3 }, { goods_id: 10002, amount: 2 } ],
  //   user_id: 10000
  // }
  let goodsList = ctx.request.body.list // await cartModel.List({user_id})

  let goodsIdList = []
  let goodsIdItemMap = {}
  let goodIdAmountMap = {}

  let goodsItemList = goodsList.map((item) => {
    goodsIdList.push(item.goods_id)
    goodIdAmountMap[item.goods_id] = item.amount
  })


  let goodsListAll = await goodsModel.ListByIds(goodsIdList)
  let lowStockGoodsList = []
  goodsListAll.map(item => {
    if(item.amount < goodIdAmountMap['' + item.id]){
      lowStockGoodsList.push(item.name)
    }
    let newItem = {...item, ...{amount: goodIdAmountMap['' + item.id]}}
    goodsIdItemMap[item.id] = newItem
  })
  // 检查商品删除(下架)
  if(goodsListAll.length < goodsIdList.length){ 
    return sendApiResult(ctx,{code: 400, message: `有已删除或下架商品，下单失败！`})
  }
  // 检查库存
  if(lowStockGoodsList > 0){
    return sendApiResult(ctx,{code: 400, message: `${lowStockGoodsList.toString()} 库存不足!`})
  }

  // 下单 （事务）生成order ,order_item, 扣库存
  let isok = orderModel.CreateWhitTransaction({ user_id, goodsIdItemMap, goodIdAmountMap})
  if(isok){
    await cartModel.ClearCert(user_id || 'xxxxx', goodsIdList) // 可以事务里面
  }
  sendApiResult(ctx,{})
}

async function OrderList(ctx){
  let user_id = ctx.state.user.userId
  const { filterText, pageSize = 10, currentPage = 1 } = ctx.query;
  // 参数校验 TODO
  let params = { pageSize,currentPage,user_id }
  if(filterText) params.filterText = filterText
  let {list, total} = await orderModel.List(params)
  sendApiResult(ctx, {data: { list, total }})
}

module.exports = {
  OrderNew,
  OrderList
}


