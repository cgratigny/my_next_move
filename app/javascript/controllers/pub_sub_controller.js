import { Controller } from "@hotwired/stimulus"

/**
 * 
 * Example Usage
 * 
 * On the input, assuming the use of simple form
 * input_html: { data: { controller: "pub-sub-input", action: "pub-sub-input#publish", pub_sub_input_key_value: "unique_label" } }
 *
 * The html element
 * <div data-controller="pub-sub-input" data-action="pub-sub-input:send@window->pub-sub-input#subscribe" data-pub-sub-input-key-value="unique_label"></div>
 * 
 */

// Connects to data-controller="pub-sub-input"
export default class extends Controller {
  static values = { key: String };

  publish(event) {
    const key = this.keyValue;
    const value = event.target.value;

    // Adding a slight delay here to handle quick changes
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.dispatch('send', { detail: { key, value } });
    }, 200)

  }

  subscribe(event) {
    const { key, value } = event.detail;
    if (this.keyValue !== key) return;
    this.element.innerText = value;
  }

}