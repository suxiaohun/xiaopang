const { environment } = require('@rails/webpacker');

const webpack = require('webpack');
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery',
        Popper: ['popper.js', 'default']
    })
);
environment.plugins.prepend('env',
    new webpack.DefinePlugin({
        'NODE_ENV': JSON.stringify(process.env.NODE_ENV)
        // 'NODE_ENV': '123'
    })
);

// var copyWebpackPlugin = require('copy-webpack-plugin');
//
// environment.plugins.prepend('env',
//     new copyWebpackPlugin([
//         { from: './node_modules/tinymce/plugins', to: './plugins' },
//         { from: './node_modules/tinymce/themes', to: './themes' },
//         { from: './node_modules/tinymce/skins', to: './skins' }
//     ])
//
// );


// const config = {
//     module: {
//         loaders: [
//             {
//                 test: require.resolve('tinymce/tinymce'),
//                 loaders: [
//                     'imports?this=>window',
//                     'exports?window.tinymce'
//                 ]
//             },
//             {
//                 test: /tinymce\/(themes|plugins)\//,
//                 loaders: [
//                     'imports?this=>window'
//                 ]
//             }
//         ]
//     }
// };



module.exports = environment;
