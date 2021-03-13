import path from "path";
import HtmlWebpackPlugin from "html-webpack-plugin";

const src = path.resolve(__dirname, "src");
const dist = path.resolve(__dirname, "dist");
const ReactRefreshWebpackPlugin = require("@pmmmwh/react-refresh-webpack-plugin");

export default {
  mode: "development",
  entry: src + "/index.jsx",

  output: {
    path: dist,
    filename: "bundle.js",
  },

  module: {
    rules: [
      {
        test: /\.jsx$/,
        exclude: /node_modules/,
        use: [
          {
            loader: "babel-loader",
            options: { plugins: ["react-refresh/babel"] },
          },
        ],
      },
    ],
  },

  resolve: {
    extensions: [".js", ".jsx"],
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: src + "/index.html",
      filename: "index.html",
    }),
    new ReactRefreshWebpackPlugin(),
  ],

  devServer: {
    contentBase: dist,
    hot: true,
    open: true,
    port: 8080,
    host: "0.0.0.0",
  },

  watchOptions: {
    poll: 1000,
  },
};
