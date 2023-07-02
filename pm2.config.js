// pm2 start pm2.config.js & pm2 logs sapi
module.exports = {
  apps: [
    {
      name: 'sapi',
      script: 'app.js',
      args: '--env=develop', // '--env=production',
      instances: 1, // 'max',
      autorestart: true,
      watch: false,
      max_memory_restart: '1G', // '500M'
      env_develop: { // pm2 start app.js --env develop
        NODE_ENV: 'develop', // 'production',
        PORT: 3000
      },
      // env_production: { // pm2 start app.js --env production
      //   NODE_ENV: 'production',
      //   PORT: 3000
      // },
      // env_test: { // pm2 start app.js --env test
      //   NODE_ENV: 'test',
      //   PORT: 5000,
      //   // TESTING: 'true'
      // }
    }
  ]
};