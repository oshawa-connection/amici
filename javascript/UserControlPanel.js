import { UserRepository } from "./UserRepository";
import { getDomElementByIdNonNullable } from "./Utils";

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
     */
    constructor(userRepository) {
        if (UserControlPanel.instance !== undefined) {
            throw new Error("Swipepanel is a singleton");
        }
        UserControlPanel.instance = this;
        this.yesButton = (/** @type {HTMLButtonElement} */ (getDomElementByIdNonNullable(this.yesButtonID)));
        this.noButton = (/** @type {HTMLButtonElement} */ (getDomElementByIdNonNullable(this.noButtonID)));

        this.yesButton.addEventListener("click",this.onYesButton.bind(this));
        this.noButton.addEventListener("click",this.onNoButton.bind(this));

        this.userRepository = userRepository;
    }


    /**
     * Potentially, this could be done by _another_ class called "event bus"
     * @private
     */
    async displayNextFriend() {
        const nextUser = await this.userRepository.goToNextUser();
        document.dispatchEvent(new CustomEvent("displayNextFriend",{detail:nextUser}));
    }

    

    async onYesButton() {
        if (this.isProcessing === true) {
            return;
        }
        this.isProcessing = true;
        if (this.userRepository.doUsersMatch()) {

        }
        await this.displayNextFriend();        
        this.isProcessing = false;
    }

    async onNoButton() {
        if (this.isProcessing === true) {
            return;
        }
        this.isProcessing = true;

        await this.displayNextFriend();
        
        
        this.isProcessing = false;
    }

}