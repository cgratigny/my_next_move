import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navigation"
export default class extends Controller {
  static targets = ["dropdown"];

  connect() {
    console.log("navigation controller connected");
    console.log("this.dropdownTarget", this.dropdownTarget);
  }

  toggleDropdown() {
    this.dropdownTarget.classList.toggle("hidden")
  }
}
