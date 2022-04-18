export class EventBus {

    static displayNextFriend = "displayNextFriend";
    static displayMatchSuccess = "displayMatchSuccess";

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
}