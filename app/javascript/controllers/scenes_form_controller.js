import { Controller } from "@hotwired/stimulus"
import { get, post, put, patch, destroy } from '@rails/request.js'

// Connects to data-controller="scenes-form"
export default class extends Controller {
	static targets = [ 'toggle', 'situated_type', 'situated_id',
	'long', 'print', 'year', 'low_word_count', 'mid_word_count',
	'better_word_count' ]
  connect() {
  }

  async processQuery() {
	  var option_value = ''
	  var ele = document.getElementsByName('option');

            for (var i = 0; i < ele.length; i++) {
                if (ele[i].checked)
                        option_value = ele[i].value;
	    }

        const params = {
		toggle: this.toggleTarget.checked,
		situated_type: this.situated_typeTarget.value,
		situated_id: this.situated_idTarget.value,
		long: this.longTarget.checked,
		print: this.printTarget.checked,
		year: this.yearTarget.value,
		option: option_value,
		better_word_count: this.better_word_countTarget.checked,
		mid_word_count: this.mid_word_countTarget.checked,
		low_word_count: this.low_word_countTarget.checked
	};

        const response = await post("/scenes/index", {
            body: params,
            contentType: 'application/json',
            responseKind: 'turbo-stream'
        });
  }
}
