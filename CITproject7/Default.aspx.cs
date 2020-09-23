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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string checkuser = "select count(*) from Users where UserName='" + TextBoxUN.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                if (temp == 1)
                {
                    Response.Write("Username  already Exists ");
                }
                conn.Close();
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
            {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand check_User_Name = new SqlCommand("SELECT COUNT(*) FROM Users WHERE ([Username] = @user)", conn);
            check_User_Name.Parameters.AddWithValue("@user", TextBoxUN.Text);
            int UserExist = (int)check_User_Name.ExecuteScalar();
            Int64 PID = Convert.ToInt64(check_User_Name.ExecuteScalar());

            String savePath = @"~\img\";
            String extension;

            if (UserExist > 0)
            {
                Response.Write("Username already exists");
                 
            }
            else
            {
                if (FileUpload1.HasFile)
                {
                    // you have to create a folder in which to store the images
                    String fileName = FileUpload1.FileName;

                    extension = Path.GetExtension(savePath);

                    savePath += fileName;

                    //var savePath = Path.Combine(Server.MapPath("~/img"), FileUpload1.FileName);
                    FileUpload1.SaveAs(Server.MapPath(savePath + extension));


                }

                string insertQuery = "insert into Users (FirstName,SecondName,UserName,Password,Email,ProductOwner,ScrumMaster,Developer,ConfirmPassword,Image1) values(@FName,@SName,@UserName,@Password,@Email,@ProductOwner,@ScrumMaster,@Developer,@ConfirmPassword,@Image1)";
                    SqlCommand com = new SqlCommand(insertQuery, conn);

                    com.Parameters.AddWithValue("@FName", TextBoxFN.Text);
                    com.Parameters.AddWithValue("@SName", TextBoxSN.Text);
                    com.Parameters.AddWithValue("@UserName", TextBoxUN.Text);
                    com.Parameters.AddWithValue("@Password", TextBoxPass.Text);
                    com.Parameters.AddWithValue("@ConfirmPassword", TextBoxConPass.Text);
                    com.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
                    com.Parameters.AddWithValue("@ProductOwner", CheckBoxProduct.Checked.ToString());
                    com.Parameters.AddWithValue("@ScrumMaster", CheckBoxScrum.Checked.ToString());
                    com.Parameters.AddWithValue("@Developer", CheckBoxDeveloper.Checked.ToString());

                    //SqlParameter imageParameter = new SqlParameter("@Image1", SqlDbType.Image);
                    //imageParameter.Value = DBNull.Value;
                    //com.Parameters.Add(imageParameter);
                    com.Parameters.AddWithValue("@Image1", savePath);

              



                MailMessage message = new MailMessage("CIT7Management@gmail.com", TextBoxEmail.Text.ToString());

                message.Subject = "Welcome " + TextBoxFN.Text.ToString() + "!";

                message.Body = "You have successfully registered to the Scrum Management System. You can now log in with: "
                                + TextBoxUN.Text + " and your unique password.";


                SmtpClient client = new SmtpClient();

                client.Send(message);


                com.ExecuteNonQuery();
                    Response.Redirect("Login.aspx");
                    Response.Write("Yes: Registration is GO");
                    conn.Close();
                }
                
           
        }
    }
}