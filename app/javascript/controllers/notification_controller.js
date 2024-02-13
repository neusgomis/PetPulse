import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification"
export default class extends Controller {
  static targets = ["notificationIcon"]
  static values = { userId: Number }

  connect() {
    console.log(this.targets);
    console.log("Hello from notification controller");
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel", id: this.userIdValue },
      { received: (data) => {
        console.log(data);
        console.log("test");
        // hide the no-notification icon
        // this.msgIcon.classList.add('d-none');
        // show the incoming message icon if you hiding it with bootstrap
        //this.msgIcon.classList.remove('d-none');
        this.notificationIconTarget.insertAdjacentHTML("beforeend", "<span class='badge bg-danger rounded-pill' id='notification'>(1)</span>");
      }}
    );
    console.log(`Subscribed to the chatroom with the id ${this.userIdValue}.`);
  }

  disconnect() {
    $('#notification').remove()
  }
}
