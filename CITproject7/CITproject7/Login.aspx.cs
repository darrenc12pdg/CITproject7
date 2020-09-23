

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
  
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

     
        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {   //Connection string
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                //open connection string
                conn.Open();
                //Check to see if user is in the database
                string checkuser = "select count(*) from Users where UserName='" + TextBoxLoginUser.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                //close connection
                conn.Close();
                //Confirm password
                if (temp == 1)
                {                       //If password is correct you are directed to Users.aspx if not
                    //user sees message Username is not correct
                    conn.Open();
                    string checkPasswordQuery = "select Password from Users where UserName='" + TextBoxLoginUser.Text + "'";
                    SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn);
                    string password = passComm.ExecuteScalar().ToString().Replace(" ", "");

                    string userId = "select Id from Users where UserName='" + TextBoxLoginUser.Text + "'";
                    SqlCommand com2 = new SqlCommand(userId, conn);
                    userId = (String)com2.ExecuteScalar().ToString();

                    
                    if (password == TextBoxLoginPass.Text)
                    {
                        Session["UserID"] = userId;
                        Session["New"] = TextBoxLoginUser.Text;
                        Response.Write("Password is Correct");
                        Response.Redirect("Users.aspx");
                    }
                    else
                    {
                        Label1.Visible = true;
                    }
                }
                else
                {
                    Label2.Visible = true;
                }

                conn.Close();
            }
        }
    }
}





