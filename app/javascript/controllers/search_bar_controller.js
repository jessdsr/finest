import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bar"
export default class extends Controller {
  static targets = [ "input" ]

  connect() {
    console.log('in');
  }

  clearInput = () => {
    this.inputTarget.value = ""
  }
}
