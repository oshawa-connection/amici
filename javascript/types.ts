export type something = {name:string};

export type NearbyUser = {id:string,userName:string,distanceFromCurrentUser:number,avatarURI:string}
export type NearbySearchResult = Array<NearbyUser>