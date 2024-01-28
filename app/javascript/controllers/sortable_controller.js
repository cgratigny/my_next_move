import Sortable from 'stimulus-sortable'

export default class extends Sortable {

  // Override the onUpdate to update the value of the targets
  async onUpdate ({ item, newIndex }) {
    // Select all child elements of this.element with the data-sortable="target" attribute
    let sortableTargets = this.element.querySelectorAll('[data-sortable="target"]');

    // Iterate over the NodeList, setting the order by index
    // Assuming that we want the values to start at 1, adding +1 here
    sortableTargets.forEach((target, index) => {
      let newValue = index + 1;

      if (target.value != newValue) {
        target.value = index + 1;

        // Create a new event
        let event = new Event('change', { bubbles: true });

        // Dispatch the event on the target
        target.dispatchEvent(event);
      }
    });

    // super.onUpdate({ item, newIndex });
  }

}