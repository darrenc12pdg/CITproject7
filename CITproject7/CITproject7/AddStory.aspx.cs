using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.IO;
using System.Data;

namespace CITproject7
{
    public partial class AddStory : System.Web.UI.Page
    {

        // Page Load, call all Sessions. Add Session for Project name into TextBox1 and Username of User logged in as Textbox2
        // Add these sessions into labels to be used to call the Project name and Username 
        protected void Page_Load(object sender, EventArgs e)
        {
            
                {
                    if (Session["New"] != null)
                    {


                        TextBox1.Text = Session["Project"].ToString();
                        TextBox2.Text = Session["New"].ToString();
                        Label_welcome.Text += Session["New"].ToString();
                        Label_project.Text += Session["Project"].ToString();
                   
                    }
                    else
                        Response.Redirect("Login.aspx");
                }
            
        }

     
        //Enter User Story when select Enter_Click button, will send the Textbox holding the User story and save it into the Story Database as well as the Projectname
        //If story , is entered correctly then show label, to say User story was entered correctly 
protected void Enter_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string insertQuery = "insert into Story (Story,ProjectName) values(@Story,@ProjectName)";
            SqlCommand com = new SqlCommand(insertQuery, conn);

            com.Parameters.AddWithValue("@Story", EnterStory.Text);
            com.Parameters.AddWithValue("@ProjectName", TextBox1.Text);


            com.ExecuteNonQuery();

            Response.Write("Yes: Registration is GO");
            Label_success.Visible = true; 
        }
    }
}