import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["frame", "position"];

  connect() {
    console.log("observePositionChanges");
    this.reorderFrames();
    document.addEventListener('turbo:render', () => {
      this.reorderFrames();
    });
  }

  reorderFrames() {
    const frameElements = this.positionTargets.map(positionElement => {
      return {
        frame: positionElement.closest('turbo-frame'),
        position: parseInt(positionElement.getAttribute('data-sortable-position'), 10)
      };
    });

    frameElements.sort((a, b) => a.position - b.position).forEach(item => this.element.appendChild(item.frame));
  }
}
