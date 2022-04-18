using Amici.Constants;
using Amici.Interfaces;
using Amici.DataTranferObjects.Amici;
using System;


namespace Amici.DatabaseTypes.Amici
{
    public class NearbyUserSearchResult : IToDTOable<NearbyUserSearchResultDTO>
    {
        public Guid Id {get;set;}
        public string UserName {get;set;}
        public double DistanceFromCurrentUser {get;set;}
        
        // This would not exist in the real app, I just couldn't be
        // bothered to add this as a field in the database.
        public string AvatarURI 
        {
            get 
            {
                Random r = new Random();
                int rInt = r.Next(1, AmiciConstants.NumberOfAvatars + 1);
                return rInt.ToString();
            }
        }

        public NearbyUserSearchResultDTO ToDTO() 
        {
            return new NearbyUserSearchResultDTO() {Id=Id,UserName=UserName,DistanceFromCurrentUser=DistanceFromCurrentUser,AvatarURI=AvatarURI};
        }
    
    }
}