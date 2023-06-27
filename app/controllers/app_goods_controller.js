
const goodsModel = require('../models/goods_model');
const { sendApiResult } = require('../libs/util');

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
  list,
}