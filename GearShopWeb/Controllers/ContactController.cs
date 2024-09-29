using Microsoft.AspNetCore.Mvc;

namespace GearShopWeb.Controllers
{
    public class ContactController : Controller
    {
        [HttpGet("/Contact")]
        public IActionResult Index()
        {
            return View();
        }
    }
}
