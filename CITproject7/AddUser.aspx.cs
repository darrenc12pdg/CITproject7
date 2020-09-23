using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;


namespace CITproject7
{
    public partial class AddUser : System.Web.UI.Page
    {
        SqlConnection vid = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\users.mdf;Integrated Security=True");
        private string projectName;
        private string userEmail;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Project"] != null)
            {
                TextBox2.Text = Session["New"].ToString();
                //bindProject();
            }

            else
                Response.Redirect("Login.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            String str = "SELECT * FROM ProjectName WHERE (ProjectName LIKE '%' + @search + '%')";
            SqlCommand xp = new SqlCommand(str, vid);
            xp.Parameters.Add("@search", SqlDbType.NVarChar).Value = TextBox3.Text;

            bindProject();
        }


        protected void Button1_Click(object sender, EventArgs e)
        {

            String str = "SELECT * FROM Users WHERE (Email LIKE '%' + @search + '%')";
            SqlCommand xp = new SqlCommand(str, vid);
            xp.Parameters.Add("@search", SqlDbType.NVarChar).Value = TextBox1.Text;
            
            vid.Open();
            xp.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = xp;
            DataSet ds = new DataSet();
            da.Fill(ds, "Email");

            GridView1.DataSourceID = null;
            GridView1.DataSource = ds;
            GridView1.DataBind();

            vid.Close();

            bindUser();
            Button2.Visible = true;
        }

        private void bindProject()
        {

            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM [ProjectName] WHERE ([ProjectName] ='" + TextBox3.Text + "' AND ProjectName.ProjectManager ='" + TextBox2.Text + "' ) ", vid);
                vid.Open(); 
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
                vid.Close();
            }
        }

        
        private void bindUser()
        {

            {
                SqlCommand cmd = new SqlCommand("select * from Users WHERE Email='" + TextBox1.Text + "'", vid);
                vid.Open();
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
                vid.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            vid.Open();
            string insertQuery = "insert into AllTeam (ProjectId,UserId) values(@ProjectId,@UserId)";
            SqlCommand com = new SqlCommand(insertQuery, vid);

            userEmail = ddlUser.SelectedItem.ToString();
            projectName = ddlProject.SelectedItem.ToString();

            com.Parameters.AddWithValue("@ProjectId", ddlProject.SelectedItem.Value);
            com.Parameters.AddWithValue("@UserId", ddlUser.SelectedItem.Value);

            com.ExecuteNonQuery();
            ddlProject.ClearSelection();
            ddlProject.Items.FindByValue("0").Selected = true;
            ddlUser.ClearSelection();
            ddlUser.Items.FindByValue("0").Selected = true;


            MailMessage message = new MailMessage("CIT7Management@gmail.com", userEmail);
            message.Subject = "Welcome to " + projectName + "!";
            message.Body = "You have Successfully been added to " + projectName + " and you will being to work on tasks soon";

            SmtpClient client2 = new SmtpClient();

            client2.Send(message);


            //Response.Redirect("Projects.aspx");

            vid.Close();




        }
    }
}