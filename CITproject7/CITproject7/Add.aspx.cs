using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        string[] price = { "", "35000", "23000", "5000", "700", "250" };
        Image1.ImageUrl = "pics/" + DropDownList1.Text + ".jpg";
        int i = DropDownList1.SelectedIndex;
        Label1.Text = "Rs." + price[i];
        Button1.Visible = true;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (ItemAdded(DropDownList1.Text))
        {
            Response.Write("<script>alert('selected item is already added in cart')</script>");
            return;
        }
        Session["ctr"] = (int)Session["ctr"] + 1;
        Product proj = new Product(DropDownList1.Text, Image1.ImageUrl, Label1.Text);
        Session["p" + Session["ctr"]] = proj;
        Server.Transfer("Add.aspx");
    }
    bool ItemAdded(string name)
    {
        bool found = false;
        for (int c = 1; c <= (int)Session["ctr"]; c++)
        {
            Product p = (Product)Session["p" + c];
            if (name == p.name)
            {
                found = true;
                break;
            }
        }
        return found;

    }

}