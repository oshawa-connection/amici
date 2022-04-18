import { EventBus } from "./EventBus";

export class NewMatchDisplay {

    /**
     * @private
     * @readonly
     */
    newMatchMessage = "Congrats! You found a new friend :)";

    /**
     * @private
     * @readonly
     */
    noMoreFriendsMessage = "Sorry! There are no more people in your area with similar interests.";

    onNewMatch() {
        alert(this.newMatchMessage)
    }

    onNoMoreFriends() {
        alert(this.noMoreFriendsMessage);
    }


    /**
     * @type {undefined | NewMatchDisplay}
     */
     static instance = undefined;

     constructor() {
        if (NewMatchDisplay.instance !== undefined) {
            throw new Error("NewMatchDisplay is a singleton");
        }
        NewMatchDisplay.instance = this;
        document.addEventListener(EventBus.displayMatchSuccess,this.onNewMatch.bind(this));
        document.addEventListener(EventBus.displayNoMoreFriends,this.onNoMoreFriends.bind(this));
    }    
}