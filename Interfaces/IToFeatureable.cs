using Microsoft.CodeAnalysis.CSharp.Syntax;
using NetTopologySuite.Features;

namespace Amici.Interfaces {
    public interface IToFeatureable 
    {
        public Feature ToFeature();
    }
}