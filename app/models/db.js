/*
 * @Description: 数据库连接
 */
var mysql = require('mysql');
const { dbConfig } = require('../../config');
var pool = mysql.createPool(dbConfig);


function query(sql, params) {
  console.log("======== db query sql========:::", sql)

  return new Promise((resolve, reject) => {
    // 取出链接
    pool.getConnection(function (err, connection) {

      if (err) {
        reject(err);
        return;
      }

      connection.query(sql, params, function (error, results, fields) {
        console.log(`${ sql }=>${ params }`);
        // 释放连接
        connection.release();
        if (error) {
          reject(error);
          return;
        }
        resolve(results);
      });

    });
  });
}
// 封装一个函数来执行SQL查询
// function query(sql, values) {
//   return new Promise((resolve, reject) => {
//     connection.query(sql, values, (err, results) => {
//       if (err) {
//         reject(err);
//       } else {
//         resolve(results);
//       }
//     });
//   });
// }



// 封装一个函数来开始事务
function beginTransaction() {
  return new Promise((resolve, reject) => {
    pool.getConnection((err, connection) => {
      if(err){reject(err);}
      connection.beginTransaction((beginTransaction) => {
        if (err) {
          reject(err);
        } else {
          resolve();
        }
      });
    });
  })
}

// 封装一个函数来提交事务
function commitTransaction() {
  return new Promise((resolve, reject) => {
    pool.getConnection((err, connection) => {
      if(err){reject(err);}
      connection.commit((err) => {
        if (err) {
          reject(err);
        } else {
          resolve();
        }
      });
    })
    
  });
}

// 封装一个函数来回滚事务
function rollbackTransaction(err) {
  return new Promise((resolve, reject) => {
    pool.getConnection((err1, connection) => {
      if(err1){reject(err1);}
      connection.rollback(() => {
        reject(err);
      });
    })
  });
}



// 导出对象
module.exports = {
  query,
  beginTransaction,
  commitTransaction,
  rollbackTransaction,
};
