﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Scrum.aspx.cs" Inherits="CITproject7.Scrum" %>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Scrumdog Millionaires Portal</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/resume.min.css" rel="stylesheet">

  </head>

  <body id="page-top">

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">
        <span class="d-block d-lg-none">Scrumdog Portal</span>
        <span class="d-none d-lg-block">
          <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="img/profile.jpg" alt="">
        </span>
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="Users.aspx">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="Projects.aspx">View Projects</a>
          </li>

        </ul>
      </div>
    </nav>

    <div class="container-fluid p-0">

      <section class="resume-section p-3 p-lg-5 d-flex d-column" id="about">
        <div class="my-auto">
          <h1 class="mb-0">Scrumdog
            <span class="text-primary">Portal</span>
          </h1>
          <div class="subheading mb-5"> Team Project and Scrum Management Tool·
            <a href="Brought to you by">CIT Team 7</a>
          </div>
    
         
     
       <form id="form1" runat="server">
                
                     <p class="lead mb-5" > All Available Scrum roles </p>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:CheckBoxField DataField="ScrumMaster" HeaderText="ScrumMaster" SortExpression="ScrumMaster" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="ProjectName" HeaderText="ProjectName" SortExpression="ProjectName" />
                            <asp:BoundField DataField="ProjectManager" HeaderText="ProjectManager" SortExpression="ProjectManager" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Users.ScrumMaster, Users.UserName, Users.Email,  ProjectName.ProjectName , ProjectName.ProjectManager FROM AllTeam INNER JOIN Users ON AllTeam.UserId = Users.Id INNER JOIN ProjectName ON AllTeam.ProjectId = ProjectName.ProjectId WHERE (Users.ScrumMaster = 1) AND (ProjectName.ProjectName = @Project)

">
                        <SelectParameters>
                            <asp:SessionParameter Name="Project" SessionField="Project" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                
         
     
                         <br />
                    <asp:DropDownList ID="ddlProject" runat="server" Height="22px" Width="283px">
                    </asp:DropDownList>
                      <asp:DropDownList ID="ddlScrum" runat="server" Height="22px" Width="283px">
                    </asp:DropDownList>
                    <br />
               
        <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
       
                     <br />
                     <br />
       
        <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
                     <br />
           <br />
           <asp:Button ID="FinishAddingScrum" runat="server" Text="Finish Adding ScrumMaster/Masters" OnClick="FinishAddingScrum_Click" />
    </form>
     </section>

        </div>


  </body>

</html>

<body>
   
</body>
</html>