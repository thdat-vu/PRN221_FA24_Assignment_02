using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using BookManagement_BusinessObjects;
using BookManagement_Daos;
using BookManagement_Services;

namespace BookManagement_RazorPage.Pages.OrderPage
{
    public class IndexModel : PageModel
    {
        private readonly IOrderService _orderService;
        private readonly IAccountService _accountService;   
        public IndexModel(IOrderService orderService, IAccountService accountService)
        {
            this._orderService = orderService;
            this._accountService = accountService;
        }

        public IList<Order> Order { get;set; } = default!;
        public IList<Account> Account { get; set; } = default!;
        public async Task OnGetAsync()
        {
            if (_orderService.GetOrders != null)
            {
                Order = _orderService.GetOrders();
                foreach (var order in Order)
                {
                    order.Account = _accountService.GetAccountById(order.AccountId);
                }
            }
        }
    }
}
