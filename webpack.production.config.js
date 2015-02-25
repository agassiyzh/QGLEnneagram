var path = require('path');
var webpack = require('webpack');
var loaders = require('./webpack.loaders.config');
var ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  entry: {
    app: [
      './src/scripts/router'
    ],
  },
  devtool: 'source-map',
  output: {
      path: path.join(__dirname, "public"),
      filename: "bundle.js",
  },
  resolveLoader: {
    modulesDirectories: ['..', 'node_modules']
  },
  plugins: [
    new webpack.DefinePlugin({
      // This has effect on the react lib size.
      "process.env": {
        NODE_ENV: JSON.stringify("production")
      }
    }),
    new webpack.IgnorePlugin(/vertx/),
    new webpack.IgnorePlugin(/un~$/),
    new webpack.optimize.DedupePlugin(),
    new ExtractTextPlugin("bundle.css"),
    new webpack.optimize.UglifyJsPlugin(),
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
