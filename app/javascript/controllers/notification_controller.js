import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notification"
export default class extends Controller {
  static targets = ["notification-icon"]
  connect() {
    console.log("Hello from notification controller");
  }

  showNotification() {
    console.log("showNotification");
    this.notificationIconTarget.insertAdjacentHTML("beforeend", "<span class='badge bg-danger rounded-pill'>1</span>");
  }
}
