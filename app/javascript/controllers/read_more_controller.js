import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content", "toggleButton"]

  static get classes() {
    return ["hide"]
  }

  toggleContent() {
    const contentElement = this.element.querySelector('.content');
    if (contentElement) {
      contentElement.classList.toggle('max-h-32');
      contentElement.classList.toggle('truncate');
    }
  }
}
