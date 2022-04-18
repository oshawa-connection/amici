using System;

namespace Amici.Exceptions
{
    // Thrown during app startup if something is misconfigured, e.g. an environment variable isn't set.
    public class ConfigurationException : Exception
    {
        public ConfigurationException()
        {
        }

        public ConfigurationException(string message)
            : base(message)
        {
        }

        public ConfigurationException(string message, Exception inner)
            : base(message, inner)
        {
        }
    }
}
