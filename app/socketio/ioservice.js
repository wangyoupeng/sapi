const conversationModel = require('../models/chat_conversation_model');
const roomModel = require('../models/chat_room_model');
const userModel = require('../models/users_model');

async function List({ user_id }){
  let roomList = await roomModel.ListRoomsByUserId({user_id})
  let convList = await conversationModel.ListFriendsByUserId({user_id})
  return {
    list: [...roomList, ...convList],
    roomList,
    convList,
  }
}
async function ListMsgs({ id, type }){
  let mList = []
  if(type === 'room'){
    mList = await roomModel.ListMessage({ id })
  } else {
    mList = await conversationModel.ListMessage({ id })
  }
  // userMap
  let userIdList = []
  mList.map( i => {
    if(i.sender_id) userIdList.push(i.sender_id)
    if(i.receiver_id) userIdList.push(i.receiver_id)
  })
  let uMap = await userModel.GetMapByUserIds(userIdList)
  let resList =  mList.map(item => {
    let itNew = {...item}
    if(item.sender_id){
      itNew.sender = uMap[item.sender_id]
    }
    if(item.receiver_id){
      itNew.receiver = uMap[item.receiver_id]
    }
    return itNew
  })
  return resList.reverse();
}
async function AddMessage({ id, type, sender_id, receiver_id, content }){
  console.log('-----444--:', {conversation_id: id, sender_id, receiver_id, content})
  if(type === 'room'){
    roomModel.AddMessage({room_id: id, sender_id, content})
  } else {
    conversationModel.AddMessage({conversation_id: id, sender_id, receiver_id, content})
  }
}
async function GetMapByUserIds(userIdList){
  let uMap = await userModel.GetMapByUserIds(userIdList)
  return uMap
}

module.exports = {
  List,
  ListMsgs,
  AddMessage,
  GetMapByUserIds,
}