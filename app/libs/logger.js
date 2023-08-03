const log4js =  require('log4js');
const conf = require('config');


/* logger */
log4js.configure({
  appenders: {
    console: {
      type : 'console'
    },
    log_file: {
      type: 'file',
      filename: '../../logs/sapi.log',
      maxLogSize : 10 * 1024 * 1024,
      backups : 10,
      encoding : 'utf-8'
    },
    date_file:{
      type: 'dateFile',
      filename: '../../logs/sapi',
      daysToKeep:30,
      pattern: '.yyyy-MM-dd.log',
      alwaysIncludePattern: true,
      encoding : 'utf-8'
    },
    error_file: {
      type: 'dateFile',
      filename: '../../logs/sapi',
      daysToKeep: 10,
      pattern: '.yyyy-MM-dd.error.log',
      alwaysIncludePattern: true,
      encoding : 'utf-8'
    }
  },
  categories: {
    default:{ appenders: ['console', 'date_file'], level:'debug' },
    production:{ appenders: ['console', 'date_file'], level:'info' }, // 生产环境 log类型 只输出到按日期命名的文件
    console:{ appenders:['console','date_file'], level:'debug' }, // 开发环境  输出到控制台
    debug:{ appenders:['console', 'date_file'], level:'debug' }, // 等同生产，实际开发环境可以不输出到 date_file
    error_log:{ appenders:['console', 'error_file'], level:'error' }
  }
});



function log4jsOutLog(msg) {
  let log4jslogger;
  switch (process.env.NODE_ENV) { //  // conf.app.env
    case 'production':
      log4jslogger = log4js.getLogger('production');
      break;
    case 'test':
      log4jslogger = log4js.getLogger('debug');
      break;
    default:
      log4jslogger = log4js.getLogger('debug');
  }
  log4jslogger.info(msg);
}

function log4jsErrorLog(errmsg) {
  let log4jslogger;
  switch (process.env.NODE_ENV) {
    case 'production':
      log4jslogger = log4js.getLogger('error_file');
      break;
    case 'test':
      log4jslogger = log4js.getLogger('error_file');
      break;
    default:
      log4jslogger = log4js.getLogger('console');
  }
  log4jslogger.error(errmsg);
}

function log(...params) {
  if (params[0] instanceof Error) {
    log4jsErrorLog(params[0]);
  } else {
    let strList = []
    strList = params.map(item => {
      if(typeof item == 'string'){
        return item
      } else {
        return JSON.stringify(item)
      }
    })
    log4jsOutLog(strList.toString());
  }
}

function error(log, story) {
  log4jsErrorLog(`${story}, ${JSON.stringify(log || "{}")}`);
}

function logWidthCtx(instance, context) {
  const msgObj = {
    instance,
    context
  };
  log4jsOutLog(msgObj);
}
module.exports = {
  log,
  logWidthCtx,
  error,
  log4jsOutLog,
  log4jsErrorLog,
}