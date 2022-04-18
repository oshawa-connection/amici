using Amici.Constants;
using System;


namespace Amici.DatabaseTypes.Amici
{
    public class NearbyUserSearchResult 
    {
        public Guid Id {get;set;}
        public string UserName {get;set;}
        public double DistanceFromCurrentUser {get;set;}
        public string AvatarURI {
            get 
            {
                Random r = new Random();
                int rInt = r.Next(1, AmiciConstants.NumberOfAvatars);
                return rInt.ToString();
            }
        }
    }
}