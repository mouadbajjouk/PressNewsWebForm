using NewsPressWebForm.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewsPressWebForm
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Response.Redirect("/");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //var x = AccountController.SignIn(this.TextBox1.Text, this.TextBox2.Text);

            //if (x)
            //{
            //    Response.Redirect("/");
            //}
        }
    }
}