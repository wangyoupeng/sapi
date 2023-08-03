
/**
 * pm2 start pm2.config.js -- env development && pm2 logs sapi // 默认启动development 环境
 * pm2 start pm2.config.js --env development && pm2 logs
 * pm2 start pm2.config.js -- env test
 * pm2 start pm2.config.js -- env production
 */
module.exports = {
  apps: [
    {
      name: 'sapi',
      script: 'app.js',
      args: '--env=development',
      instances: 2, // 'max',
      autorestart: true,
      watch: false,
      max_memory_restart: '1G', // '500M'
      env_development: {
        NODE_ENV: 'development',
        PORT: 3000
      },
      env_production: {
        NODE_ENV: 'production',
        PORT: 3030
      },
      env_test: { // pm2 start app.js --env test
        NODE_ENV: 'test',
        PORT: 3010,
        // TESTING: 'true'
      }
    }
  ]
};