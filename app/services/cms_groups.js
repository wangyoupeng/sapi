
const groupsModel = require('../models/groups_model');
const { sendApiResult } = require('../libs/util');
const logger = require('../libs/logger')

async function add(itemInfo){
  // 参数校验 TODO
  let resModel = await groupsModel.Add(itemInfo);
  return {category_id: resModel.insertId}
}
async function removeById(ctx){ // 软删除
  // 参数校验 TODO
  let groupsId = ctx.request.body.groups_id
  let resModel = await groupsModel.RemoveById(groupsId)
  
  sendApiResult(ctx, {})
}
async function updateById(itemInfo){
  // 参数校验 TODO
  let groupsId = itemInfo.id
  if(params.hasOwnProperty("name")) itemInfo.name = params.name
  if(params.hasOwnProperty("description")) itemInfo.description = params.description
  let resModel = await groupsModel.UpdateById(groupsId, itemInfo)
  return {}
}
async function list({ filterText, pageSize = 10, currentPage = 1 }){
  let params = { pageSize,currentPage }
  if(filterText) params.filterText = filterText
  let {list, count} = await groupsModel.List(params)
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
  return { list: rList, total: count[0].total }
}

module.exports = {
  add,
  removeById,
  updateById,
  list,
}