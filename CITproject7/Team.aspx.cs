using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Data;

namespace CITproject7
{
    public partial class Team : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        
            {
                if (Session["New"] != null)
                {
                 
                    TextBox1.Text = Session["New"].ToString();
                    Label_ID.Text += Session["UserID"].ToString();
                    bindProject();

            }
                else
                    Response.Redirect("Login.aspx");
            }
        private void bindProject()
        {

            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT Users.Id, ProjectName.ProjectName " +
                                                 "FROM dbo.ProjectName " +
                                                 "INNER JOIN AllTeam ON AllTeam.ProjectId = ProjectName.ProjectId " +
                                                 "INNER JOIN dbo.Users ON Users.Id = AllTeam.UserId " +
                                                 "WHERE UserId = '" + Label_ID.Text + "'", conn);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (!IsPostBack)
                {
                    if (dt.Rows.Count != 0)
                    {
                        ddlProject.DataSource = dt;

                        ddlProject.DataTextField = "ProjectName";
                        ddlProject.DataValueField = "Id";
                        ddlProject.DataBind();
                        ddlProject.Items.Insert(0, new ListItem("-Select-", "0"));

                    }
                }

                conn.Close();
            }
        }

        protected void view_Project(object sender, EventArgs e)
        {


            if (ddlProject.SelectedValue == "0")
            {
                Response.Write("Please Select a Project");
            }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                TextBox4.Text = ddlProject.SelectedItem.ToString();
          
                Session["Project"] = TextBox4.Text;
                Response.Redirect("Story.aspx");


                conn.Close();
            }

        }
    }
}