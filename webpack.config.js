var path = require('path');
var webpack = require('webpack');
var loaders = require('./webpack.loaders.config');
var ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  entry: [
    "webpack-dev-server/client?http://0.0.0.0:8080",
    'webpack/hot/dev-server',
    './src/scripts/router'
  ],
  devtool: "eval",
  debug: true,
  output: {
    path: path.join(__dirname, "public"),
    filename: 'bundle.js'
  },
  resolveLoader: {
    modulesDirectories: ['node_modules']
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NoErrorsPlugin(),
    new ExtractTextPlugin("bundle.css"),
    new webpack.IgnorePlugin(/vertx/), // https://github.com/webpack/webpack/issues/353
    new webpack.ProvidePlugin({
      "$": "jquery"
    })
  ],
  resolve: {
    extensions: ['', '.js', '.cjsx', '.coffee', 'sass', 'scss']
  },
  module: {
    loaders: loaders
  }
};
