import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "submit" ]

  connect() {
    console.log(this.submitTarget);
  }

  submit(){
    this.submitTarget.click();
  }
}
