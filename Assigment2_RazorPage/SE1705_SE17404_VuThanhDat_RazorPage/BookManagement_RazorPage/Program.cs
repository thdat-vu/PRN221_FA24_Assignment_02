using BookManagement_Repositories;
using BookManagement_Services;

namespace BookManagement_RazorPage
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddRazorPages();
			// Repo + Service

			builder.Services.AddScoped<IAccountRepo, AccountRepo>();
			builder.Services.AddScoped<IAccountService, AccountService>();
			builder.Services.AddScoped<IBookRepo, BookRepo>();
            builder.Services.AddScoped<IBookService, BookService>();
			builder.Services.AddScoped<ICategoryRepo, CategoryRepo>();
            builder.Services.AddScoped<ICategoryService, CategorySerivce>();
			builder.Services.AddScoped<IOrderRepo, OrderRepo>();
            builder.Services.AddScoped<IOrderService, OrderService>();
			builder.Services.AddScoped<IOrderDetailRepo, OrderDetailRepo>();
            builder.Services.AddScoped<IOrderDetailService, OrderDetailService>();
			

            

            // Session
            builder.Services.AddSession();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.UseSession();
            app.MapRazorPages();
            app.Run();
        }
    }
}