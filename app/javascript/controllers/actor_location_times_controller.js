import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="actor-location-times"
export default class extends Controller {
  connect() {
	  // console.log(this.element)
  }

  toggle(e) {
        const id = e.target.dataset.id
        const csrfToken = document.querySelector("[name='csrf-token']").content

        fetch(`/actor_location_times/${id}/check`, {
            method: 'PUT', // *GET, POST, PUT, DELETE, etc.
            mode: 'cors', // no-cors, *cors, same-origin
            cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
            credentials: 'same-origin', // include, *same-origin, omit
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': csrfToken
            },
            body: JSON.stringify({ check: e.target.checked }) // body data type must match "Content-Type" header
        })
          .then(response => response.json())
          .then(data => {
              // alert(data.message)
           })
    }

}
