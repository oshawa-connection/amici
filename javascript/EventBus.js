/**
 * 
 */
export class EventBus {

    static displayNextFriend = "displayNextFriend";
    static displayMatchSuccess = "displayMatchSuccess";
    static displayNoMoreFriends = "displayNoMoreFriends";
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
}