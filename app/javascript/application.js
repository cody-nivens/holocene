// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "@rails/request.js"
import "jquery"

import 'popper.js'
import 'bootstrap'

import 'jquery-ui'

import 'trix'
import '@rails/actiontext'
import "chartkick"
import "Chart.bundle"
import 'jquery.jvectormap.min';
import 'jquery-jvectormap-world-mill-en';
import 'timeline'

import { Application } from '@hotwired/stimulus'
import Sortable from 'stimulus-sortable'

const application = Application.start()
application.register('sortable', Sortable)

$(document).ready(function() {

    $('[data-bs-toggle="tooltip"]').tooltip();
    $('[data-bs-toggle="popover"]').popover();

})

import "controllers"
