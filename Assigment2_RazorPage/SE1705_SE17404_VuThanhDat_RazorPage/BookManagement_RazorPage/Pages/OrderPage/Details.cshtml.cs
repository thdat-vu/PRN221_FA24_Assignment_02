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
    public class DetailsModel : PageModel
    {
        private readonly IOrderService _orderService;
        private readonly IOrderDetailService _orderDetailService;
        private readonly IBookService _bookService;
        private readonly IAccountService _accountService;

        public DetailsModel(IOrderService orderService, IOrderDetailService orderDetailService, IBookService bookService, IAccountService accountService)
        {
            this._orderService = orderService;
            this._orderDetailService = orderDetailService;
            this._bookService = bookService;
            this._accountService = accountService;
        }

        public Order Order { get; set; } = default!;
        public List<OrderDetail> OrderDetails { get; set; } = default!;

        public Book Book { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int id)
        {
            

            Order = _orderService.GetOrder(id); 
            Order.Account = _accountService.GetAccountById(Order.AccountId);
            if (Order == null)
            {
                return NotFound();
            }
            OrderDetails = _orderDetailService.GetOrderDetailsByOrderId(Order.Id);
            foreach (var detail in OrderDetails)
            {
                Book = _bookService.GetBook(detail.BookId);
                detail.Book = Book;
            }


            return Page();
        }
    }
}
