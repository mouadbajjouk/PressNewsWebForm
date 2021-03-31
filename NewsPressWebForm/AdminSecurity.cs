using NewsPressWebForm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace NewsPressWebForm
{
    public class AdminSecurity
    {
        public static bool Login(string username, string password)
        {
            using (var context = new PressNewsContext())
            {
                return context.Users.Any(user => user.UserName.Equals(username) && user.Password.Equals(password));
            }
        }
    }
}