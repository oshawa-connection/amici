/**
 * Used to construct and dispatch events between UI elements.
 * Benefits are:
 *  1. No messy construction + dispatch of CustomEvent mixed up with other logic
 *  2. No "magic" variables for custom event names which makes changing + tracking them easier.
 *  3. Could also have the added benefit of making testing of other components easier, if the document 
 *     api is not defined in the testing framework being used.
 */
export class EventBus {

    static displayNextFriend = "displayNextFriend";
    static displayMatchSuccess = "displayMatchSuccess";
    static displayNoMoreFriends = "displayNoMoreFriends";
    static displayError = "displayError";
    /**
     * 
     * @param {import("./types").NearbyUser} nextUser
     */
    displayNextFriend(nextUser) {
        document.dispatchEvent(new CustomEvent(EventBus.displayNextFriend,{detail:nextUser}));
    }

    displayMatchSuccess() {
        document.dispatchEvent(new CustomEvent(EventBus.displayMatchSuccess));
    }

    displayNoMoreFriends() {
        document.dispatchEvent(new CustomEvent(EventBus.displayNoMoreFriends));
    }

    displayError() {
        document.dispatchEvent(new CustomEvent(EventBus.displayError));
    }
}