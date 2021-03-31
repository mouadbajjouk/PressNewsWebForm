using NewsPressWebForm.Controllers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewsPressWebForm
{
	public partial class _Default : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			//if (Session["user"] == null || !Session["user"].Equals("admin"))
			//{
			//	Response.Redirect("Login");
			//}
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			SqlConnection cnn;

			//connetionString = @"Data Source=WIN-50GP30FGO75;Initial Catalog=Demodb ;User ID=sa;Password=demol23";
			string connetionString = ConfigurationManager.ConnectionStrings["PressNewsConnectionString"].ConnectionString;
			cnn = new SqlConnection(connetionString);

			cnn.Open();

			SqlCommand command;
			SqlDataAdapter adapter = new SqlDataAdapter();
			string sql = "";

			//DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
			//int nextId = dv.Count + 1;

			//sql = "Insert into Categories(Id,Name,ImagePath) values ('" + nextId + "', '" + TextBox1.Text + "','" + TextBox2.Text + "')";


			command = new SqlCommand(sql, cnn);
			adapter.InsertCommand = new SqlCommand(sql, cnn);
			adapter.InsertCommand.ExecuteNonQuery();

			command.Dispose();
			cnn.Close();

			Response.Redirect("/");
			//SqlDataSource2.Insert();
		}

		protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
		{
			//DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
			//e.Command.Parameters.Add
			//e.Command.Parameters[0].Value = (dv.Count+1);
			//e.Command.Parameters[1].Value = TextBox1.Text;
			//e.Command.Parameters[2].Value = TextBox2.Text;

		}
	}
}