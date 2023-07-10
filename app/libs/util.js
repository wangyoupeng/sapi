

const sendApiResult = (ctx, {data = {}, error, code, message = "ok"}) => {
  if (error){
    if(error.messsage) message = error.messsage
  }
  const status = code || (error ? 500 : 200);
  // ctx.status = status;
  data.status = status
  data.message = message;
  ctx.body = data;
};

module.exports =  {
  sendApiResult
}