import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from '@rails/request.js'

// Connects to data-controller="timelines"
export default class extends Controller {
	static values = { jsurl: String,
		url: String }

	async my_method (url) {
		let params = new URLSearchParams()
		const request = new FetchRequest('get', url, { contentType: "application/json", responseKind: "json" })
		const response = await request.perform()
		if (response.ok) {
			const timeline_json = await response.json
			// Do whatever do you want with the response body
			// You also are able to call `response.html` or `response.json`, be aware that if you call `response.json` and the response contentType isn't `application/json` there will be raised an error.
			var additionalOptions = {
				start_at_end: false,
				//default_bg_color: {r:0, g:0, b:0},
				timenav_height: 300
			}
			window.timeline = new TL.Timeline('timeline-embed', timeline_json["timelines"], additionalOptions);
		}
	}

	connect() {
		let jsurl = this.jsurlValue
		let url = this.urlValue

		if (typeof TL === 'undefined') {
			this.initializeScriptTag(document, 'script', 'timeline-embed-js', jsurl);
		}

		this.my_method(url)
	}

	initializeScriptTag (d, s, id, jsurl) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (!d.getElementById(id)) {
			js = d.createElement(s);
			js.id = id;
			js.src = jsurl;
			fjs.parentNode.insertBefore(js, fjs);
		}
	}
}
