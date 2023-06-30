
const { sendApiResult } = require('../libs/util');
const orderModel = require('../models/order_model');
// user_id 从前端携带的 token（jwt）中获取，放到验证中间件添加到ctx中
// 如果没有登陆，返回未登陆， 页面提示登陆；
// 接口内从ctx中获取 urer_id
// 参考后端服务, app端略去, 给定默认用户 user_id
const user_id = 10000 

module.exports = {
  OrderNew: async ctx => {
    console.log("-------000----- ctx.body :: ", ctx.body)
    // goodsVersion TODO
    // 检查库存 略
     // 下单 （事务）
    let goodsItemList = []
    // 组装参数
    orderModel.CreateWhitTransaction({ user_id, goodsItemList})
    // 生成根据order_id 保存order_item
    // 清空购物车 TODO

    ctx.body = 'ok'
  },
}