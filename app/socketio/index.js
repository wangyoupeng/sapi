const { Server } = require("socket.io");
const logger = require("../libs/logger");
const ioService = require("./ioservice");


const ioServerConf = {
  pingInterval: 10000, // 设置心跳间隔（单位：毫秒）
  pingTimeout: 5000, // 设置心跳超时时间（单位：毫秒）
  cors: {
    origin: [
      "http://localhost:3000",
      "http://localhost:8080",
      "http://localhost:8080"
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
    
    let {list, roomList, convList} = await ioService.List({user_id: userId}) 
    // 将socket加入到这个用户 所有所在群中
    let usersAllRoomList = roomList.map(i=>i.id)
    socket.join(usersAllRoomList); 
    
    // 用户登陆 返回页面初始化信息
    socket.on('init info', () => {
      io.to(socketId).emit('init info', list);
    })

    // 监听客户端的心跳事件
    //  heartbeat
    //  心跳处理逻辑
    socket.on('heartbeat', () => {
      console.log(`${new Date()} heartbeat: userName: ${socket.handshake.query.userName || ""} userId: ${socket.handshake.query.userId || ""} socketId: ${socketId}`);
    });

    // 发送私人消息给特定的连接
    socket.on('private message', ({message, toUserId}) => {
      let targetSocketId = ON_LINE_USER_MAP[toUserId] ? ON_LINE_USER_MAP[toUserId].socketId : "xxx" // 暂不考虑离线情况
      // 发送私人消息给指定的连接
      io.to(targetSocketId).emit('private message', message);
    });

    // // 群聊（room）
    // socket.on('join room', (room) => { // 进入群(房间)
    //   socket.join(room);
    //   // 数据库crud todo
    // });
    // socket.on('leave room', (room) => { // 离开群
    //   socket.leave(room);
    //   // 数据库crud todo
    // });
    socket.on('room message', ({message,toRoomId}) => { // 群聊天
      io.to(toRoomId).emit('room message', message);
    });

    // 全域广播消息
    socket.on('chat message', (msg) => {
      console.log('chat message:::', msg)
      io.emit('chat message', msg);
    });

    // 异常
    socket.on('error', (error) => {
      console.log('Socket.IO error:', error);
      // 进行错误处理
    });

    // 离线
    socket.on('disconnect', (reason) => {
      // ON_LINE_USER_MAP 中删除在线用户
      console.log('有用户断开 ... 断开原因 : ',reason, socket.id);
      let uItem = ON_LINE_USER_MAP[socket.id] || {}
      delete ON_LINE_USER_MAP[socket.id]
      io.to(usersAllRoomList).emit("user disconnect",uItem.userId)
    });
  });

}

module.exports = init_socket_server

