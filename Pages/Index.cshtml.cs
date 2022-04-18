using Amici.DatabaseTypes.Amici;
using Amici.Services.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using Amici.DataTranferObjects.Amici;

namespace amici.Pages
{
    public class IndexModel : PageModel
    {
        public AmiciUserDTO currentUser;
        private readonly Guid FakeUserID = new Guid("0b2d143f-3ba6-45ea-b095-d1e7e4ab3175");
        private readonly ILogger<IndexModel> _logger;
        private readonly IUserRepository userRepository;
        public IndexModel(ILogger<IndexModel> logger, IUserRepository userRepository)
        {
            _logger = logger;
            this.userRepository = userRepository;
        }

        public async Task OnGetAsync()
        {
            var currentUser = await userRepository.GetValueByID(this.FakeUserID);
            this.currentUser = currentUser.ToDTO();
        }
    }
}
