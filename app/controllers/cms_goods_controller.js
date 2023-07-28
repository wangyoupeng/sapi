
const goodsModel = require('../models/goods_model');
const { sendApiResult } = require('../libs/util');
const logger = require('../libs/logger')

async function add(ctx){
  // 参数校验 TODO
  let itemInfo = {};
  itemInfo.name = ctx.request.body.name || ""
  itemInfo.description = ctx.request.body.description || ""
  itemInfo.imageUrl = ctx.request.body.imageUrl || ""
  itemInfo.price = ctx.request.body.price || 0
  itemInfo.stock = ctx.request.body.stock || 0
  let resModel = await goodsModel.Add(itemInfo);
  let data  = {goods_id: resModel.insertId}
  sendApiResult(ctx, data)
}
async function deleteById(ctx){ // 硬删除 慎用
  // 参数校验 TODO
  let goodsId = ctx.request.body.goods_id
  let resModel = await goodsModel.DeleteById(goodsId)
  sendApiResult(ctx, {})
}
async function removeById(ctx){ // 软删除
  // 参数校验 TODO
  let goodsId = ctx.query.goods_id
  logger.log("aaaaaaaa :", goodsId)
  let resModel = await goodsModel.RemoveById(goodsId)
  
  sendApiResult(ctx, {})
}
async function updateById(ctx){
  // 参数校验 TODO
  let goodsId = ctx.request.body.id
  let itemInfo = {}
  let params = ctx.request.body
  if(params.hasOwnProperty("name")) itemInfo.name = params.name
  if(params.hasOwnProperty("description")) itemInfo.description = params.description
  if(params.hasOwnProperty("imageUrl")) itemInfo.image_url = params.imageUrl
  if(params.hasOwnProperty("price")) itemInfo.price = params.price
  if(params.hasOwnProperty("stock")) itemInfo.stock = params.stock
  let resModel = await goodsModel.UpdateById(goodsId, itemInfo)
  sendApiResult(ctx, {})
}
async function list(ctx){
  const { filterText, pageSize = 10, currentPage = 1 } = ctx.query;
  // 参数校验 TODO
  let params = { pageSize,currentPage }
  if(filterText) params.filterText = filterText
  let {list, count} = await goodsModel.List(params)
  let rList = list.map(item => {
    return {
      id: item.id,
      name: item.name,
      description:item.description,
      imageUrl : item.image_url,
      price: item.price,
      stock: item.stock
    }
  })
  sendApiResult(ctx, {data: { list: rList, total: count[0].total }})
}

module.exports = {
  add,
  deleteById,
  removeById,
  updateById,
  list,
}