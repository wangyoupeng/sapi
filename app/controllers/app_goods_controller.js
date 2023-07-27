
const goodsModel = require('../models/goods_model');
const spuModel = require('../models/spus_model');
const skuModel = require('../models/skus_model');
const group_spuModel = require('../models/group_spu_model');
const attributeModel = require('../models/attribute_model');
const skuAttributeValueModel = require('../models/sku_attribute_value_model');
const attributeValueModel = require('../models/attribute_value_model');
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

async function spuDetail(ctx){
  let spu_id = ctx.query.spu_id || 0
  let { list } = await spuModel.List({idList: [spu_id]})
  let spuVo = list[0]
  let supItem = {
    id: spuVo.id,
    name: spuVo.name,
    description: spuVo.description,
    image: spuVo.image_url,
  }
  let attributeListRes  = await attributeModel.ListBySpuId(spu_id)
  let attributeList = attributeListRes.list;
  // supItem.attributes = attributeList;
  let attributeValueList = []
  let attributeIdoptionsMap = {}
  if(attributeList.length < 1){ // spu没有属性
    supItem.attributes = []
  } else { // spu 有属性
    let attributeValuesRes = await attributeValueModel.List({
      attribute_ids:attributeList.map(i=>i.id)
    })
    for(let item of attributeValuesRes.list){
      let it = {
        id: item.id,
        name: item.value,
        value: item.value,
      }
      if(attributeIdoptionsMap[item.attribute_id]){
        attributeIdoptionsMap[item.attribute_id].push(it)
      } else {
        attributeIdoptionsMap[item.attribute_id] = [it]
      }
    }
    supItem.attributes = attributeList.map((item) => {
      return {
        id:item.id,
        name: item.name,
        options: attributeIdoptionsMap[item.id],
        selected: attributeIdoptionsMap[item.id] ? attributeIdoptionsMap[item.id][0]?.id : ""
      }
    })
  }
  let skuListRes = await skuModel.ListBySpuId(spu_id)
  let skuList = skuListRes.list
  let sku_ids = skuList.map( i=> i.id)
  let attListRes = await skuAttributeValueModel.List({sku_ids})
  let attList = attListRes.list
  let attMap = {}
  let attNameMap = {}
  if(attList.length > 0){
    for(let item of attList){
      if(attMap[item.sku_id]){
        attMap[item.sku_id].push(item.attribute_value_id)
        attNameMap[item.sku_id] += `~${item.value}`
      } else {
        attMap[item.sku_id] = [item.attribute_value_id]
        attNameMap[item.sku_id] = `~${item.value}`
      }
    }
  }
  skuList = skuList.map((item) => {
    return {
      id: item.id,
      spu_id:item.spu_id,
      image: item.image_url,
      name: `${item.name}${attNameMap[item.id] || ''}`,
      price: item.price,
      stock: item.stock,
      attribute_value_ids:attMap[item.id] || []
    }
  })


  sendApiResult(ctx, {data: { item: supItem, skuList }})
}

module.exports = {
  list,
  listSpus,
  spuDetail,
}