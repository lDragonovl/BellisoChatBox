﻿using DataAccess.IRepository;
using DataAccess.Repository;
using DataAccess.Service;
using Microsoft.Extensions.DependencyInjection;

namespace DataAccess.Core
{
    public static class DependencyInjection
    {
        public static void ConfigureDependencyInjection(this IServiceCollection services)
        {
            // Register the repository
            services.AddScoped<IAccountRepository, AccountRepository>();
            services.AddScoped<IBrandRepository, BrandRepository>();
            services.AddScoped<ICategoryRepository, CategoryRepository>();
            services.AddScoped<IProductAttributeRepository, ProductAttributeRepository>();
            services.AddScoped<IProductImageRepository, ProductImageRepository>();
            services.AddScoped<IProductRepository, ProductRepository>();
            services.AddScoped<IImportProductRepository, ImportProductRepository>();
            services.AddScoped<IReceiptProductRepository, ReceiptProductRepository>();
            services.AddScoped<ICartRepository, CartRepository>();
            services.AddScoped<IOrderRepository, OrderRepository>();
            services.AddScoped<IOrderDetailRepository, OrderDetailRepository>();
            services.AddScoped<IManagerRepository, ManagerRepository>();
            services.AddScoped<IAddressRepository, AddressRepository>();

            services.AddScoped<AccountService>();
            services.AddScoped<BrandService>();
            services.AddScoped<CategoryService>();
            services.AddScoped<HeaderService>();
            services.AddScoped<HomeService>();
            services.AddScoped<ProductAttributeService>();
            services.AddScoped<ProductImageService>();
            services.AddScoped<ProductService>();
            services.AddScoped<ProductDetailService>();
            services.AddScoped<ShopService>();
            services.AddScoped<ImportReceiptService>();
            services.AddScoped<ReceiptProductService>();
            services.AddScoped<CartService>();
            services.AddScoped<OrderService>();
            services.AddScoped<OrderDetailService>();
            services.AddScoped<ManagerService>();
            services.AddScoped<OrderService>();
            services.AddScoped<AddressService>();
            services.AddScoped<OrderDetailService>();
            services.AddScoped<EmailService>();

            // Other service registrations
        }
    }
}
