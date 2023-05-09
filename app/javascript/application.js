// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "jquery"

//import $ from 'jquery';

import 'popper.js'
import 'bootstrap'

import 'jquery-ui'
//import 'jquery-ui/ui/widget'
//import './jquery-ui/ui/data'
//import './jquery-ui/ui/disable-selection'
//import './jquery-ui/ui/scroll-parent'
//import './jquery-ui/ui/widgets/sortable'
//import './jquery-ui/ui/widgets/mouse'
//import './jquery-ui/themes/base/core.css'
//import './jquery-ui/themes/base/sortable.css'

// import * as bootstrap from 'bootstrap/dist/js/bootstrap.bundle';

import 'trix'
import '@rails/actiontext'
import "chartkick"
import "Chart.bundle"
import './js/sortable';
import './js/jquery.jvectormap.min';
import './js/jquery-jvectormap-world-mill-en';

$(document).ready(function() {

    $('[data-bs-toggle="tooltip"]').tooltip();
    $('[data-bs-toggle="popover"]').popover();

})

// JS
// import 'js/site';

// Images
//const images = require.context('../images', true);
//const imagePath = (name) => images(name, true);

import "controllers"
