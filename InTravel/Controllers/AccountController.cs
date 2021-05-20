using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using InTravel.Data;
using InTravel.Extension;
using InTravel.Models;
using InTravel.ViewModels;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace InTravel.Controllers
{
    public class AccountController : Controller
    {
        private Database _database;

        public AccountController(Database ctx)
        {
            _database = ctx;
        }
        
        private async Task Authenticate(string email)
        {
            var claims = new List<Claim>
            {
                new Claim(ClaimsIdentity.DefaultNameClaimType, email)
            };
            ClaimsIdentity identity = new ClaimsIdentity(claims, "ApplicationCookie", ClaimsIdentity.DefaultNameClaimType, ClaimsIdentity.DefaultRoleClaimType);
            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(identity));
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
            ViewData["database"] = _database;
            if (ModelState.IsValid)
            {
                User user =
                    await _database.user.FirstOrDefaultAsync(
                        u => u.email == model.Email && u.password == model.Password);
                if (user != null)
                {
                    await Authenticate(user.email);
                    return RedirectToAction("Welcome", "Home", user);
                }
                ModelState.AddModelError("", "Something is wrong");
            }
            return View(model);
        }

        [HttpGet]
        public IActionResult Register()
        {
            ViewData["database"] = _database;
            return View();
        }
        
        public async Task<IActionResult> Register(RegisterModel model)
        {
            ViewData["email"] = model.Email;
            ViewData["database"] = _database;
            if (ModelState.IsValid)
            {
                User user = await _database.user.FirstOrDefaultAsync(u => u.email == model.Email);
                if (user == null && model.Password == model.ConfirmPassword)
                {
                    await _database.user.AddAsync(new User {email = model.Email, name = model.Name, surname = model.Surname, phone = model.Phone, password = model.Password, address_id = 1});
                    await _database.SaveChangesAsync();
                    await Authenticate((await _database.user.FirstOrDefaultAsync(u => u.email == model.Email)).email);
                    user = await _database.user.FirstOrDefaultAsync(u => u.email == model.Email);
                    return RedirectToAction("Welcome", "Home", user);
                }
                ModelState.AddModelError("", "Something is wrong, try again");
            }
            return View(model);
        }
    }
}