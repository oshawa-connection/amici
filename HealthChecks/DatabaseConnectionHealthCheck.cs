using Microsoft.Extensions.Diagnostics.HealthChecks;
using Npgsql;
using System.Threading.Tasks;
using System.Threading;

namespace Amici.HealthChecks
{
    public class AmiciDatabaseHealthCheck : IHealthCheck
    {
        private readonly NpgsqlConnection NpgsqlConnection;
        public AmiciDatabaseHealthCheck(NpgsqlConnection npgsqlConnection)
        {
            this.NpgsqlConnection = npgsqlConnection;
        }
        // This method is allowed to throw
        public Task<HealthCheckResult> CheckHealthAsync(HealthCheckContext context, CancellationToken cancellationToken = default)
        {
            var isHealthy = false;
            try
            {
                this.NpgsqlConnection.Open();
                using (var command = new NpgsqlCommand("SELECT 1+1 as RESULT",this.NpgsqlConnection))
                {
                    command.ExecuteNonQuery();
                    isHealthy = true;
                }
            }
            finally 
            {
                this.NpgsqlConnection.Close();
            }

            if (isHealthy)
            {
                return Task.FromResult(
                    HealthCheckResult.Healthy("A healthy result."));
            }

            return Task.FromResult(
                new HealthCheckResult(
                    context.Registration.FailureStatus, "An unhealthy result."));
        }
    }
}