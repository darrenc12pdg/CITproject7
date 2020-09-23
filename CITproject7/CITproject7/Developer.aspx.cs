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
    public partial class Developer : System.Web.UI.Page
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


                TextBox1.Text = Session["Project"].ToString();
                if (!IsPostBack)
                {

                    bindProject();
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
                    ddlProject.DataSource = dt;

                    ddlProject.DataTextField = "ProjectName";
                    ddlProject.DataValueField = "ProjectId";
                    ddlProject.DataBind();
                    ddlProject.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }
        private void bindDeveloper()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT AllTeam.AllTeamID, Users.Developer, Users.Email, Users.Id,  ProjectName.ProjectName , ProjectName.ProjectManager FROM AllTeam INNER JOIN Users ON AllTeam.UserId = Users.ID INNER JOIN ProjectName ON AllTeam.ProjectId = ProjectName.ProjectId Where Users.Developer = 1 AND ProjectName.ProjectName  ='" + TextBox1.Text + "'", con);
    
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
            string insertQuery = "insert into Developers (Email,UserId,ProjectId) values(@Email,@UserId,@ProjectId)";
            SqlCommand com = new SqlCommand(insertQuery, conn);

            com.Parameters.AddWithValue("@Email", ddlDeveloper.SelectedItem.Value);
            com.Parameters.AddWithValue("@UserId", ddlDeveloper.SelectedItem.Value);
            com.Parameters.AddWithValue("@ProjectId", ddlProject.SelectedItem.Value);

            com.ExecuteNonQuery();
            ddlDeveloper.ClearSelection();
            ddlDeveloper.Items.FindByValue("0").Selected = true;
            ddlDeveloper.ClearSelection();
            ddlDeveloper.Items.FindByValue("0").Selected = true;
            ddlProject.ClearSelection();
            ddlProject.Items.FindByValue("0").Selected = true;

            Response.Write("Yes: Registration is GO");
            conn.Close();

        }
    }

}

