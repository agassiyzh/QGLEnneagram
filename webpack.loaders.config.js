var path = require('path');

var ExtractTextPlugin = require("extract-text-webpack-plugin");

var sassCommonConfig = "includePaths[]=" + path.resolve(__dirname, "./node_modules/compass-mixins/lib")

module.exports = [
    { test: /\.css$/, loaders: ['style', 'css']},
    { test: /\.cjsx$/, loaders: ['coffee', 'cjsx']},
    { test: /\.coffee$/, loader: 'coffee' },
    { test: /\.eot$/, loader: "file-loader" },
    {
        test: /\.sass$/,
        loader: ExtractTextPlugin.extract("style", "css!sass?indentedSyntax=sass&" + sassCommonConfig)
    },
    {
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract("style", "css!sass?" + sassCommonConfig)
    },
    {
        test: /\.less$/,
        loader: ExtractTextPlugin.extract("style-loader", "css-loader!less-loader")
    }
];
