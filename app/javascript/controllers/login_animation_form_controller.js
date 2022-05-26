import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="login-animation-form"
export default class extends Controller {
  static targets = [ "form" ]

  connect() {
    console.log("hello from user form")
  }

  showToggle = () => {
    this.formTarget.classList.toggle("showed");
  }
}
