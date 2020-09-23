<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="CITproject7.Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head<asp:MultiView ID="MultiView1" runat="server">
 <asp:View ID="View1" runat="server">...</asp:View>
 <asp:View ID="View2" runat="server">...</asp:View>
 <asp:View ID="View3" runat="server">...</asp:View>
</asp:MultiView> 


</head>

 <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
 <asp:View ID="View4" runat="server">
 <b>Product Owner<br />
 <br />
 </asp:View>
 <asp:View ID="View5" runat="server">
 <b>Developer</b><br />
 <br />
 Text content.
 </asp:View>
 <asp:View ID="View6" runat="server">
 <b>Project Manager</b><br />
 <br />
 <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
 </asp:View>
</asp:MultiView> 



<body>
    <form id="form1" runat="server" class="auto-style1">
        <div>
        </div>
        <asp:Label ID="Label_welcome" runat="server" Text="Welcome"></asp:Label>
        <br />
        <asp:Button ID="B_Logout" runat="server" OnClick="B_Logout_Click" Text="Logout" />
    </form>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
<title>CSS Template</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
    box-sizing: border-box;
}

body {
    font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
    background-color: #666;
    padding: 30px;
    text-align: center;
    font-size: 35px;
    color: white;
}

/* Container for flexboxes */
section {
    display: -webkit-flex;
    display: flex;
}

/* Style the navigation menu */
nav {
    -webkit-flex: 1;
    -ms-flex: 1;
    flex: 1;
    background: #ccc;
    padding: 20px;
}

/* Style the list inside the menu */
nav ul {
    list-style-type: none;
    padding: 0;
}

/* Style the content */
article {
    -webkit-flex: 3;
    -ms-flex: 3;
    flex: 3;
    background-color: #f1f1f1;
    padding: 10px;
}

/* Style the footer */
footer {
    background-color: #777;
    padding: 10px;
    text-align: center;
    color: white;
}

/* Responsive layout - makes the menu and the content (inside the section) sit on top of each other instead of next to each other */
@media (max-width: 600px) {
    section {
      -webkit-flex-direction: column;
      flex-direction: column;
    }
}
</style>
</head>
<body>




<header>
  <h2>Welcome to the Scrum Management System</h2>
</header>

<section>
  <nav>
    <ul>
      <li><a href="newProduct.aspx">Create new Project</a></li>
      <li><a href="#">View current projects</a></li>
      <li><a href="#">Search</a></li>
    </ul>
  </nav>
  
  <article>
    <h1>London</h1>
    <p>London is the capital city of England. It is the most populous city in the  United Kingdom, with a metropolitan area of over 13 million inhabitants.</p>
    <p>Standing on the River Thames, London has been a major settlement for two millennia, its history going back to its founding by the Romans, who named it Londinium.</p>
  </article>
</section>

<footer>
  <p>CIT 7 2018</p>
</footer>

</body>
</html>

