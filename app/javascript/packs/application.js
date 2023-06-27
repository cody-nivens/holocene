require('@rails/ujs').start();
require("turbolinks").start();
require("@rails/activestorage").start();
require('jquery');

//
// CSS
import 'scss/site';

// JS
import 'js/site';

// Images
const images = require.context('../images', true);
const imagePath = (name) => images(name, true);

import magicAdd from './magicAdd.js'

