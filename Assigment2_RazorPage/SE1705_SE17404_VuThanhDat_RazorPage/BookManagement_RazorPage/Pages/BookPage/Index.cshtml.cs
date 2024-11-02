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
using static System.Reflection.Metadata.BlobBuilder;

namespace BookManagement_RazorPage.Pages.BookPage
{
    public class IndexModel : PageModel
    {

        private readonly IBookService _bookService;
        private readonly ICategoryService _categoryService;

		public IndexModel(IBookService bookService, ICategoryService categoryService)
        {
            this._bookService = bookService;
            this._categoryService = categoryService;

		}

		public IList<Book> Books { get;set; } = default!;
		public IList<Category> Categories { get; set; } = default!;

		public async Task OnGetAsync()
        {
            if (_bookService.GetBooks ()!= null)
            {
                Books = _bookService.GetBooks();
				Categories = _categoryService.GetCategories();

				// Map category names to books based on CategoryId
				foreach (var book in Books)
				{
					book.Category = _categoryService.GetCategory(book.CategoryId);
				}
			}
        }
    }
}
