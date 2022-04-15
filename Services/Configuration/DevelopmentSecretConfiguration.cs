using Amici.Exceptions;
using Amici.Interfaces.Services;
using Microsoft.Extensions.Configuration;
using Npgsql;

namespace Amici.Services.Configuration 
{
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