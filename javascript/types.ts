/**
 * Result of searching the API for friends near to the user.
 */
export type NearbyUser = {id:string,userName:string,distanceFromCurrentUser:number,avatarURI:string}
export type NearbySearchResult = Array<NearbyUser>