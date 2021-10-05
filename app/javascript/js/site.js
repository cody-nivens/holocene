import $ from 'jquery';
import 'popper.js';
import 'bootstrap/dist/js/bootstrap.bundle';

require('trix');
require('@rails/actiontext');
require('components/sortable');
import 'chartkick/chart.js';

require('components/sortable')
import "chartkick/chart.js"

$(document).ready(function() {
  $("a[data-bs-toggle='tooltip']").tooltip({ html: true, container: 'body', trigger: 'hover' });
})

