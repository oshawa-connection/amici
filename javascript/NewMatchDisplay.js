export class NewMatchDisplay {

    /**
     * @private
     * @readonly
     */
    newMatchMessage = "Congrats! You found a friend :)";

    onNewMatch() {
        alert(this.newMatchMessage)
    }
    constructor() {
        document.addEventListener("a",this.onNewMatch.bind(this));
    }    
}