import { EventBus } from "./EventBus";
import { UserRepository } from "./UserRepository";
import { getDomElementByIdNonNullable } from "./Utils";

/**
 * Listens and responds to events from the two buttons on the main page.
 * 
 * Possibly this could benefit from the state pattern. E.g. LoadingState, EnabledState, WaitingState, ErrorState etc.
 * Needs some thought.
 */
export class UserControlPanel {
    /**
     * @private
     */
    isProcessing = false;

    /**
     * @private
     * @readonly
     */
    yesButtonID = "swipePanelYesButton";

    /**
     * @private
     * @readonly
     */
    noButtonID = "swipePanelNoButton";


    /**
     * @private
     * @type {undefined | UserControlPanel}
     */
    static instance = undefined;

    /**
     * 
     * @param {UserRepository} userRepository 
     * @param {EventBus} eventBus
     */
    constructor(userRepository, eventBus) {
        if (UserControlPanel.instance !== undefined) {
            throw new Error("Swipepanel is a singleton");
        }
        UserControlPanel.instance = this;
        this.yesButton = (/** @type {HTMLButtonElement} */ (getDomElementByIdNonNullable(this.yesButtonID)));
        this.noButton = (/** @type {HTMLButtonElement} */ (getDomElementByIdNonNullable(this.noButtonID)));

        this.yesButton.addEventListener("click",this.onYesButton.bind(this));
        this.noButton.addEventListener("click",this.onNoButton.bind(this));

        // document.addEventListener(EventBus.displayNoMoreFriends,this.onNoMoreFriends.bind(this));
        /**
         * @private
         * @readonly
         */
        this.userRepository = userRepository;
        /**
         * @private
         * @readonly
         */
        this.eventBus = eventBus;
    }


    onNoMoreFriends() {
        this.noButton.disabled = true;
        this.yesButton.disabled = true;
    }


    async onYesButton() {
        if (this.isProcessing === true) {
            return;
        }
        this.isProcessing = true;
        if (this.userRepository.doUsersMatch()) {
            this.eventBus.displayMatchSuccess();
        }
        const nextUser = await this.userRepository.goToNextUser();
        if (nextUser === undefined) {
            this.eventBus.displayNoMoreFriends();
            this.onNoMoreFriends();
            this.eventBus.displayError();
            return;
        }
        this.eventBus.displayNextFriend(nextUser);
        this.isProcessing = false;
    }

    async onNoButton() {
        if (this.isProcessing === true) {
            return;
        }
        this.isProcessing = true;

        const nextUser = await this.userRepository.goToNextUser();
        if (nextUser === undefined) {
            this.eventBus.displayNoMoreFriends();
            this.onNoMoreFriends();
            this.eventBus.displayError();
            return;
        }
        this.eventBus.displayNextFriend(nextUser);
        this.isProcessing = false;
    }

}