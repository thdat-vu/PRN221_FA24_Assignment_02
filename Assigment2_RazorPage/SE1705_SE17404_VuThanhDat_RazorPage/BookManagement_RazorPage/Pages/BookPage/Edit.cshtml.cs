using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using BookManagement_BusinessObjects;
using BookManagement_Daos;
using BookManagement_Services;

namespace BookManagement_RazorPage.Pages.BookPage
{
    public class EditModel : PageModel
    {
		private readonly IBookService _bookService;
        private readonly ICategoryService _categoryService;
		public EditModel(IBookService bookService, ICategoryService categoryService)
		{
			this._bookService = bookService;
            this._categoryService = categoryService;
		}

		[BindProperty]
        public Book Book { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int id)
        {
            if (id == null || _bookService.GetBooks() == null)
            {
                return NotFound();
            }

            var book =  _bookService.GetBook(id);
            if (book == null)
            {
                return NotFound();
            }
            Book = book;
           ViewData["CategoryId"] = new SelectList(_categoryService.GetCategories(), "Id", "Name");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            
            try
            {
                 _bookService.UpdateBook(Book);
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BookExists(Book.Id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool BookExists(int id)
        {
          //return (_context.Books?.Any(e => e.Id == id)).GetValueOrDefault();
          return BookExists(id);
        }
    }
}
