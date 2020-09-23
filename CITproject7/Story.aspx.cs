

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace CITproject7
{
    public partial class Story : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                if (Session["New"] != null)
                {


                    TextBox1.Text = Session["Project"].ToString();
                    TextBox2.Text = Session["New"].ToString();


                }
                else
                    Response.Redirect("Login.aspx");
            }
        }
        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string checkuser = "SELECT count(*) FROM Owner1 Where Owner1.Username ='" + TextBox2.Text + "'  AND Owner1.ProjectName ='" + TextBox1.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                conn.Close();
                if (temp == 1)
                {
                    Response.Write("Password is Correct");
                    Response.Redirect("AddStory.aspx");


                }
                else
                {
                    Label1.Visible = true;
                }
                conn.Close();






                //conn.Open();
                //string checkPasswordQuery = "select Password from Users where UserName='" + TextBoxLoginUser.Text + "'";
                //SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn);
                //string password = passComm.ExecuteScalar().ToString().Replace(" ", "");
                // if (password == TextBoxLoginPass.Text)

                // Session["New"] = TextBoxLoginUser.Text;




                // conn.Close();
            }
        }

    }
}
  