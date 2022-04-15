using Amici.Exceptions;
using Amici.Interfaces.Services;
using Microsoft.Extensions.Configuration;

namespace Amici.Services.Configuration 
{
    public class DevelopmentSecretConfiguration : ISecretConfiguration
    {
        private const string AmiciDatabaseConnectionStringEnvVarNameKey = "AmiciDatabaseConnectionStringEnvVarName";
        private readonly IConfiguration Configuration;
        public string GetDatabaseConnectionString()
        {
            var connectionStringKeyName = this.Configuration["AmiciDatabaseConnectionStringEnvVarName"];
            var connectionString = this.Configuration[connectionStringKeyName];
            if (connectionString == null)
            {
                throw new ConfigurationException($"{connectionStringKeyName} was not set");
            }
            return connectionString;
        }
        public DevelopmentSecretConfiguration(IConfiguration config)
        {
            this.Configuration = config;
        }
    }
}