import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="inputs"
export default class extends Controller {
  static targets = ['input', 'label']
  connect() {
    this.allInputs = document.querySelectorAll('.special-input')
  }

  toggleInput(event) {
    this.allInputs.forEach((input) => {

        input.classList.add('hidden');

      this.inputTarget.classList.remove('hidden')
    })


  }
}
