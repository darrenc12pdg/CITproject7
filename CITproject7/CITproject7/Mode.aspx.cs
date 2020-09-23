using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MoreLinq;

namespace CITproject7
{
    public partial class Mode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Mode Test Code. Works
        protected void Button1_Click(object sender, EventArgs e)
        {
            string[] list = TextBox1.Text.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
            int[] numbers = new int[list.Length];
            for (int i = 0; i < numbers.Length; i++)
            {
                numbers[i] = Convert.ToInt32(list[i].Trim());
            }

            Array.Sort(numbers);
            var mode = numbers.GroupBy(n => n)
            .MaxBy(g => g.Count())
            .Select(g => g.Key);

            var result = string.Join(",", mode.Select(z => z.ToString()));
            TextBox2.Text = result;



        }
        //back button
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Calculations.aspx");
        }
    }
}