using Amici.DatabaseTypes.Amici;
using Amici.Interfaces.Services;
using Npgsql;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace Amici.Services.Repositories 
{

    // private class AmiciUserDB
    // {
    //     public object id 
    // }

    public interface IUserRepository :IRepository<AmiciUser,Guid>
    {
        public Task<NearbyUserSearchResult> GetNearbyUsers(Guid userID);
    }

    public class UserRepository: IUserRepository
    {
        private NpgsqlConnection npgsqlConnection;
        public UserRepository(NpgsqlConnection npgsqlConnection)
        {
            this.npgsqlConnection = npgsqlConnection;
        }

        public async Task<NearbyUserSearchResult> GetNearbyUsers(Guid userID)
        {
            throw new NotImplementedException();
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
                
                using (var command = new NpgsqlCommand("SELECT id,user_name FROM main.amici_user WHERE id = :value1 ::uuid",this.npgsqlConnection))
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