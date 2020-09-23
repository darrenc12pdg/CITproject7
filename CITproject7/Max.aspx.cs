using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CITproject7
{
    public partial class Max : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Max Test Code. Works
        protected void Button1_Click(object sender, EventArgs e)
        {
            string[] list = TextBox1.Text.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
            int[] numbers = new int[list.Length];

            for (int i = 0; i < numbers.Length; i++)
            {
                numbers[i] = Convert.ToInt32(list[i].Trim());

            }
            Array.Sort(numbers);

            int max = numbers.Max();

            TextBox2.Text = max.ToString();
        }
        //back button
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Calculations.aspx");
        }

    }
}