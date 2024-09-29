﻿using BusinessObject.Model.Page;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Reflection;
using System.Resources;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Service
{
    public class EmailService
    {
        private readonly CartService _cartService;
        private readonly ProductService _productService;
        private readonly AccountService _accountService;

        public EmailService(CartService cartService, ProductService productService, AccountService accountService)
        {
            _cartService = cartService;
            _productService = productService;
            _accountService = accountService;
        }

        public void Invoice(OrderModel orderModel, string table_content)
        {
            try
            {
                var account = _accountService.getAccount(orderModel.Username);

                string fromEmail = "bellisoshop@gmail.com";
                string password = "nhzjhkdbhhzkiran";

                string reciever = account.Email;

                string resxFilePath = "DataAccess.Resource.Template";

                ResourceManager resourceManager = new ResourceManager(resxFilePath, Assembly.GetExecutingAssembly());

                string htmlContent = resourceManager.GetString("invoice");

                htmlContent = htmlContent.Replace("@param01", orderModel.OrderId);
                htmlContent = htmlContent.Replace("@param02", orderModel.StartDate.ToString());
                htmlContent = htmlContent.Replace("@param03", orderModel.TotalPrice.ToString());
                htmlContent = htmlContent.Replace("@param04", orderModel.Fullname);
                htmlContent = htmlContent.Replace("@param05", orderModel.Phone);
                htmlContent = htmlContent.Replace("@param06", orderModel.Address);

                htmlContent = htmlContent.Replace("@param07", table_content);

                MailMessage message = new MailMessage();
                message.From = new MailAddress(fromEmail);
                message.Subject = "Invoice";
                message.To.Add(new MailAddress(reciever));
                message.Body = htmlContent;
                message.IsBodyHtml = true;

                var smtpClient = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    Credentials = new NetworkCredential(fromEmail, password),
                    EnableSsl = true,
                };
                smtpClient.Send(message);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Unexpected error: {ex.Message}");
                Console.WriteLine($"Stack Trace: {ex.StackTrace}");
            }
        }

        public string VerifyEmail( string email)
        {
            try
            {

                string fromEmail = "bellisoshop@gmail.com";
                string password = "nhzjhkdbhhzkiran";

                string reciever = email;

                Random random = new Random();

                string otp = random.Next(100000, 999999).ToString();

                DateTime date = DateTime.Now;

                string resxFilePath = "DataAccess.Resource.Template";

                ResourceManager resourceManager = new ResourceManager(resxFilePath, Assembly.GetExecutingAssembly());


                string htmlContent = resourceManager.GetString("Email");
                htmlContent = htmlContent.Replace("@param01", date.ToString());
                htmlContent = htmlContent.Replace("@param03", otp);
                htmlContent = htmlContent.Replace("@param04", fromEmail);

                MailMessage message = new MailMessage();
                message.From = new MailAddress(fromEmail);
                message.Subject = "The OTP to reset password";
                message.To.Add(new MailAddress(reciever));
                message.Body = htmlContent;
                message.IsBodyHtml = true;

                var smtpClient = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    Credentials = new NetworkCredential(fromEmail, password),
                    EnableSsl = true,
                };

                // Send the email
                try
                {
                    smtpClient.Send(message);
                    return otp;
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error sending email: {ex.Message}");
                    Console.WriteLine($"Stack Trace: {ex.StackTrace}");
                }

                return otp;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Unexpected error: {ex.Message}");
                Console.WriteLine($"Stack Trace: {ex.StackTrace}");
                return null;
            }
        }
    }
}
