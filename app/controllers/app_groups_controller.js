
const groupsModel = require('../models/groups_model');
const { sendApiResult } = require('../libs/util');

async function list(ctx){
  const { filterText, pageSize = 1000, currentPage = 1 } = ctx.query;
  // 参数校验 TODO
  let params = { pageSize, currentPage }
  if(filterText) params.filterText = filterText
  let {list, count} = await groupsModel.List(params)
  let rList = list.map(item => {
    return {
      id: item.id,
      name: item.name,
      key: `${item.id}`
      // description:item.description,
      // imageUrl : item.image_url
    }
  })
  rList.unshift({id: 0, key:'0', name: "全部"})
  sendApiResult(ctx, {data: { list: rList, total: count[0].total }})
}

module.exports = {
  list,
}