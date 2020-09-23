using StatsLib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CITproject7
{
    public partial class Mean : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["New"] != null)
            {
                Label_welcome.Text += Session["New"].ToString();
                Label_ID.Text += Session["UserID"].ToString();

            }

            // Redirect if the User ID does not exist
            else
            {
                Response.Redirect("Login.aspx");
            }
           
    }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Mean Test Code. Calulates the mean value in the given array
            string[] list = TextBox1.Text.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
            int[] numbers = new int[list.Length];
            for (int i = 0; i < numbers.Length; i++)
            {
                numbers[i] = Convert.ToInt32(list[i].Trim());
            }

            Array.Sort(numbers);
            Stats s = new Stats();
            TextBox2.Text = s.Mean(numbers).ToString();
        }
        //back button
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Calculations.aspx");
        }

    }
}