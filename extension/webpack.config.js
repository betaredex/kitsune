var webpack = require('webpack');

ignore = new webpack.IgnorePlugin(/^server$/);
module.exports = {
	entry: './src/index',
	output:	{
		path: './kitsune',
		filename: 'bundle.js'
	},
	resolve: {
		extensions: ['', '.coffee', '.js', '.json']
	},
	module: {
		loaders: [
			{
				test: /\.coffee$/,
				loader: 'coffee'
			},
			{
				test: /\.json$/,
				loader: 'json'
			}
		]
	},
	plugins: [
		ignore
	]
}
