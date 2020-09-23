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
    public partial class Check_Roles : System.Web.UI.Page
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

                 
               

                }
            }
        }
       
        
        protected void Add_Click(object sender, EventArgs e)
        {
            
  
        }
    }
}