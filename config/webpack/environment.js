const { environment } = require('@rails/webpacker');
const path = require('path');
environment.context = path.join(__dirname, '../../app/javascript');
module.exports = environment
