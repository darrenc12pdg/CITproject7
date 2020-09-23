<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectData.aspx.cs" Inherits="CITproject7.ProjectData" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

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
  <h2>Project Data</h2>
</header>

<section>
  <nav>
    <ul>
      <li><a href="Projects.aspx">Back</a></li>

    </ul>
      <p>
          <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Height="369px" Width="451px">
              <series>
                  <asp:Series ChartType="Line" Name="Series1" XValueMember="EstimatedProjectTime" YValueMembers="CurrentTime">
                  </asp:Series>
              </series>
              <chartareas>
                  <asp:ChartArea Name="ChartArea1">
                  </asp:ChartArea>
              </chartareas>
          </asp:Chart>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [EstimatedProjectTime], [CurrentTime] FROM [Projects]"></asp:SqlDataSource>
          Comparison of Time Taken of Current Project and Estimated Completion Time
      </p>
  </nav>
  
  <article>
      <hr style="margin-left: 0px; margin-top: 0px" />
    <h1>Project Information </h1>



  </article>
</section>

<footer>
  <p>CIT 7 2018</p>
</footer>

</body>
</html>
    </form>

