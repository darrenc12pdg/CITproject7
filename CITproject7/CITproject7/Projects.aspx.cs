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
    public partial class Projects : System.Web.UI.Page
    {

        //Checking if session is correct for the user
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                Label_welcome.Text += Session["New"].ToString();
                TextBox1.Text = Session["New"].ToString();
                bindProject();

            }
            else
                Response.Redirect("Login.aspx");
        }

        //Logging out
        protected void B_Logout_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");
        }

        //Connecting to database and adding new project 
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
            Response.Redirect("Projects.aspx");

            conn.Close();
        }

        //Connecting to database and creating new session for adding a project and redirecting to AddUser page
        protected void Add_User(object sender, EventArgs e)
        {


            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();


            Response.Write("Yes: Registration is GO");
            Session["AddUser"] = TextBox1.Text;
            Session["Project"] = TextBoxN.Text;
            Response.Redirect("AddUser.aspx");

            conn.Close();
        }

        //Binding the projects so that the projects met by the SQL query will display in the Drop Down List
        private void bindProject()
        {

            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM [ProjectName] WHERE ([ProjectManager] ='" + TextBox1.Text + "')", conn);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (!IsPostBack)
                {
                    if (dt.Rows.Count != 0)
                    {
                        ddlProject.DataSource = dt;

                        ddlProject.DataTextField = "ProjectName";
                        ddlProject.DataValueField = "ProjectId";
                        ddlProject.DataBind();
                        ddlProject.Items.Insert(0, new ListItem("-Select-", "0"));

                    }
                }

                conn.Close();
            }
        }


        //Selecting a project and viewing team
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
                Response.Redirect("ViewTeam.aspx");

                conn.Close();
            }


        }

        //Link to Calculations page
        protected void Button_Calc_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string checkuser = "SELECT count(*) FROM Users Where Users.Username ='" + TextBox1.Text + "'  AND Users.ScrumMaster = 'True'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            conn.Close();
            if (temp == 1)
            {
                Response.Write("Password is Correct");

                Response.Redirect("Calculations.aspx");

            }
            else
            {
                Label1.Visible = true;
            }
            conn.Close();


        }
    }
}
