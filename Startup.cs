using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Amici.HealthChecks;
using Amici.Exceptions;
using Amici.Interfaces.Services;
using Amici.Services.Configuration;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Npgsql;

namespace Amici
{
    public class Startup
    {
        private readonly IWebHostEnvironment CurrentEnvironment;
        public IConfiguration Configuration { get; }
        public Startup(IWebHostEnvironment env, IConfiguration config)
        {
            this.CurrentEnvironment = env;
            this.Configuration = config;
        }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            // This class might seem like a bit strange/ overkill, 
            // but in cases where we use Azure keyvault or 
            // Amazon secrets manager etc we'd be doing a lot of work to fetch the secret password
            // in the Configure methods dependendent on environment.
            ISecretConfiguration secretConfig;
            if (this.CurrentEnvironment.IsDevelopment())
            {
                secretConfig = new DevelopmentSecretConfiguration(Configuration);
            } 
            else 
            {
                throw new ConfigurationException("Production env not supported");
            }
            // Although only the database password is secret, it is easy to build
            // the whole connection string in the service.
            services.AddTransient((provider) => new NpgsqlConnection(secretConfig.GetDatabaseConnectionString()));
            services.AddRazorPages().AddRazorRuntimeCompilation();
            services
                .AddHealthChecks()
                .AddCheck<AmiciDatabaseHealthCheck>("Database Connection",failureStatus:HealthStatus.Unhealthy, tags: new [] {"Database"});
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapHealthChecks("/healthcheck");
                endpoints.MapControllers();
                endpoints.MapRazorPages();
            });
        }
    }
}
