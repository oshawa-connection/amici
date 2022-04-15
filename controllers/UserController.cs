using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace Amici.Controllers
{
    // In reality, this would be an override of the 
    // identity framework user.
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        [HttpGet("index")]
        public async Task<IActionResult> GetUsers()
        {
            return new JsonResult("");
        }
    }    
}