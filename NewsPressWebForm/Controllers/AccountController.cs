using NewsPressWebForm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web;
using System.Threading;
using System.Security.Principal;
using System.Text;

namespace NewsPressWebForm.Controllers
{
    [AllowAnonymous]
    public class AccountController : ApiController
    {
        public IHttpActionResult Post(Users _user)
        {
            using (var context = new PressNewsContext())
            {
                var res = context.Users.Any(user => user.UserName.Equals(_user.UserName) && user.Password.Equals(_user.Password));

                if (res)
                {
                    var token = _user.UserName + ':' + _user.Password;
                    var tokenBytes = Encoding.UTF8.GetBytes(token);
                    var encodedToken = Convert.ToBase64String(tokenBytes);
                    return Ok(encodedToken);
                }
            }
            return Unauthorized();
        }
    }
}
