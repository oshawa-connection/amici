using Amici.DatabaseTypes.Amici;
using Amici.Interfaces.Services;
using Npgsql;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace Amici.Services.Repositories 
{
    public interface IUserRepository :IRepository<AmiciUser,Guid>
    {
        public Task<ICollection<NearbyUserSearchResult>> GetNearbyUsers(Guid userID, uint offset);
    }

    public class UserRepository: IUserRepository
    {
        private NpgsqlConnection npgsqlConnection;
        public UserRepository(NpgsqlConnection npgsqlConnection)
        {
            this.npgsqlConnection = npgsqlConnection;
        }

        public async Task<ICollection<NearbyUserSearchResult>> GetNearbyUsers(Guid userID, uint offset)
        {
            var searchResult = new List<NearbyUserSearchResult>();
            try
            {
                await npgsqlConnection.OpenAsync();

                var baseQuery = @"
                WITH current_amici_user AS ( 
                    SELECT id,geom FROM main.amici_user
                    WHERE id = :userID ::uuid
                )
                SELECT id,user_name,st_distance((SELECT ST_SnapToGrid(geom,100.0) FROM current_amici_user),ST_SnapToGrid(au.geom,100.0)) AS distance_from_current_user 
                FROM main.amici_user au
                WHERE au.id != (select id from current_amici_user)
                ORDER BY (SELECT geom FROM current_amici_user) <-> au.geom OFFSET :offset LIMIT 10;";

                using (var command = new NpgsqlCommand(baseQuery,this.npgsqlConnection))
                {
                    command.Parameters.AddWithValue("userID",userID.ToString());
                    command.Parameters.AddWithValue("offset",(int)offset);
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while(await reader.ReadAsync())
                        {
                            var nearbyUser = new NearbyUserSearchResult();
                            nearbyUser.Id = reader.GetGuid(0);
                            nearbyUser.UserName = reader.GetString(1);
                            nearbyUser.DistanceFromCurrentUser = reader.GetDouble(2);
                            searchResult.Add(nearbyUser);
                        }
                    }
                }
            } 
            finally 
            {
                await npgsqlConnection.CloseAsync();
            }
            return searchResult;
        }

        public async Task<ICollection<AmiciUser>> GetValues()
        {
            throw new NotImplementedException();
        }

        public async Task<AmiciUser> GetValueByID(Guid id)
        {
            AmiciUser user = null;
            try 
            {
                await npgsqlConnection.OpenAsync();
                
                var baseQuery = @"
                SELECT id,user_name 
                FROM main.amici_user 
                WHERE id = :value1 ::uuid";

                using (var command = new NpgsqlCommand(baseQuery,this.npgsqlConnection))
                {
                    command.Parameters.AddWithValue("value1",id.ToString());
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        await reader.ReadAsync();
                        user = new AmiciUser();
                        user.Id = reader.GetGuid(0);
                        user.UserName = reader.GetString(1);
                    }
                }
            }
            finally
            {
                if (npgsqlConnection.State == System.Data.ConnectionState.Open)
                {
                    await npgsqlConnection.CloseAsync();
                }
            }
            return user;
        }
    }

}