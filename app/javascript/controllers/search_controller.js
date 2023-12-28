import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["searchInput"]

  connect() {
    this.updateInputFieldFromURL();
  }

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 200)
  }

  updateInputFieldFromURL() {
    const urlParams = new URLSearchParams(window.location.search);
    const searchParam = urlParams.get('search'); // Assuming the query parameter is named 'search'

    if (searchParam && this.searchInputTarget) {
      this.searchInputTarget.value = searchParam;
    }
  }
}
