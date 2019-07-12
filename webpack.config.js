const { join, resolve } = require('path')

module.exports = ({ production }) => {
  const mode = production ? 'development' : 'production'
  const output = production ? '_site/js' : 'js'

  return {
    mode,
    entry: join(__dirname, 'webpack', 'main.js'),
    output: {
      filename: '[name].js',
      path: resolve(__dirname, output)
    },
    module: {
      rules: [
        {
          test: /.js$/,
          loader: 'babel-loader',
          exclude: /node_modules/
        }
      ]
    },
    resolve: {
      extensions: ['.json', '.js']
    },
    devtool : 'source-map',
  }
}
