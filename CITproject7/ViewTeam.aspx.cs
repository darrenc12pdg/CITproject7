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
    public partial class WebForm2 : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                Label_ID.Text += Session["UserID"].ToString();

                TextBox1.Text = Session["Project"].ToString();
                if (!IsPostBack)
                {

                    bindProject();
                    bindProductOwner();
                    bindProject1();
                    bindScrum1();

                }

                TextBox2.Text = Session["New"].ToString();

                CheckProductOwner();
                
            }
            else
                Response.Redirect("Login.aspx");

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

                ddlProject.DataValueField = "ProjectName";
               
                ddlProject.DataBind();
                ddlProject.Items.Insert(0, new ListItem("-Select-", "0"));
            }
        }
    }
    private void bindProductOwner()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("SELECT AllTeam.AllTeamID, Users.ProductOwner, Users.Email , Users.Username , Users.Id , ProjectName.ProjectName , ProjectName.ProjectManager FROM AllTeam INNER JOIN Users ON AllTeam.UserId = Users.ID INNER JOIN ProjectName ON AllTeam.ProjectId = ProjectName.ProjectId Where Users.ProductOwner = 1 AND ProjectName.ProjectName ='" + TextBox1.Text + "'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                    ddlProductOWner.DataSource = dt;
                    ddlProductOWner.DataValueField = "Username";
                    
                    ddlProductOWner.DataBind();
                    ddlProductOWner.Items.Insert(0, new ListItem("-Select-", "0"));
                }
        }
    }

        private void bindProject1()
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
                    ddlProject1.DataSource = dt;

                    ddlProject1.DataValueField = "ProjectId";
                    ddlProject1.DataTextField = "ProjectName";
                    
                    ddlProject1.DataBind();
                    ddlProject1.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }
        private void bindScrum1()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT Users.ScrumMaster, Users.Email, Users.Id, Users.Username , ProjectName.ProjectName , ProjectName.ProjectManager FROM AllTeam INNER JOIN Users ON AllTeam.UserId = Users.ID INNER JOIN ProjectName ON AllTeam.ProjectId = ProjectName.ProjectId Where Users.ScrumMaster = 1 AND ProjectName.ProjectName  ='" + TextBox1.Text + "'", con);
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

        protected void Add_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string insertQuery = "insert into Owner1 (Email,Username,ProjectName) values(@Email,@Username,@ProjectName)";
        SqlCommand com = new SqlCommand(insertQuery, conn);

            com.Parameters.AddWithValue("@Email", ddlProductOWner.SelectedValue.ToString());
            com.Parameters.AddWithValue("@Username", ddlProductOWner.SelectedValue.ToString());
            
            com.Parameters.AddWithValue("@ProjectName", ddlProject.SelectedValue.ToString());
            
            


            com.ExecuteNonQuery();
            ddlProductOWner.ClearSelection();
            ddlProductOWner.Items.FindByValue("0").Selected = true;
            ddlProductOWner.ClearSelection();
            ddlProductOWner.Items.FindByValue("0").Selected = true;
            ddlProject.ClearSelection();
            ddlProject.Items.FindByValue("0").Selected = true;
            ddlProject.ClearSelection();
            ddlProject.Items.FindByValue("0").Selected = true;
            ddlProductOWner.ClearSelection();
            ddlProductOWner.Items.FindByValue("0").Selected = true;


            conn.Close();
        Response.Redirect("Projects.aspx");
    }
        protected void Add_Click1(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string insertQuery = "insert into Scrum (Email,UserId,ProjectId) values(@Email,@UserId,@ProjectId)";
            SqlCommand com = new SqlCommand(insertQuery, conn);

            com.Parameters.AddWithValue("@Email", ddlScrum.SelectedItem.Value);
            com.Parameters.AddWithValue("@UserId", ddlScrum.SelectedItem.Value);
            com.Parameters.AddWithValue("@ProjectId", ddlProject1.SelectedItem.Value);

            com.ExecuteNonQuery();
            ddlScrum.ClearSelection();
            ddlScrum.Items.FindByValue("0").Selected = true;
            ddlScrum.ClearSelection();
            ddlScrum.Items.FindByValue("0").Selected = true;
            ddlProject1.ClearSelection();
            ddlProject1.Items.FindByValue("0").Selected = true;

            Response.Write("Yes: Registration is GO");
            conn.Close();

        }

        protected void FinishAddingScrum_Click(object sender, EventArgs e)
        {
            Response.Redirect("Check Roles.aspx");
        }

        public void CheckProductOwner()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("SELECT ProductOwner From Users WHERE Username ='" + TextBox2.Text + "'", conn);


            //cmd.Parameters[0].Value = cmd;
            Boolean s = (Boolean)cmd.ExecuteScalar();
            TextBox3.Text = s.ToString();

            conn.Close();
        }




        protected void B_Logout_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}