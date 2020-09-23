using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace CITproject7
{
    public partial class Main_Project : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                
            }
            else

                Response.Redirect("Login.aspx");

            
            {
                

                if (!IsPostBack)
                {
                    BindDevelopers();
                    BindScrum();
                    bindOwner();
                    bindProject();
                }
            }
        }
        private void bindProject()
        {

            using (SqlConnection con = new SqlConnection(CS))

           
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM [ProjectName])", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);


                if (dt.Rows.Count != 0)
                {
                    ddlProject.DataSource = dt;
                    
                    ddlProject.DataTextField = "ProjectName";
                    ddlProject.DataValueField = "ProjectId";
                    ddlProject.DataBind();
                    ddlProject.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }
        private void bindOwner()
        {

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from Users where ProductOen = 1", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlOwners.DataSource = dt;
                    ddlOwners.DataTextField = "Email";
                    ddlOwners.DataValueField = "OwnerId";
                    ddlOwners.DataBind();
                    ddlOwners.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }
        private void BindScrum()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from Scrum", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlScrum.DataSource = dt;
                    ddlScrum.DataTextField = "Email";
                    ddlScrum.DataValueField = "ScrumId";
                    ddlScrum.DataBind();
                    ddlScrum.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }

        private void BindDevelopers()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from Developers", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlDeveloper.DataSource = dt;
                    ddlDeveloper.DataTextField = "Email";
                    ddlDeveloper.DataValueField = "ListId";
                    ddlDeveloper.DataBind();
                    ddlDeveloper.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string insertQuery = "insert into MainProject (ProjectName,ListId,ProductOwnerId,ScrumId,ProjectId) values(@ProjectName,@ListId,@ProductOwnerId,@ScrumId,@ProjectId)";
            SqlCommand com = new SqlCommand(insertQuery, conn);

            com.Parameters.AddWithValue("@ProjectName", txtPName.Text);
            com.Parameters.AddWithValue("@ProductOwnerId", ddlOwners.SelectedItem.Value);
            com.Parameters.AddWithValue("@ScrumId", ddlScrum.SelectedItem.Value);
            com.Parameters.AddWithValue("@ListId", ddlDeveloper.SelectedItem.Value);
            com.Parameters.AddWithValue("@ProjectId", ddlProject.SelectedItem.Value);
            



            com.ExecuteNonQuery();
            ddlOwners.ClearSelection();
            ddlOwners.Items.FindByValue("0").Selected = true;
            ddlScrum.ClearSelection();
            ddlScrum.Items.FindByValue("0").Selected = true;
            ddlDeveloper.ClearSelection();
            ddlDeveloper.Items.FindByValue("0").Selected = true;

            Response.Write("Yes: Registration is GO");
            conn.Close();

        }
    }

}






