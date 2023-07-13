
const services = require('../services/cms_groups');
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
async function removeById(ctx){ // 软删除
  // 参数校验 TODO
  let groupsId = ctx.request.body.groups_id
  let res = await services.removeById(groupsId)
  sendApiResult(ctx, {})
}
async function updateById(ctx){
  // 参数校验 TODO
  let groupsId = ctx.request.body.id
  let itemInfo = {}
  let params = ctx.request.body
  if(params.hasOwnProperty("name")) itemInfo.name = params.name
  if(params.hasOwnProperty("description")) itemInfo.description = params.description
  let res = await services.updateById(groupsId, itemInfo)
  sendApiResult(ctx, {})
}
async function list(ctx){
  const { filterText, pageSize = 10, currentPage = 1 } = ctx.query;
  let params = { pageSize,currentPage }
  if(filterText) params.filterText = filterText
  let {list, total} = await services.list(params)
  let rList = list.map(item => {
    return {
      id: item.id,
      name: item.name,
      description:item.description,
    }
  })
  sendApiResult(ctx, {data: { list: rList, total }})
}

module.exports = {
  add,
  removeById,
  updateById,
  list,
}