using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;

namespace CITproject7
{
    public partial class addProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                TextBox1.Text = Session["New"].ToString();

            }
            else
                Response.Redirect("Login.aspx");
        }
        protected void Submit_Click(object sender, EventArgs e)
        {


            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            { }

            string insertQuery = "insert into ProjectName (ProjectName,ProjectManager) values(@ProjectName,@ProjectManager)";
            SqlCommand com = new SqlCommand(insertQuery, conn);

            com.Parameters.AddWithValue("@ProjectName", TextBoxN.Text);
            com.Parameters.AddWithValue("@ProjectManager", TextBox1.Text);


            com.ExecuteNonQuery();

            Response.Write("Yes: Registration is GO");
            Session["Project"] = TextBoxN.Text;
            Response.Write("Password is Correct");
            Response.Redirect("Link.aspx");

            conn.Close();
        }


    }
}