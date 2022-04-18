import { getDomElementByIdNonNullable } from "./Utils";

export class SwipePanel {
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
     * @type {undefined | SwipePanel}
     */
    static instance = undefined;

    constructor() {
        if (SwipePanel.instance !== undefined) {
            throw new Error("Swipepanel is a singleton");
        }
        SwipePanel.instance = this;
        this.yesButton = (/** @type {HTMLButtonElement} */ (getDomElementByIdNonNullable(this.yesButtonID)));
        this.noButton = (/** @type {HTMLButtonElement} */ (getDomElementByIdNonNullable(this.noButtonID)));

        this.yesButton.addEventListener("click",this.onYesButton.bind(this));
        this.noButton.addEventListener("click",this.onNoButton.bind(this));
    }

    onYesButton() {
        if (this.isProcessing === true) {
            return;
        }
        this.isProcessing = true;



        this.isProcessing = false;
    }

    onNoButton() {
        if (this.isProcessing === true) {
            return;
        }
        this.isProcessing = true;


        
        this.isProcessing = false;
    }

}