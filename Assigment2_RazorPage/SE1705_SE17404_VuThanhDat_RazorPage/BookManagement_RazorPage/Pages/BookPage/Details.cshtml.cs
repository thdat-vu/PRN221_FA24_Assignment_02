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

namespace BookManagement_RazorPage.Pages.BookPage
{
    public class DetailsModel : PageModel
    {
		private readonly IBookService _bookService;

		public DetailsModel(IBookService bookService)
		{
			this._bookService = bookService;
		}

		public Book Book { get; set; } = default!; 

        public async Task<IActionResult> OnGetAsync(int id)
        {
            if (id == null || _bookService.GetBooks() == null)
            {
                return NotFound();
            }

            var book = _bookService.GetBook(id);
            if (book == null)
            {
                return NotFound();
            }
            else 
            {
                Book = book;
            }
            return Page();
        }
    }
}
