const path = require('path');

const PRODUCTION = "production";
const DEVELOPMENT = "development";

const areWeInProduction = process.env.NODE_ENV == PRODUCTION;

module.exports = {
  entry: './javascript/index.js',
  mode: areWeInProduction === true ? PRODUCTION : DEVELOPMENT,
  output: {
    filename: 'site.js',
    path: path.resolve(__dirname, 'wwwroot/js'),
  },
};
