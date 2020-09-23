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
    public partial class ProductOwner : System.Web.UI.Page
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
                    bindProductOwner();
                   
                }
            }
        }
        private void bindProject()
        {

            using (SqlConnection con = new SqlConnection(CS))


            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM [ProjectName] WHERE ([ProjectName] ='" + TextBox1.Text + "')", con);

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
        private void bindProductOwner()
        {
            using (SqlConnection con = new SqlConnection(CS))
            { 
                SqlCommand cmd = new SqlCommand("SELECT AllTeam.AllTeamID, Users.ProductOwner, Users.Email, Users.Id,  ProjectName.ProjectName , ProjectName.ProjectManager FROM AllTeam INNER JOIN Users ON AllTeam.UserId = Users.ID INNER JOIN ProjectName ON AllTeam.ProjectId = ProjectName.ProjectId Where Users.ProductOwner = 1 AND ProjectName.ProjectName ='" + TextBox1.Text + "'", con);
                con.Open(); 
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlProductOWner.DataSource = dt;
                    ddlProductOWner.DataTextField = "Email";
                    ddlProductOWner.DataValueField = "Id";
                    ddlProductOWner.DataBind();
                    ddlProductOWner.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string insertQuery = "insert into Owner (Email,UserId,ProjectId) values(@Email,@UserId,@ProjectId)";
            SqlCommand com = new SqlCommand(insertQuery, conn);

            com.Parameters.AddWithValue("@Email", ddlProductOWner.SelectedItem.Value);
            com.Parameters.AddWithValue("@UserId", ddlProductOWner.SelectedItem.Value);
            com.Parameters.AddWithValue("@ProjectId", ddlProject.SelectedItem.Value);

            com.ExecuteNonQuery();
            ddlProductOWner.ClearSelection();
            ddlProductOWner.Items.FindByValue("0").Selected = true;
            ddlProductOWner.ClearSelection();
            ddlProductOWner.Items.FindByValue("0").Selected = true;
            ddlProject.ClearSelection();
            ddlProject.Items.FindByValue("0").Selected = true;

            
            conn.Close();
            Response.Redirect("Scrum.aspx");
        }
    }

}