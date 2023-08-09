
const { sendApiResult } = require('../libs/util');
const conversationModelModel = require('../models/chat_conversation_model');
const roomModel = require('../models/chat_room_model');


async function List(ctx){
  let user_id = ctx.state.user.userId
  let roomList = await roomModel.ListRoomsByUserId({user_id})
  let convList = await conversationModelModel.ListFriendsByUserId({user_id})
  let {list} = [...roomList,...convList]
  sendApiResult(ctx, {data: { list  }})
}

module.exports = {
  List,
}


