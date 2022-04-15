using System;

namespace Amici.DatabaseTypes.Amici
{
    public class NearbyUserSearchResult 
    {
        public Guid Id {get;set;}
        public string UserName {get;set;}
        public double DistanceFromCurrentUser {get;set;}
    }
}