import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification"
export default class extends Controller {
  static targets = ["notificationIcon"]
  static values = { userId: Number }

  connect() {
    console.log(this.targets);
    console.log("Hello from notification controller");

    this.notificationIconElement = this.notificationIconTarget; // Access the specific DOM element
    console.log(this.notificationIconElement);
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel", id: this.userIdValue },
      { received: (data) => {
        console.log(data);
        console.log("test");
        console.log(`Subscribed to the chatroom with the id ${this.userIdValue}.`);
        // show the incoming message icon
        this.notificationIconElement.classList.remove('d-none');
      }}
    );
  }

  toggle() {
    this.notificationIconElement.classList.add('d-none');
  }
}
