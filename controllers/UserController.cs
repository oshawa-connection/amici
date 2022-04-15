using Microsoft.AspNetCore.Mvc;
using System;
using Amici.Services.Repositories;
using System.Threading.Tasks;

namespace Amici.Controllers
{
    // In reality, this would be an override of the 
    // identity framework user.
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        private readonly IUserRepository userRepository;
        public UserController(IUserRepository userRepository)
        {
            this.userRepository=  userRepository;
        }
        [HttpGet]
        public async Task<IActionResult> GetUsers()
        {
            // Hardcoded user ID here because no identity framework
            var user = await this.userRepository.GetValueByID(Guid.Parse("0b2d143f-3ba6-45ea-b095-d1e7e4ab3175"));
            return new JsonResult(user.ToDTO());
        }
    }    
}