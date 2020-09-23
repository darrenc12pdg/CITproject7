using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace CITproject7
{
    public partial class Roles : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {

            }
            else

                Response.Redirect("Login.aspx");

            if (Session["Project"] != null)
            {


                TextBox1.Text = Session["New"].ToString();
                if (!IsPostBack)
                {

                    bindProject();
                    bindProductOwner();
                    bindScrum();
                    bindDeveloper();
                }
            }
        }
        private void bindProject()
        {

            using (SqlConnection con = new SqlConnection(CS))


            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM [ProjectName] WHERE ([ProjectManager] ='" + TextBox1.Text + "')", con);

                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);


                if (dt.Rows.Count != 0)
                {
                    ddlProductOWner.DataSource = dt;

                    ddlProductOWner.DataTextField = "ProjectName";
                    ddlProductOWner.DataValueField = "ProjectId";
                    ddlProductOWner.DataBind();
                    ddlProductOWner.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }
        private void bindProductOwner()
        {

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT AllTeam.AllTeamID, Users.ProductOwner, Users.Email,  ProjectName.ProjectName , ProjectName.ProjectManagerFROM((AllTeamINNER JOIN Users ON AllTeam.UserId = Users.ID)INNER JOIN ProjectName ON AllTeam.ProjectId = ProjectName.ProjectId) Where Users.ProductOwner = 1;); ", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlScrum.DataSource = dt;
                    ddlScrum.DataTextField = "Email";
                    ddlScrum.DataValueField = "Id";
                    ddlScrum.DataBind();
                    ddlScrum.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }

        private void bindScrum()
        {

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT AllTeam.AllTeamID, Users.ProductOwner, Users.Email,  ProjectName.ProjectName , ProjectName.ProjectManagerFROM((AllTeamINNER JOIN Users ON AllTeam.UserId = Users.ID)INNER JOIN ProjectName ON AllTeam.ProjectId = ProjectName.ProjectId) Where Users.ProductOwner = 1;); ", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlScrum.DataSource = dt;
                    ddlScrum.DataTextField = "Email";
                    ddlScrum.DataValueField = "Id";
                    ddlScrum.DataBind();
                    ddlScrum.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }

        private void bindDeveloper()
        {

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT AllTeam.AllTeamID, Users.ProductOwner, Users.Email,  ProjectName.ProjectName , ProjectName.ProjectManagerFROM((AllTeamINNER JOIN Users ON AllTeam.UserId = Users.ID)INNER JOIN ProjectName ON AllTeam.ProjectId = ProjectName.ProjectId) Where Users.ProductOwner = 1;); ", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlDeveloper.DataSource = dt;
                    ddlDeveloper.DataTextField = "Email";
                    ddlDeveloper.DataValueField = "Id";
                    ddlDeveloper.DataBind();
                    ddlDeveloper.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }



        protected void Add_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string insertQuery = "insert into AllTeam (ProjectId,UserId) values(@ProjectId,@UserId)";
            SqlCommand com = new SqlCommand(insertQuery, conn);
            





            com.ExecuteNonQuery();
          


            Response.Write("Yes: Registration is GO");

            conn.Close();

        }
    }

}