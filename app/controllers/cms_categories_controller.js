
const services = require('../services/cms_categories');
const { sendApiResult } = require('../libs/util');
const logger = require('../libs/logger')

async function add(ctx){
  // 参数校验 TODO
  let itemInfo = {};
  itemInfo.name = ctx.request.body.name || ""
  itemInfo.description = ctx.request.body.description || ""
  let data = await services.add(itemInfo);
  sendApiResult(ctx, data)
}
async function deleteById(ctx){ // 硬删除 慎用
  // 参数校验 TODO
  let categoriesId = ctx.request.body.categories_id
  let resModel = await categoriesModel.DeleteById(categoriesId)
  sendApiResult(ctx, {})
}
async function removeById(ctx){ // 软删除
  // 参数校验 TODO
  let categoriesId = ctx.request.body.categories_id
  logger.log("aaaaaaaa :", categoriesId)
  let resModel = await categoriesModel.RemoveById(categoriesId)
  
  sendApiResult(ctx, {})
}
async function updateById(ctx){
  // 参数校验 TODO
  let categoriesId = ctx.request.body.id
  let itemInfo = {}
  let params = ctx.request.body
  if(params.hasOwnProperty("name")) itemInfo.name = params.name
  if(params.hasOwnProperty("description")) itemInfo.description = params.description
  if(params.hasOwnProperty("imageUrl")) itemInfo.image_url = params.imageUrl
  if(params.hasOwnProperty("price")) itemInfo.price = params.price
  if(params.hasOwnProperty("stock")) itemInfo.stock = params.stock
  let resModel = await categoriesModel.UpdateById(categoriesId, itemInfo)
  sendApiResult(ctx, {})
}
async function list(ctx){
  // logger.log("111")
  const { filterText, pageSize = 10, currentPage = 1 } = ctx.query;
  // 参数校验 TODO
  let params = { pageSize,currentPage }
  if(filterText) params.filterText = filterText
  // logger.log("7777")
  let {list, count} = await categoriesModel.List(params)
  // logger.log("88888")
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