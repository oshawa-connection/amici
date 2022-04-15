using Amici.DatabaseTypes.Amici;
using Amici.Interfaces;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace Amici.Services.Repositories {

    public interface IUserRepository :IRepository<AmiciUser,Guid>
    {
        public Task<NearbyUserSearchResult> GetNearbyUsers(Guid userID);
    }

    public class UserRepository: IUserRepository
    {
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
            throw new NotImplementedException();
        }
    }

}