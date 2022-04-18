using Amici.Exceptions;
using Amici.Interfaces.Services;
using Microsoft.Extensions.Configuration;
using Npgsql;

namespace Amici.Services.Configuration 
{
    // This class might seem like a bit strange/ overkill, 
    // but in cases where we use Azure keyvault or 
    // Amazon secrets manager etc we'd be doing a lot of work to fetch the secret password
    // in the Configure methods, dependent on environment.
    public class DevelopmentSecretConfiguration : ISecretConfiguration
    {
        private readonly IConfiguration Configuration;
        public string GetDatabaseConnectionString()
        {
            NpgsqlConnectionStringBuilder builder = new NpgsqlConnectionStringBuilder();
            var environmentPassword = Configuration["AMICI_DB_PASSWORD"];
            var environmentUsername = Configuration["AMICI_DB_USERNAME"];
            
            if (string.IsNullOrEmpty(environmentPassword) || string.IsNullOrEmpty(environmentUsername))
            {
                throw new ConfigurationException("Database environment variables not set");
            }
            // These should probably be in the appsettings.Development.json
            builder.Host = "localhost";
            builder.Database = "amici";
            builder.Username = environmentUsername;
            builder.Password = environmentPassword;
            
            return builder.ConnectionString;
        }
        public DevelopmentSecretConfiguration(IConfiguration config)
        {
            this.Configuration = config;
        }
    }
}