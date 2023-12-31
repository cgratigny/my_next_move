import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "tagsList"];

  connect() {
    const existingTags = document.getElementById('hidden-tag-list').value.split(',');
    existingTags.forEach(tag => {
      if (tag.trim() !== '') {
        this.createTag(tag.trim());
      }
    });
  }

  addTag(event) {
    if (event.key === ' ' || event.key === ',') {
      const tagText = this.inputTarget.value.trim().replace(/,/, '');
      if (tagText) {
        this.createTag(tagText);
        this.updateHiddenField();
      }
      this.inputTarget.value = '';
    }
  }

  createTag(text) {
    const tag = document.createElement('span');
    tag.className = 'tag';
    tag.textContent = text;
    const removeBtn = document.createElement('span');
    removeBtn.textContent = 'x';
    removeBtn.className = 'remove-tag';
    removeBtn.onclick = () => {
      tag.remove();
      this.updateHiddenField();
    };
    tag.appendChild(removeBtn);
    this.tagsListTarget.appendChild(tag);
  }

  updateHiddenField() {
    const tags = Array.from(this.tagsListTarget.children).map(tag => tag.textContent.slice(0, -1)); // slice to remove 'x' from tag text
    document.getElementById('hidden-tag-list').value = tags.join(',');
  }
}
