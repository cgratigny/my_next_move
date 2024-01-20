import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["element", "checkbox"]

  connect() {
    this.checkboxTargets.forEach(checkbox => {
      this.toggleForCheckbox(checkbox);
    });
  }

  changed(event) {
    this.toggleForCheckbox(event.target);
  }

  toggleForCheckbox(checkbox) {
    const groupValue = checkbox.dataset.formCheckboxTogglerGroup;
    this.elementTargets.forEach(element => {
      if (element.dataset.formCheckboxTogglerGroup === groupValue) {
        this.toggle(element, element.dataset.showWhen, checkbox.checked);
      }
    });
  }

  toggle(element, showWhen, isChecked) {
    const shouldShow = (showWhen === "checked" && isChecked) || (showWhen === "unchecked" && !isChecked);
    element.hidden = !shouldShow;
  }
}
