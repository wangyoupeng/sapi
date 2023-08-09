const conversationModelModel = require('../models/chat_conversation_model');
const roomModel = require('../models/chat_room_model');

async function List({ user_id }){
  let roomList = await roomModel.ListRoomsByUserId({user_id})
  let convList = await conversationModelModel.ListFriendsByUserId({user_id})
  return {
    list: [...roomList,...convList],
    roomList,
    convList,
  }
}
async function ListMsgs({ id, type }){
  
  return {}
}
async function AddMsg({ id, type, sender_id, reciver_id }){
  
  return {}
}

module.exports = {
  List,
  ListMsgs,
  AddMsg,
}