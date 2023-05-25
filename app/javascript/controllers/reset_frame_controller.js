import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reset-frame"
export default class extends Controller {
  connect() {
    this.element.addEventListener('turbo:frame-load', () => {
      this.element.src = ''
    })
  }
}
