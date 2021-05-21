using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using InTravel.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using InTravel.Models;
using InTravel.ViewModels;
using Microsoft.EntityFrameworkCore;

namespace InTravel.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private Database _database;

        public HomeController(ILogger<HomeController> logger, Database ctx)
        {
            _logger = logger;
            _database = ctx;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Welcome(User user)
        {
            ViewData["user"] = user;
            ViewData["database"] = _database;
            return View();
        }

        public IActionResult Country(Country country)
        {
            ViewData["country"] = country;
            ViewData["database"] = _database;
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel {RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier});
        }
    }
}