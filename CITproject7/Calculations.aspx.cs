using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CITproject7
{
    public partial class Calculations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void Median_Btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Median.aspx");
        }

        protected void Mean_Btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mean.aspx");
        }

        protected void Mode_Btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mode.aspx");
        }

        protected void Min_Btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Min.aspx");
        }

        protected void Max_Btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Max.aspx");
        }
    }
}