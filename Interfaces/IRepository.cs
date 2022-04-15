using System.Collections.Generic;
using System.Threading.Tasks;

namespace Amici.Interfaces {
    public interface IRepository<T,U>
    {
        Task<ICollection<T>> GetValues();
        Task<T> GetValueByID(U id);
    }
}