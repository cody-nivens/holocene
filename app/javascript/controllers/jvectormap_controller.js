import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from '@rails/request.js'

import 'jquery.jvectormap.min';
import 'jquery-jvectormap-world-mill-en';

// Connects to data-controller="geo-map"
export default class extends Controller {
	static values = { options: String,
		mapname: String,
		url: String }

	connect() {
		let options = this.optionsValue
		let mapname = this.mapnameValue
		let url = this.urlValue
		this.my_method(url,mapname,options)
	}

	setup_map(map_locs,mapname,options) {
		let my_options = JSON.parse(options)
		my_options.markers = map_locs.map(function(h){ return {name: h.name, latLng: h.latLng} })
		my_options.labels = {
			markers: {
				render: function(index){
					return map_locs[index].name;
				},
				offsets: function(index){
					var offset = map_locs[index]['offsets'] || [0, 0];
					return [offset[0] - 7, offset[1] + 3];
				}
			}
		}

		$('#' + mapname).vectorMap(my_options);
	}

	async my_method (url,mapname,options) {
		let params = new URLSearchParams()
		const request = new FetchRequest('get', url, { contentType: "application/json", responseKind: "json" })
		const response = await request.perform()
		if (response.ok) {
			const map_locs = await response.json
			this.setup_map(map_locs,mapname,options)
		}
	}

}
