const { Server } = require("socket.io");
const logger = require("../libs/logger");
const ioService = require("./ioservice");
const moment = require("moment");


const ioServerConf = {
  pingInterval: 10000, // 设置心跳间隔（单位：毫秒）
  pingTimeout: 5000, // 设置心跳超时时间（单位：毫秒）
  cors: {
    origin: [
      "http://localhost:3000",
      "http://localhost:8080",
      "http://localhost:8081"
    ]
  }
}

/**
 * 初始化 socket 服务
 * @param {*} app koa app
 */
function init_socket_server( server ){
  
  const io = new Server(server,ioServerConf);

  io.use(require('../middleware/socket/jwt'));

  // 在线用户
  let ON_LINE_USER_MAP = {}

  io.on('connection', async (socket) => {
    const count = io.engine.clientsCount;
    const all_clients = io.engine.clients;
    const socketId = socket.id; // 客户端的 socket.id

    let userId = socket.user.userId || ""
    let userName = socket.user.userName || ""
    
    logger.log("socket::: soctet.user ", socket.user)

    // 在线用户 MAP 连接覆盖
    // 暂不允许多端在线 如果考虑多端在线 
    ON_LINE_USER_MAP[userId] = {
      userName,
      userId,
      socketId,
    }
    logger.log(`socket:::  用户 userName: ${userName} userId: ${userId} clients_socketId:${socketId} 连接成功; connection num: ${count}`);
    logger.log('socket:::  所用连接 servers io.engine.all_clients ids ::', Object.keys(all_clients))
    // console.log('所用连接 io.engine.all_clients ::', all_clients)
    let {roomList} = await ioService.List({user_id: socket.user.userId}) 
    // 将socket加入到这个用户 所有所在群中
    let usersAllRoomList = roomList.map(i=>i.id)
    socket.join(usersAllRoomList); 
    
    // 用户登陆 返回联系我们页面初始化信息
    socket.on('init info', async () => {
      let {list} = await ioService.List({user_id: socket.user.userId}) 
      io.to(socketId).emit('init info', list);
      logger.log(`io.emit ::: ${'init info: '}`, list)
    })

    // 历史聊天信息初始化
    socket.on('init chat', async ({id, type}) => {
      // 查询聊天记录
      let list = await ioService.ListMsgs({id, type})
      let msgList = list.map(i => {
        return {
          id: i.id,
          text: i.content,
          send: i.sender_id == userId,
          headimgurl:i.sender?.headimgurl,
          datetime: moment(i.created_at).format("YYYY-MM-DD HH:mm:ss"),
        }
      })
      
      // 返回聊天信息
      io.to(socketId).emit('init chat', msgList);
      logger.log(`io.emit ::: ${'init chat: '}`, msgList)
    })

    // 监听客户端的心跳事件
    //  heartbeat
    //  心跳处理逻辑
    socket.on('heartbeat', () => {
      console.log(`${new Date()} heartbeat: userName: ${socket.handshake.query.userName || ""} userId: ${socket.handshake.query.userId || ""} socketId: ${socketId}`);
    });

    // 发送私人消息给特定的连接
    socket.on('private message', async ({message, toUserId, id }) => {
      console.log('---11---:', {message, toUserId, id })
      let targetSocketId = ON_LINE_USER_MAP[toUserId] ? ON_LINE_USER_MAP[toUserId].socketId : "" // 暂不考虑离线情况
      let senderSocketId = ON_LINE_USER_MAP[userId] ? ON_LINE_USER_MAP[userId].socketId : "" // 暂不考虑离线情况
      let uMap  = await ioService.GetMapByUserIds([userId, toUserId]) // 效率低可以缓存，或前端处理
      let datetime = moment().format("YYYY-MM-DD HH:mm:ss")
      let sendMsg = {
        text: message, 
        send: true, 
        headimgurl: uMap[userId]?.headimgurl,
        datetime
      }
      let targetMsg = {
        text: message, 
        send: false, 
        headimgurl: uMap[userId]?.headimgurl,
        datetime
      }
      console.log('22222 sendMsg,targetMsg::', sendMsg,targetMsg)
      // 发送私人消息给指定的连接
      if(senderSocketId){
        io.to(senderSocketId).emit('private message', sendMsg);
        logger.log(`io.emit ::: ${'private message'} '`,sendMsg)
      }
      if(targetMsg){
        io.to(targetSocketId).emit('private message', targetMsg);
        logger.log(`io.emit ::: ${'private message '}`, targetMsg)
      }
      let msg = {
        id,
        type: 'conv',
        sender_id: userId,
        receiver_id: toUserId,
        content: message,
      }
      console.log('3333', msg)
      // 异步持久化
      ioService.AddMessage(msg)
    });

    socket.on('room message', async({message,id}) => { // 群聊天
      let uMap  = await ioService.GetMapByUserIds([userId]) // 效率低可以缓存，或前端处理
      let datetime = moment().format("YYYY-MM-DD HH:mm:ss")
      let sendMsg = {
        text: message, 
        send: true, 
        headimgurl: uMap[userId]?.headimgurl,
        datetime
      }

      io.to(id).emit('room message', sendMsg);
      logger.log(`io.emit :: ${'room message'} room: ${id}`, sendMsg)
      ioService.AddMessage({
        room_id: id,
        type: 'room',
        sender_id: userId,
        content: message,
      })
    });

    // 全域广播消息
    socket.on('broadcast message', (msg) => {
      logger.log('broadcast message:::', msg)
      io.emit('broadcast message', msg);
    });

    // 异常
    socket.on('error', (error) => {
      logger.error('Socket.IO error:', error);
      // 进行错误处理
    });

    // 离线
    socket.on('disconnect', (reason) => {
      // ON_LINE_USER_MAP 中删除在线用户
      console.log('有用户断开 ... 断开原因 : ',reason, socket.id);
      let uItem = ON_LINE_USER_MAP[socket.id] || {}
      // delete ON_LINE_USER_MAP[socket.id]
      io.to(usersAllRoomList).emit("user disconnect",uItem.userId)
    });
  });

}

module.exports = init_socket_server

