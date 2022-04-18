using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using System;
using Amici.Services.Repositories;
using System.Threading.Tasks;
using System.Linq;

namespace Amici.Controllers
{
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        private readonly IUserRepository userRepository;
        public UserController(IUserRepository userRepository)
        {

            this.userRepository = userRepository;
        }

        // In reality, we wouldn't pass the userID here; we'd get it using identity
        [HttpGet("nearbyusers/{userID}/{offset}")]
        public async Task<IActionResult> GetNearbyUsers(string userID,int offset)
        {
            if (offset < 0) 
            {
                return BadRequest("Offset must be greater than or equal to 0");
            }
            var castOffset = (uint) offset;
            Guid parsedUserID;
            try
            {
                parsedUserID = Guid.Parse(userID);
            } catch (FormatException x) {
                return BadRequest("Invalid user ID");
            }
            
            var searchResult = await userRepository.GetNearbyUsers(parsedUserID,castOffset);
            var searchResultDTOs = searchResult.Select(d => d.ToDTO()).ToList();
            return new JsonResult(searchResultDTOs);
        }
    }    
}