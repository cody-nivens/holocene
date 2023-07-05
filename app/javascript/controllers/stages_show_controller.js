import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from '@rails/request.js'

// Connects to data-controller="stages-show"
export default class extends Controller {
	static targets = [ 'check', 'op_locations', 'op_actors' ]
	static values = { id: String }

	connect() {
	}

	async processQuery() {
		let url = "/stages/" + this.idValue + "/show"
		let params = new URLSearchParams()
		params.append('check', this.checkTarget.checked)
		if (this.op_locationsTarget.checked) {
  		   params.append('op', 'locations')
		} else {
  		   params.append('op', 'actors')
		}
		const request = new FetchRequest('get', `${url}?${params}`, { contentType: "application/json", responseKind: "turbo-stream" })
		const response = await request.perform()
		if (response.ok) {
			//const timeline_json = await response.json
		}

	}
}
