import { EventBus } from "./EventBus";

export class NewMatchDisplay {

    /**
     * @private
     * @readonly
     */
    newMatchMessage = "Congrats! You found a new friend :)";

    onNewMatch() {
        alert(this.newMatchMessage)
    }
    /**
     * @type {undefined | NewMatchDisplay}
     */
     static instance = undefined;

     constructor() {
        if (NewMatchDisplay.instance !== undefined) {
            throw new Error("Swipepanel is a singleton");
        }
        NewMatchDisplay.instance = this;
        document.addEventListener(EventBus.displayMatchSuccess,this.onNewMatch.bind(this));
    }    
}