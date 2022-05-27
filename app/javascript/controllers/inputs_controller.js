import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="inputs"
export default class extends Controller {
  static targets = ['input', 'label']
  connect() {
    this.allInputs = document.querySelectorAll('.special-input')
    console.log(this.labelTargets)
  }

  toggleInput(event) {
    this.allInputs.forEach((input, index) => {

      input.classList.add('hidden');

      this.inputTarget.classList.remove('hidden');
      this.inputTarget.classList.remove('is-valid');
    })
    this.labelTarget.innerHTML = this.inputTarget.value;
  }

  update() {
    this.labelTarget.innerHTML = this.inputTarget.value;
  }
}
