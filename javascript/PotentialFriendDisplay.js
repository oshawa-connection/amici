import { EventBus } from "./EventBus";
import { formatMetersDistance, getDomElementByIdNonNullable } from "./Utils";

export class PotentialFriendDisplay {
    /**
     * @readonly
     * @private
     */
    currentPotentialFriendImageId = "currentPotentialFriendAvatar";

    /**
     * @private
     * @readonly
     */
    currentPotentialFriendNameParagraphId = "currentPotentialFriendName";
    /**
     * @private 
     * @readonly
     */
    imageBaseURL = "/imgs/avatars"

    /**
     * 
     * @param {import("./types").NearbyUser} currentUser 
     */
    constructor(currentUser) {
        this.currentPotentialFriendNameParagraph = (/** @type {HTMLImageElement} */ (getDomElementByIdNonNullable(this.currentPotentialFriendNameParagraphId))); 

        /**
         * @private
         * @readonly
         */
        this.currentPotentialFriendImageElement = (/** @type {HTMLImageElement} */ (getDomElementByIdNonNullable(this.currentPotentialFriendImageId)));
        //@ts-ignore CustomEvent listener might need some weird cast that doesn't have any benefit
        document.addEventListener(EventBus.displayNextFriend,this.onNextUser.bind(this));

        this.setCurrentUser(currentUser);
    }

    /**
     * @private
     * @param {CustomEvent} e 
     */
    onNextUser(e) {
        if (e.detail === undefined) {
            throw new Error("User from event was not set");
        }
        const nextFriend = (/** @type {import("./types").NearbyUser} */ (e.detail));

        this.setCurrentUser(nextFriend);
    }

    /**
     * @private
     * Used for the initial case
     * @param {import("./types").NearbyUser} nextFriend 
     */
    setCurrentUser(nextFriend) {
        var source = `${this.imageBaseURL}/${nextFriend.avatarURI}.png`;
        
        var timestamp = (new Date()).getTime()
        var newUrl = source + '?_=' + timestamp;
        this.currentPotentialFriendImageElement.src = newUrl
        
        this.currentPotentialFriendNameParagraph.innerText = `${nextFriend.userName}, ${formatMetersDistance(nextFriend.distanceFromCurrentUser)}`;
    }
}