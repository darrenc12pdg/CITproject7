using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace CITproject7
{
    public partial class Users : System.Web.UI.Page
    {
        // Creating a new session variable based on the user ID 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                Label_welcome.Text += Session["New"].ToString();
                Label_ID.Text += Session["UserID"].ToString();

            }

            // Redirect if the User ID does not exist
            else
                Response.Redirect("Login.aspx");
        }

        // Enables the user to log back out
        protected void B_Logout_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");
        }

      
    }
    }