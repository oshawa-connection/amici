using System;
using NetTopologySuite.Geometries;
using Amici.Constants;
using NetTopologySuite.Features;
using Amici.Interfaces;

namespace Amici.DatabaseTypes.Amici 
{
    public class AmiciUser : IToFeatureable
    {
        public Guid Id {get;set;}
        public string UserName {get;set;}
        public Point Geometry {get;set;}

        public string AvatarURI {
            get 
            {
                Random r = new Random();
                int rInt = r.Next(1, AmiciConstants.NumberOfAvatars);
                return rInt.ToString();
            }
        }

        public Feature ToFeature()
        {
            var feature = new Feature();
            feature.Attributes.Add("id",this.Id);
            feature.Attributes.Add("userName",this.UserName);
            feature.Attributes.Add("avatarURI",this.AvatarURI);
            feature.Geometry = this.Geometry;
            return feature;
        }
    }
}