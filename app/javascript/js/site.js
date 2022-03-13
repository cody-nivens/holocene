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
import 'js/jquery.jvectormap.min';
import 'js/jquery-jvectormap-world-mill-en';

$(document).ready(function() {
  $("a[data-bs-toggle='tooltip']").tooltip({ html: true, container: 'body', trigger: 'hover' });
  //$("[data-toggle='popover']").popover();

//$("#new_key_point_id").prop("disabled", true); // second dropdown is disable while first dropdown is empty
$("#story_id").change(function(){
  	var story = $(this).val();
//  	if(story == ''){
//  		$("#new_key_point_id").prop("disabled", true);
//  	}else{
//  		$("#new_key_point_id").prop("disabled", false);
//  	}
  	$.ajax({
	    url: "/stories/" + story + "/key_points",
	    method: "GET",  
	    dataType: "json",
	    data: {story_id: story},
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (response) {
	      	console.log(response);
	      	var key_points = response["key_points"];
	      	$("#new_key_point_id").empty();

	      	$("#new_key_point_id").append('<option>Select Key Point</option>');
	      	for(var i = 0; i < key_points.length; i++){
	      		$("#new_key_point_id").append('<option value="' + key_points[i]["id"] + '">' + key_points[i]["hook"] + '</option>');
	      	}
	    }
  	});
});
})

