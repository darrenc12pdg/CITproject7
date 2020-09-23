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

        // Link to median page
        protected void Median_Btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Median.aspx");
        }

        // Link to average page
        protected void Mean_Btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mean.aspx");
        }

        // Link to Mode page
        protected void Mode_Btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mode.aspx");
        }

        // Link to Minimum page
        protected void Min_Btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Min.aspx");
        }

        // Link to maximum page
        protected void Max_Btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Max.aspx");
        }
    }
}