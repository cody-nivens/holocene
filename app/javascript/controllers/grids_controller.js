import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from '@rails/request.js'

// Connects to data-controller="grids"
export default class extends Controller {
	static values = { url: String, gridtype: String }
	static targets = [
		'grid_form', 'grid_data', 'last_name', 'first_name', 'nickname', 'main',
		'no_ethnicity', 'ethnicity', 'no_occupation_class', 'occupation_class',
		'no_grouping', 'grouping', 'category', 'attribute', 'value', 'name',
		'start_year', 'region_id', 'id', 'event_type', 'lat', 'lng', 'population'
	]

	connect() {
		//console.log("Conntected to DataGrid")
		let url = this.urlValue
		//console.log('Got the url: "' + url + '"')
	}
	processSearch(event) {
		//console.log('processSearch')
		event.preventDefault()
		let url = this.urlValue

		this.fetch_data(url)
	}
	async fetch_data(url) {
		let params = new URLSearchParams()
		let gridtype = this.gridtypeValue
		switch(gridtype) {
			case 'character':
		params.append('characters_grid[last_name]', this.last_nameTarget.value)
		params.append('characters_grid[first_name]', this.first_nameTarget.value)
		params.append('characters_grid[nickname]', this.nicknameTarget.value)
		params.append('characters_grid[main]', this.mainTarget.checked)
		params.append('characters_grid[no_ethnicity]', this.no_ethnicityTarget.checked)
		params.append('characters_grid[ethnicity]', this.ethnicityTarget.value)
		params.append('characters_grid[no_occupation_class]', this.no_occupation_classTarget.checked)
		params.append('characters_grid[occupation_class]', this.occupation_classTarget.value)
		params.append('characters_grid[no_grouping]', this.no_groupingTarget.checked)
		params.append('characters_grid[grouping]', this.groupingTarget.value)
		params.append('characters_grid[category]', this.categoryTarget.value)
		params.append('characters_grid[attribute]', this.attributeTarget.value)
		params.append('characters_grid[value]', this.valueTarget.value)
			break;
			case 'itinerary':
		params.append('itineraries_grid[name]', this.nameTarget.value)
			break;
			case 'holocene_event':
		params.append('holocene_events_grid[name]', this.nameTarget.value)
		params.append('holocene_events_grid[start_year]', this.start_yearTarget.value)
		params.append('holocene_events_grid[region_id]', this.region_idTarget.value)
		params.append('holocene_events_grid[id]', this.idTarget.value)
		params.append('holocene_events_grid[event_type]', this.event_typeTarget.value)
			break;
			case 'city':
		params.append('cities_grid[name]', this.nameTarget.value)
		params.append('cities_grid[lat]', this.latTarget.value)
		params.append('cities_grid[lng]', this.lngTarget.value)
		params.append('cities_grid[population]', this.populationTarget.value)
			break;
		}

		const request = new FetchRequest('get', `${url}?${params}`, { responseKind: "turbo-stream"  })
		request.addHeader('Accept', "text/vnd.turbo-stream.html")
		const response = await request.perform()
		if (response.ok) {
			const text = await response.renderTurboStream
		}
	}


}
