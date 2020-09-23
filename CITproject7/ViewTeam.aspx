<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTeam.aspx.cs" Inherits="CITproject7.WebForm2" %>

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
       <!-- Making the navigation responsive - still works once the web page is made smaller -->
                <!-- Bootstrap core JavaScript -->
                <script src="vendor/jquery/jquery.min.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                <!-- Plugin JavaScript -->
                <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
                <!-- Custom scripts for this template -->
                <script src="js/resume.min.js"></script>

  </head>
    
    <body id="page-top">
  
        
    <!-- side bar navigation -->    
    <form id="form3" runat="server">
        <div>
        </div>
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
             <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="Team.aspx">View Team</a>
          </li>
 
     
        </ul>
      </div>
    </nav>

    <div class="container-fluid p-0">
        
    
         <!-- Gridview to show all Users into that team based on the Project  -->  


      <section class="resume-section p-3 p-lg-5 d-flex d-column" id="about">
        <div class="my-auto">
          <h1 class="mb-0">Scrumdog
            <span class="text-primary">Portal</span>
          </h1>
          <div class="subheading mb-5"> Team Project and Scrum Management Tool·
            <a href="CIT7.aspx">CIT Team 7</a>
          </div>
              <p class="lead mb-5">View the members of your team below: </p>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                        <asp:BoundField DataField="SecondName" HeaderText="SecondName" SortExpression="SecondName" />
                        <asp:CheckBoxField DataField="ProductOwner" HeaderText="ProductOwner" SortExpression="ProductOwner" />
                        <asp:CheckBoxField DataField="ScrumMaster" HeaderText="ScrumMaster" SortExpression="ScrumMaster" />
                        <asp:CheckBoxField DataField="Developer" HeaderText="Developer" SortExpression="Developer" />
                        <asp:CheckBoxField DataField="ProjectManager" HeaderText="ProjectManager" SortExpression="ProjectManager" />
                    </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AllTeam.UserId, Users.FirstName, Users.SecondName, Users.ProductOwner, Users.ScrumMaster, Users.Developer, Users.ProjectManager FROM AllTeam INNER JOIN Users ON Users.Id = AllTeam.UserId INNER JOIN ProjectName ON ProjectName.ProjectId = AllTeam.ProjectId WHERE (ProjectName.ProjectName = @Project)">
                <SelectParameters>
                    <asp:SessionParameter Name="Project" SessionField="Project" />
                </SelectParameters>
            </asp:SqlDataSource>
                <br />
            <asp:Label ID="Label1" runat="server" Text="Label"> Please Select Product Owner of Project</asp:Label>
                <br />
                <br />

            <asp:Label ID="Label3" runat="server" Text="Label"> Select Project:</asp:Label>
            <asp:DropDownList ID="ddlProject" runat="server" Height="22px" Width="283px">
                    </asp:DropDownList>

       
                    <br />

       
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="Label"> Select User:</asp:Label>
                    <asp:DropDownList ID="ddlProductOWner" runat="server" Height="22px" Width="283px">
                    </asp:DropDownList>

              <br />

              <br />
           <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />


             <br />
            <br />


             <asp:Label ID="Label_ID" runat="server" Visible="false"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Label">Please Select Scrum Master/Masters of Project</asp:Label>
            <br />
            <br />

            <asp:Label ID="Label4" runat="server" Text="Label"> Select Project:</asp:Label>
            <asp:DropDownList ID="ddlProject1" runat="server" Height="22px" Width="283px">
                    </asp:DropDownList>
                      <br />
            <br />
                      <asp:Label ID="Label6" runat="server" Text="Label"> Select User:</asp:Label>
                      <asp:DropDownList ID="ddlScrum" runat="server" Height="22px" Width="283px">
                    </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Add1" runat="server" Text="Add" OnClick="Add_Click1" />


                
            <br />


                
            <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" Visible="false"></asp:TextBox>
            <asp:TextBox ID="TextBox3" runat="server" Visible="false"></asp:TextBox>
      </section>
        </div>
       
     <footer>
        
         <asp:Label ID="Label_welcome" runat="server" Text="Welcome: "></asp:Label>
        <br />
        <asp:Button ID="B_Logout" runat="server" OnClick="B_Logout_Click" Text="Logout" />
  
</footer>   


</form>

</body>
</html>
