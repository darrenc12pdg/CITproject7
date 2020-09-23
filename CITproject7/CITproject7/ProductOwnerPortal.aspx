<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductOwnerPortal.aspx.cs" Inherits="CITproject7.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
</body>
</html>


<html lang="en">
<head>
<title>CSS Template</title>
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
    #form3 {
        width: 519px;
        height: 305px;
    }
    #TextArea1 {
        width: 1143px;
    }
</style>
</head>
<body>



<header>
  <h2>Welcome to the Product Owners Portal</h2>
</header>

<section>
  <nav>
      <p>
          View Product Data </p>
      <p>
          <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Height="351px" Width="463px">
              <Series>
                  <asp:Series ChartArea="ChartArea1" ChartType="Line" Name="Series1">
                  </asp:Series>
              </Series>
              <ChartAreas>
                  <asp:ChartArea Name="ChartArea1">
                  </asp:ChartArea>
              </ChartAreas>
          </asp:Chart>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
      </p>
      <p>
          &nbsp;</p>
      <p>
          &nbsp;</p>
      <p>
          &nbsp;</p>
      <p>
          &nbsp;</p>
      <p>
          &nbsp;</p>
      <p>
          &nbsp;</p>
      <p>
          &nbsp;</p>
  </nav>


  
</section>
    <footer>
</footer>

</body>
</html>




