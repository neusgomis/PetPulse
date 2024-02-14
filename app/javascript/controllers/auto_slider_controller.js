import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-slider"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!", this.element.clientWidth)
    this.moveSlider();
  }
  moveSlider(){

    // const slides = document.querySelectorAll('.slide');
    // const slideWidth = slides[0].clientWidth;
     let counter = 1;
    setInterval(() => {
      // this.element.style.transition = 'transform 0.5s ease-in-out';
      this.element.style.transform = 'translateX(-' + (counter) + 'px)';
      counter++;
      if(counter === this.element.clientWidth){
        counter = 0;
      }
    }, 50);
  }
}
