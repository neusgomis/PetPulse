import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"


// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatpetId: Number }
  static targets = ["messages", "chat"]
  connect() {

    console.log(this.chatpetIdValue);

    // Hide Chat Initially
    this.chatTarget.classList.add("hidden");

    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatpetChannel", id: this.chatpetIdValue },

        { received: data => this.messagesTarget.insertAdjacentHTML("beforeend", data) }
    )
    console.log(`Subscribed to the chatpet with the id ${this.chatpetIdValue}.`)
    console.log(this.chatTarget)
}

  fire(){
    console.log("Hello from the button");
    this.chatTarget.classList.toggle("hidden");
  }
}
