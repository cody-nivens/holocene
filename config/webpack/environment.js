const { environment } = require('@rails/webpacker');
const customConfig = require('./custom');
const webpack = require('webpack');

// resolve-url-loader must be used before sass-loader
environment.loaders.get('sass').use.splice(-1, 0, {
    loader: 'resolve-url-loader',
    options: {
        attempts: 1
    }
});

//environment.loaders.append('less', {
//    test: /\.less$/,
//    use: [
//        { loader: 'style-loader', },
//        { loader: 'css-loader', },
//        { loader: 'less-loader', },
//        ],
//      });

environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: ['popper.js', 'default']
  })
);

environment.config.merge(customConfig);

const aliasConfig = {
    'jquery': 'jquery/src/jquery'
};

environment.config.set('resolve.alias', aliasConfig);

module.exports = environment;
