using System.Collections.Generic;
using System.Linq;
using Amici.Interfaces;
using NetTopologySuite.Features;

namespace Amici.Extensions {
    public static class ICollectionExtensions
    {
        public static FeatureCollection ToFeatureCollection(this ICollection<IToFeatureable> collection) 
        {
            var featureCollection = new FeatureCollection();
            foreach(var toFeatureable in collection)
            {
                featureCollection.Add(toFeatureable.ToFeature());            
            }
            return featureCollection;
        }
    }
}