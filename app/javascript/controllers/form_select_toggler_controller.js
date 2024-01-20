import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["element", "select"]

  connect() {
    this.selectTargets.forEach(select => {
      // console.log("Initial toggle for select:", select.value);
      this.toggleForSelect(select);
    });
  }

  changed(event) {
    console.log("Select changed:", event.target.value);
    this.toggleForSelect(event.target);
  }

  toggleForSelect(select) {
    const groupValue = select.dataset.formTogglerGroup;
    this.elementTargets.forEach(element => {
      if (element.dataset.formTogglerGroup === groupValue) {
        this.toggle(element, element.dataset.values, select.value);
      }
    });
  }

  toggle(element, values, value) {
    const shouldShow = values.split(",").includes(value);
    element.hidden = !shouldShow;
  }
}

