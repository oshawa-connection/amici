using System;

namespace Amici.DataTranferObjects.Amici {
    public class NearbyUserSearchResultDTO {
        public Guid Id {get;set;}
        public string UserName {get;set;}
        public double DistanceFromCurrentUser {get;set;}
        public string AvatarURI {get;set;}
    }
}