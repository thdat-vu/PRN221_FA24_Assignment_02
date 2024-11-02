using BookManagement_BusinessObjects;
using BookManagement_Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace BookManagement_RazorPage.Pages
{
    public class LoginModel : PageModel
    {
        private IAccountService _accountService;
        public LoginModel(IAccountService accountService)
        {
            this._accountService = accountService;  
        }
        public void OnGet()
        {

        }

        public void OnPost() 
        {
			string username = Request.Form["txtUsername"];
			string password = Request.Form["txtPassword"];

            Account account = _accountService.GetAccount(username);

            if(account != null && account.Password.Equals(password))
            {
                string? role = account.Role;
                HttpContext.Session.SetString("Role", role);
                Response.Redirect("/BookPage/Index");
            }

		}
    }
}
