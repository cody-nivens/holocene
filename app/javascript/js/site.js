import $ from 'jquery';
import 'popper.js';
import 'bootstrap/dist/js/bootstrap';

require('trix');
require('@rails/actiontext');
import 'components/sortable';
import 'chartkick/chart.js';
import 'js/jquery.jvectormap.min';

$(document).ready(function() {
  $("a[data-bs-toggle='tooltip']").tooltip({ html: true, container: 'body', trigger: 'hover' });
  //$("[data-toggle='popover']").popover();
})
