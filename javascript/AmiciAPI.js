import { GUID } from "./GUID";


export class AmiciAPI {
    
    /**
     * @private
     * @readonly
     */
    usersAPIBaseURL = "/api/users";

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