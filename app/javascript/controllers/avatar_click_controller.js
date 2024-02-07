import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="avatar-click"
export default class extends Controller {
  redirectToPet(event) {
    const petId = this.element.getAttribute("data-pet-id");
    if (petId) {
      window.location.href = `/pets/${petId}`;
    }
  }
}
