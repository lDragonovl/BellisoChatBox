﻿using BusinessObject.Model.Entity;
using BusinessObject.Model.Page;
using System.Linq.Expressions;

namespace DataAccess.IRepository
{
    public interface IAccountRepository
    {
        public bool Login(LoginAccountModel userLogin);
        public bool ChangePassword(string username, string newPassword);
        public bool Regist(AccountModel userRegist);
        public AccountModel GetAccount<T>(Expression<Func<Customer, bool>> filterExpression);
        public AccountModel GetAccountByUsername(string username);
        public bool UpdateCustomerInfor(AccountModel accountModel);
        public string getUsername(string username);

        public string GetAccountByEmail(string email);

        public bool ForgetPassword(string password, string email);
    }
}
