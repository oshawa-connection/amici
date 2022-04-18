import { GUID } from "./GUID";

/**
 * Low level wrapper for the App's API.
 * Makes testing easier as now we don't have to mock fetch or http results in other components during tests.
 * This is possible using sinon but its a lot of setup.
 */
export class AmiciAPI {
    
    /**
     * @private
     * @readonly
     */
    usersAPIBaseURL = "/api/user";

    /**
     * @param {GUID} userId
     * @param {number} offset 
     * @returns {Promise<import("./types").NearbySearchResult>}
     */
    async searchForNearbyUsers(userId,offset) {
        
        let response = await fetch(`${this.usersAPIBaseURL}/nearbyusers/${userId}/${offset}`);
        if (response.ok !== true) {
            throw new Error("Error while trying to fetch new nearby users");
        }
        return await response.json(); 
    }
}