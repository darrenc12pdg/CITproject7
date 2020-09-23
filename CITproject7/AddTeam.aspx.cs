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
    public partial class AddTeam : System.Web.UI.Page
    {
        private string test123;
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
                    bindUser();
                    bindProject();
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
        private void bindUser()
        {

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from Users", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlUser.DataSource = dt;
                    ddlUser.DataTextField = "Email";
                    ddlUser.DataValueField = "Id";
                    ddlUser.DataBind();
                    ddlUser.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }
       

        protected void Add_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string insertQuery = "insert into AllTeam (ProjectId,UserId,Email) values(@ProjectId,@UserId,@Email)";
            SqlCommand com = new SqlCommand(insertQuery, conn);
            
            com.Parameters.AddWithValue("@ProjectId", ddlProject.SelectedItem.Value);
            com.Parameters.AddWithValue("@UserId", ddlUser.SelectedItem.Value);
            com.Parameters.AddWithValue("@Email", ddlUser.SelectedItem.Value);
            test123 = ddlUser.SelectedItem.ToString();




            com.ExecuteNonQuery();
            Session["ProjectID"] = ddlProject.SelectedItem.Value;

            ddlProject.ClearSelection();
            ddlProject.Items.FindByValue("0").Selected = true;
            ddlUser.ClearSelection();
            ddlUser.Items.FindByValue("0").Selected = true;
            Session["ProjectID"] = "@ProjectId";
            Label_welcome.Text += test123.ToString();
            Label_welcome.Visible = true;

            conn.Close();

        }

        protected void ProductOwner_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductOwner.aspx");
                
        }
    }

}






