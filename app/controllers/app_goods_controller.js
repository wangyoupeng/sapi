
const goodsModel = require('../models/goods_model');
const spuModel = require('../models/spus_model');
const group_spuModel = require('../models/group_spu_model');
const { sendApiResult } = require('../libs/util');

async function list(ctx){
  const { filterText,group, pageSize = 5, currentPage = 1 } = ctx.query;
  // 参数校验 TODO
  let params = { pageSize,currentPage }
  if(filterText) params.filterText = filterText
  if(group && group !== '0'){
    // params.group = parseInt(group)
    let groupSpuListRes = await group_spuModel.ListByGroupId({group_id: group})
    // 查出 skuids
    let skuIdList = groupSpuListRes.list.map(item => item.spu_id)
    // 放入params
    if(skuIdList.length > 0){
      params.idList = skuIdList
    } else {
      params.idList = [11]
    }
  }
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
async function listSpus(ctx){
  const { filterText,group, pageSize = 5, currentPage = 1 } = ctx.query;
  // 参数校验 TODO
  let params = { pageSize,currentPage }
  if(filterText) params.filterText = filterText
  if(group && group !== '0'){
    // params.group = parseInt(group)
    let groupSpuListRes = await group_spuModel.ListByGroupId({group_id: group})
    let spuIdList = groupSpuListRes.list.map(item => item.spu_id)
    // 放入params
    if(spuIdList.length > 0){
      params.idList = spuIdList
    } else {
      params.idList = [11]
    }
  }
  let {list, count} = await spuModel.List(params)
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
  list,
  listSpus,
}