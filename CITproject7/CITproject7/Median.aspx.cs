using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CITproject7
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Median Test Code. Works
            string[] list = TextBox1.Text.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
            int[] numbers = new int[list.Length];
            for (int i = 0; i < numbers.Length; i++)
            {
                numbers[i] = Convert.ToInt32(list[i].Trim());
            }

            // Create a copy of the input, and sort the copy
            int[] temp = numbers.ToArray();
            Array.Sort(temp);
            int count = temp.Length;
            if (count == 0)
            {
                Label1.Visible = true;
            }
            else if (count % 2 == 0)
            {
                // count is even, average two middle elements
                int a = temp[count / 2 - 1];
                int b = temp[count / 2];
                decimal result = (a + b) / 2m;
                TextBox2.Text = result.ToString();
            }
            else
            {
                // count is odd, return the middle element
                decimal result = temp[count / 2];
                TextBox2.Text = result.ToString();
            }
        }

        //back button
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Calculations.aspx");
        }
    }
}