using System.Threading.Tasks;
using InTravel.Data;
using InTravel.Extension;
using InTravel.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace InTravel.Controllers
{
    public class AccountController : Controller
    {
        private Database _database;

        public AccountController(Database ctx)
        {
            _database = ctx;
        }

        [HttpGet]
        public IActionResult Login()
        {
            ViewData["database"] = _database;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                
            }
            return View();
        }
    }
}