﻿using BusinessObject.Model.Page;
using DataAccess.Core.Constants;


namespace DataAccess.Service
{
    public class HomeService
    {
        private readonly ProductService productService;

        public HomeService(ProductService productService)
        {
            this.productService = productService;
        }

        public HomeModel GetData()
        {            
            var productList = productService.GetProducts();
            
            HomeModel homeModel = new HomeModel
            {
                specialSale = productList.OrderByDescending(p => p.Discount).Where(p=> p.IsAvailable) // Assuming Discount is a property in the product model
                          .Take(8)
                          .ToList(),
                mouse = productList.Where(p => p.CateId.Equals((int)CategoryType.Mouse) && p.IsAvailable).Take(8).ToList(),
                keyboard = productList.Where(p => p.CateId.Equals((int)CategoryType.Keyboard) && p.IsAvailable).Take(8).ToList(),
            };

            return homeModel;
        }
    }
}
