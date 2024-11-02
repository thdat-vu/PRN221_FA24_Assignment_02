using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using BookManagement_BusinessObjects;
using BookManagement_Daos;
using BookManagement_Services;

namespace BookManagement_RazorPage.Pages.BookPage
{
    public class CreateModel : PageModel
    {
		private readonly IBookService _bookService;
        private readonly ICategoryService _categoryService;
        public CreateModel(IBookService bookService, ICategoryService categoryService)
		{
			this._bookService = bookService;
            this._categoryService = categoryService;
        }

		public IActionResult OnGet()
        {
            //ViewData["CategoryId"] = new SelectList(_context.Categories, "Id", "Name");
            // Retrieve categories from the service
            var categories = _categoryService.GetCategories();
            // Populate ViewBag.CategoryId with categories for dropdown
            ViewData["CategoryId"] = new SelectList(categories, "Id", "Name");
            return Page();
        }

        [BindProperty]
        public Book Book { get; set; } = default!;


        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (Book == null)
            {
                // Repopulate the dropdown if validation fails
                var categories = _categoryService.GetCategories();
                ViewData["CategoryId"] = new SelectList(categories, "Id", "Name");

                return Page();
            }

            _bookService.AddBook(Book);


            return RedirectToPage("./Index");
        }
    }
}
