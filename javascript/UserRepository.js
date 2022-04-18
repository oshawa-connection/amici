import { AmiciAPI } from "./AmiciAPI";
import { GUID } from "./GUID";

export class UserRepository {
    /**
     * @private
     */
    initialised = false;
    /**
     * @private
     */
    currentSearchResultOffset = 0;

    /**
     * @readonly
     * @private
     */
    defaultSearchUserOffsetIncrement = 10;

    /**
     * @private
     * @type {import("./types").NearbySearchResult}
     */
    currentSearchResults = [];

    /**
     * @private
     */
    currentSearchResultsIndex = 0;

    /**
     * @param {AmiciAPI} amiciAPI 
     * @param {GUID} userID
     */
    constructor(amiciAPI, userID) {
        /**
         * @private
         * @readonly
         */
        this.amiciAPI = amiciAPI;
        /**
         * @private
         * @readonly
         */
        this.userID = userID;
    }

    getCurrentUser() {
        return this.currentSearchResults[this.currentSearchResultsIndex];
    }

    getCurrentUserID() {
        return this.userID;
    }

    /**
     * 
     */
    async initialise() {
        if (this.initialised === true) {
            throw new Error("User repository has already been intialised");
        }
        this.initialised = true;
        await this.fetchSearchResults(this.userID);
    }

    /**
     * @private
     * @param {GUID} userID 
     */
    async fetchSearchResults(userID) {
        this.currentSearchResults = await this.amiciAPI.searchForNearbyUsers(userID,this.currentSearchResultOffset);
        this.currentSearchResultOffset += this.defaultSearchUserOffsetIncrement;
        this.currentSearchResultsIndex = 0;
    }


    /**
     * 
     */
    async goToNextUser() {
        this.currentSearchResultsIndex += 1;
        if (this.currentSearchResultsIndex > this.currentSearchResults.length - 1) {
            await this.fetchSearchResults(this.userID);
        } 

        return this.currentSearchResults[this.currentSearchResultsIndex];
    }


    /**
     * Random 50:50 for now...
     * @returns 
     */
    doUsersMatch() {
        const result = (Math.floor(Math.random() * 2) == 0)
        console.log(result);
        return result;
    }
}