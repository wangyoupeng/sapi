

const sendApiResult = (ctx, {data = {}, error, code, message = "ok"}) => {
  if (error){
    console.Error(error)
    if(error.messsage) message = error.messsage
  }
  const status = code || (error ? 500 : 200);
  ctx.status = status;
  data.message = message;
  ctx.body = data;
};

module.exports =  {
  sendApiResult
}