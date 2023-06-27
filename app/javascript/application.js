// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "@rails/request.js"
import Rails from "@rails/ujs"
Rails.start()

import "jquery"

import 'popper.js'
import 'bootstrap'

import 'jquery-ui'

import 'trix'
import '@rails/actiontext'
import "chartkick"
import "Chart.bundle"

import { Application } from '@hotwired/stimulus'
const application = Application.start()

import Sortable from 'stimulus-sortable'
application.register('sortable', Sortable)

// Import and register all TailwindCSS Components
//import { Alert, Autosave, Dropdown, Modal, Tabs, Popover, Toggle, Slideover } from "tailwindcss-stimulus-components"
//application.register('alert', Alert)
//application.register('autosave', Autosave)
//application.register('dropdown', Dropdown)
//application.register('modal', Modal)
//application.register('tabs', Tabs)
//application.register('popover', Popover)
//application.register('toggle', Toggle)
//application.register('slideover', Slideover)

$(document).ready(function() {

    $('[data-bs-toggle="tooltip"]').tooltip();
    $('[data-bs-toggle="popover"]').popover();

})

import "controllers"
