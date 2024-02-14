import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification"
export default class extends Controller {
  static targets = ["notificationIcon"]
  static values = { userId: Number }

  connect() {
    console.log(this.targets);
    console.log("Hello from notification controller");

    const notificationIconElement = this.notificationIconTarget; // Access the specific DOM element

    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel", id: this.userIdValue },
      { received: (data) => {
        console.log(data);
        console.log("test");
        // show the incoming message icon
        notificationIconElement.classList.toggle('d-none');
      }}
    );
    console.log(`Subscribed to the chatroom with the id ${this.userIdValue}.`);
  }
}
