using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
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

        // In reality, we wouldn't pass the userID here; we'd 
        [HttpGet("GetNearbyUsers/{userID}/{distanceKilometers:double}")]
        public async Task<IActionResult> GetNearbyUsers(string userID,double distanceKilometers)
        {
            Guid parsedUserID;
            try
            {
                parsedUserID = Guid.Parse(userID);
            } catch (FormatException x) {
                return new BadRequestResult();
            }
            
            await userRepository.GetNearbyUsers(parsedUserID);
            // Hardcoded user ID here because no identity framework
            return new JsonResult(user.ToDTO());
        }
    }    
}