/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// console.log('Hello World from Webpacker')
// Support component names relative to this directory:
var componentRequireContext = require.context("components", true)

require("jquery")
require("trix")
require("@rails/actiontext")

require('components/sortable')

import "chartkick/chart.js"

import "bootstrap"

import '../stylesheets/application'

//document.addEventListener("turbolinks:load", function() {
//  //$('[data-toggle="tooltip"]').tooltip();
//  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-toggle="tooltip"]'))
//  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
//  return new bootstrap.Tooltip(tooltipTriggerEl, {
//  boundary: document.body // or document.querySelector('#boundary')
//})
// });
//jQuery(document).ready(function () {
//  jQuery('[data-toggle="tooltip"]').tooltip();
//});
