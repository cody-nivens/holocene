import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from '@rails/request.js'

import 'jquery.jvectormap.min';
import 'jquery-jvectormap-world-mill-en';

// Connects to data-controller="geo-map"
export default class extends Controller {
        static values = { jsurl: String,
               url: String }

  connect() {
    let jsurl = this.jsurlValue
    let url = this.urlValue
    this.my_method(url)
  }

  setup_map(map_locs) {
    $('#world-map').vectorMap({
      map: 'world_mill_en',
      scaleColors: ['#C8EEFF', '#0071A4'],
      normalizeFunction: 'polynomial',
      hoverOpacity: 0.7,
      hoverColor: false,
      markerStyle: {
        initial: {
          fill: '#F8E23B',
          stroke: '#383f47'
        }
      },
      backgroundColor: '#383f47',
      markers: map_locs.map(function(h){ return {name: h.name, latLng: h.latLng} }),
        labels: {
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
      });
  }

        async my_method (url) {
                let params = new URLSearchParams()
                const request = new FetchRequest('get', url, { contentType: "application/json", responseKind: "json" })
                const response = await request.perform()
                if (response.ok) {
                        const map_locs = await response.json
			this.setup_map(map_locs)
                }
        }

}
