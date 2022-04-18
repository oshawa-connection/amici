import { EventBus } from "./EventBus";

/**
 * Listens for events from the app and displays messages to the user.
 * Right now this is just an alert, but in future it could be a modal, toast or
 * something else.
 * 
 */
export class MessageDisplay {

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
     * @type {undefined | MessageDisplay}
     */
     static instance = undefined;

     constructor() {
        if (MessageDisplay.instance !== undefined) {
            throw new Error("NewMatchDisplay is a singleton");
        }
        MessageDisplay.instance = this;
        document.addEventListener(EventBus.displayMatchSuccess,this.onNewMatch.bind(this));
        document.addEventListener(EventBus.displayNoMoreFriends,this.onNoMoreFriends.bind(this));
    }    
}