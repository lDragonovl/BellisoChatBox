﻿using BusinessObject.Model.Entity;
using BusinessObject.Model.Page;
using DataAccess.IRepository;
using ISUZU_NEXT.Server.Core.Extentions;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using System;
using System.Linq;

namespace DataAccess.Repository
{
    public class ProductRepository : IProductRepository
    {
        public List<ProductModel> GetProduct()
        {
            List<Product> products;
            try
            {
                var dbContext = new PrndatabaseContext();
                products = dbContext.Products.ToList();
                List<ProductModel> ProductModels = new List<ProductModel>();
                foreach (var product in products)
                {
                    ProductModel ProductModel = new ProductModel();
                    ProductModel.CopyProperties(product);
                    ProductModels.Add(ProductModel);
                }
                return ProductModels;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public List<ProductData> GetProductData()
        {
            List<Product> products;
            try
            {
                var dbContext = new PrndatabaseContext();
                products = dbContext.Products.ToList();

                List<ProductData> pro = new List<ProductData>();

                foreach (var product in products)
                {
                    ProductData ProductData = new ProductData();
                    ProductData.CopyProperties(product);
                    pro.Add(ProductData);
                }
                return pro;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public string GetNewProductID(int CatID)
        {
            try
            {
                using (var dbContext = new PrndatabaseContext())
                {
                    var lastProductId = dbContext.Products
                        .Where(p => p.CateId == CatID)
                        .OrderByDescending(p => p.ProId)
                        .Select(p => p.ProId)
                        .FirstOrDefault();

                    if (lastProductId == null)
                    {
                        var categoryKeyword = dbContext.Categories
                            .Where(c => c.CateId == CatID)
                            .Select(c => c.Keyword)
                            .FirstOrDefault();

                        if (categoryKeyword != null)
                        {
                            string newProductId = $"{categoryKeyword}001";
                            return newProductId;
                        }
                    }
                    else
                    {
                        string numericPart = lastProductId.Substring(2);
                        int currentNumber = int.Parse(numericPart);
                        int newNumber = currentNumber + 1;
                        string newProductId = $"{lastProductId.Substring(0, 2)}{newNumber:D3}";
                        return newProductId;
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the exception for debugging purposes
                Console.WriteLine($"An error occurred: {ex.Message}");
                // You might want to rethrow the exception here for handling further up the call stack.
            }

            // Return null only if an exception occurs or no product ID is found
            return null;
        }

        public void InsertProduct(ProductData product, List<string> imageLink, List<string> attribute, List<string> description)
        {
            Product _product = new Product
            {
                ProId = product.ProId,
                ProName = product.ProName,
                BrandId = product.BrandId,
                CateId = product.CateId,
                Discount = product.Discount,
                ProDes = product.ProDes,
                ProPrice = product.ProPrice,
                IsAvailable = true,
                ProQuan = 0
            };
            try
            {
                var dbContext = new PrndatabaseContext();
                dbContext.Products.Add(_product);
                dbContext.SaveChanges();

                foreach(var items in imageLink)
                {
                    dbContext.ProductImages.Add(new ProductImage { ProId = _product.ProId, ProImg = items});
                    dbContext.SaveChanges();
                }

                foreach (var (attr, desc) in attribute.Zip(description, (attr, desc) => (attr, desc)))
                {
                    dbContext.ProductAttributes.Add(new ProductAttribute
                    {
                        ProId = _product.ProId,
                        Description = desc,
                        Feature = attr
                    });
                    dbContext.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public ProductModel GetProduct(string pro_id)
        {
            Product product = new Product();
            ProductModel model = new ProductModel();
            try
            {
                var dbContext = new PrndatabaseContext();
                product = dbContext.Products.FirstOrDefault(p => p.ProId.Equals(pro_id));
                if(product != null)
                {
                    model = new ProductModel
                    {
                        ProId=product.ProId,
                        BrandId=product.BrandId,
                        CateId=product.CateId,
                        Discount= product.Discount,
                        ProPrice = product.ProPrice,
                        ProName = product.ProName,
                        ProDes = product.ProDes,
                        ProQuan = product.ProQuan,
                        IsAvailable= product.IsAvailable,
                    };                  
                }
                return model;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public void UpdateProduct(ProductData product, List<string> deleteList, List<string> imageLink, List<string> attribute, List<string> description)
        {
            /*
             * 1. Update product
             */
            Product _product = new Product
            {
                ProId = product.ProId,
                ProName = product.ProName,
                BrandId = product.BrandId,
                CateId = product.CateId,
                Discount = product.Discount,
                ProDes = product.ProDes,
                ProPrice = product.ProPrice,
                IsAvailable = product.IsAvailable,
                ProQuan = 0
            };

            try
            {
                var dbContext = new PrndatabaseContext();
                dbContext.Entry<Product>(_product).State = EntityState.Modified;
                dbContext.SaveChanges();

                //Delete from database
                foreach(var images in deleteList)
                {
                    ProductImage img = new ProductImage
                    {
                        ProId = _product.ProId,
                        ProImg = images
                    };
                    dbContext.ProductImages.Remove(img);
                }

                //Update from database
                foreach (var items in imageLink)
                {
                    dbContext.ProductImages.Add(new ProductImage { ProId = _product.ProId, ProImg = items });
                    dbContext.SaveChanges();
                }

                //Delete all attribute
                var attributeToRemove = dbContext.ProductAttributes.Where(b => b.ProId.Equals(_product.ProId)).ToList();

                dbContext.RemoveRange(attributeToRemove);
                dbContext.SaveChanges();

                foreach (var (attr, desc) in attribute.Zip(description, (attr, desc) => (attr, desc)))
                {
                    dbContext.ProductAttributes.Add(new ProductAttribute
                    {
                        ProId = _product.ProId,
                        Description = desc,
                        Feature = attr
                    });
                    dbContext.SaveChanges();
                }



            }
            catch (Exception ex)
            {
                
            }
        }

        public async Task<bool> AddQuantityToProductAsync(List<ReceiptProductModel> products)
        {
            try
            {
                using (var dbContext = new PrndatabaseContext())
                {
                    foreach (var item in products)
                    {
                        var _product = await dbContext.Products.FirstOrDefaultAsync(p => p.ProId == item.ProId);

                        if (_product == null)
                        {
                            return false; // Early return if any product is not found
                        }
                        _product.ProQuan += item.Amount;
                        dbContext.Entry(_product).State = EntityState.Modified;
                    }
                    await dbContext.SaveChangesAsync();
                    return true; // Operation successful
                }
            }
            catch (Exception ex)
            {
                // Log the exception if necessary
                return false;
            }
        }

        public async Task<bool> AddQuantityFromProductAsync(List<OrderDetailModel> products)
        {
            try
            {
                using (var dbContext = new PrndatabaseContext())
                {
                    foreach (var item in products)
                    {
                        var _product = await dbContext.Products.FirstOrDefaultAsync(p => p.ProId == item.ProId);

                        if (_product == null)
                        {
                            return false; // Early return if any product is not found
                        }
                        _product.ProQuan += item.Quantity;
                        dbContext.Entry(_product).State = EntityState.Modified;
                    }
                    await dbContext.SaveChangesAsync();
                    return true; // Operation successful
                }
            }
            catch (Exception ex)
            {
                // Log the exception if necessary
                return false;
            }
        }

        public async Task<bool> ChangeProductStatus(ProductModel product, bool Status)
        {
            try
            {
                using (var dbContext = new PrndatabaseContext())
                {
                    var _product = await dbContext.Products.FirstOrDefaultAsync(p => p.ProId == product.ProId);
                    _product.IsAvailable = Status;
                    dbContext.Entry(_product).State = EntityState.Modified;
                    await dbContext.SaveChangesAsync();
                    return true; // Operation successful
                }
            }
            catch (Exception ex)
            {
                // Log the exception if necessary
                return false;
            }
        }

        public bool UpdateQuantityProduct(ProductModel productModel)
        {
            try
            {
                using (var dbContext = new PrndatabaseContext())
                {
                    var product = dbContext.Products.FirstOrDefault(p => p.ProId == productModel.ProId);
                    if (product != null)
                    {
                        product.ProQuan = productModel.ProQuan;
                        dbContext.SaveChanges();
                        return true;
                    }
                    else
                    {
                        return false; // Product not found
                    }
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        public List<ProductData> SearchProduct(string pattern)
        {
            List<Product> products = new List<Product>();

            List<ProductData> model = new List<ProductData>();
            try
            {
                var dbContext = new PrndatabaseContext();
                products = dbContext.Products.Where(p=>p.ProName.Contains(pattern)).ToList();
                if (products != null)
                {
                    foreach(var product in products)
                    {
                        

                        model.Add(new ProductData
                        {
                            ProId = product.ProId,
                            ProName = product.ProName,
                            Discount = product.Discount,
                            IsAvailable = product.IsAvailable,
                            ProPrice = product.ProPrice
                    });
                    }                    
                }
                return model;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
