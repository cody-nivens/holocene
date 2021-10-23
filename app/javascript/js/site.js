import $ from 'jquery';

require('jquery-ui/ui/widget');
require('jquery-ui/ui/data');
require('jquery-ui/ui/disable-selection');
require('jquery-ui/ui/scroll-parent');
require('jquery-ui/ui/widgets/sortable');
require('jquery-ui/ui/widgets/mouse');
require('jquery-ui/themes/base/core.css');
require('jquery-ui/themes/base/sortable.css');

import 'popper.js';
require('@fortawesome/fontawesome-free/js/all');
import 'bootstrap/dist/js/bootstrap';

require('trix');
require('@rails/actiontext');
import 'chartkick/chart.js';
import 'js/sortable';
import 'js/number_pages';
import 'js/jquery.jvectormap.min';
import 'js/jquery-jvectormap-world-mill-en';

$(document).ready(function() {
  $("a[data-bs-toggle='tooltip']").tooltip({ html: true, container: 'body', trigger: 'hover' });
  //$("[data-toggle='popover']").popover();
})

