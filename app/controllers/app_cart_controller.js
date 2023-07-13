
const { sendApiResult } = require('../libs/util');
const logger = require('../libs/logger')
const cartModel = require('../models/cart_model');
const goodsModel = require('../models/goods_model');
// const productDao = require('../models/productModel');

// user_id 从前端携带的 token（jwt）中获取，放到验证中间件添加到ctx中
// 如果没有登陆，返回未登陆， 页面提示登陆；
// 接口内从ctx中获取 urer_id
// 参考后端服务, app端略去, 给定默认用户 user_id
const user_id = 10000 

module.exports = {
  AddCart: async ctx => {
    let { goods_id, amount } = ctx.request.body;
    let findRes = await cartModel.Find({user_id, goods_id});
    if(findRes.length == 0){
      addRes = await cartModel.Insert({user_id, goods_id, amount});
    } else if(findRes.length > 0){
      addRes = await cartModel.AddAmount({user_id, goods_id, amount})
    }
    sendApiResult(ctx, {})
    return;
  },
  // 收藏减数量
  DecCart: async ctx => {
    let { goods_id = 'xxx', amount = -1 } = ctx.request.body;
    let findRes = await cartModel.Find({user_id, goods_id});
    await cartModel.AddAmount({user_id, goods_id, amount})
    sendApiResult(ctx, {})
    return;
  },
  IncCart: async ctx => {
    let { goods_id = 'xxx', amount = 1 } = ctx.request.body;
    await cartModel.AddAmount({user_id, goods_id, amount})
    sendApiResult(ctx, {})
    return;
  },
  /**
   * 获取用户的所有收藏商品信息
   * @param {Object} ctx
   */
  ListCart: async ctx => {
    // 获取所有收藏信息
    const resList = await cartModel.List({user_id});
    let goodsList = await goodsModel.ListByIds(resList.map(i=>i.goods_id))
    let goodsMap = {}
    for( let i of goodsList){
      goodsMap[i.id] = i
    }
    let rList = resList.map(item => {
      return {
        id: item.goods_id,
        name: item.name,
        amount: item.amount,
        imageUrl : goodsMap[item.goods_id]?.image_url,
        price: item.price
      }
    })
    sendApiResult(ctx, {data: { list: rList }})
    
  },
  /**
   * 删除用户的收藏商品信息
   * @param {Object} ctx
   */
  DeleteGoods: async ctx => {
    let { goods_id } = ctx.request.body;

    // 判断该用户的收藏列表是否存在该商品
    const result = await cartModel.ClearGoods({user_id,goods_id});

    sendApiResult(ctx, {})
  }
}