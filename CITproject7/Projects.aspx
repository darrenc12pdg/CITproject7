<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="CITproject7.Projects" %>

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
  
        
        
    <form id="form3" runat="server">
        <div>
        </div>

     
    
     
 
    <!-- Displaying logo and links to relevant pages -->
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

    <!-- Page title and link to CIT7 team page -->
    <div class="container-fluid p-0">

      <section class="resume-section p-3 p-lg-5 d-flex d-column" id="about">
        <div class="my-auto">
          <h1 class="mb-0">Scrumdog
            <span class="text-primary">Portal</span>
          </h1>
          <div class="subheading mb-5"> Team Project and Scrum Management Tool·
            <a href="CIT7.aspx">CIT Team 7</a>
          </div>
              
            <!-- Using gridviews to display to the user the projects they are project manager in -->
            <p class="lead mb-5">View the Projects that you are currently the Project Manager for below </p>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="ProjectName" HeaderText="ProjectName" SortExpression="ProjectName" />
                        <asp:BoundField DataField="ProjectManager" HeaderText="ProjectManager" SortExpression="ProjectManager" />
                    </Columns>
                </asp:GridView>
                
                <!-- Calling from database to get which projects the user is project manager in. Using session variable to get user -->
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ProjectName.ProjectName, ProjectName.ProjectManager
                    FROM ProjectName
                    WHERE ProjectName.ProjectManager = @Username">
                    <SelectParameters>
                        <asp:SessionParameter Name="Username" SessionField="New" />
                    </SelectParameters>
            </asp:SqlDataSource>
                <br />
                <br />
           
             <!-- Creating new project -->
            <p class="lead mb-5">Please Enter New Project Name  </p>

             <table class="auto-style1">
            <tr>
                <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
                <td class="auto-style3">Project Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBoxN" runat="server" CssClass="auto-style6" Height="34px" Width="200px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="SubmitProject" runat="server" Text="Add Project" OnClick="Submit_Click" /> 
             
                </td>
                <td class="auto-style9">
                    <br />
                </td>
            </tr>
            </table>
            <br />
            <br />

             <!-- Adding user to a project -->
            <p class="lead mb-5">
                &nbsp;Add Users to an Existing Project 
                <asp:Button ID="SubmitUser" runat="server" Text="Add User" OnClick="Add_User" align="Left" />

                &nbsp;&nbsp; 
            </p>

            <br />

            <br />
            <br />
            
            <!-- Link to calculation page for Poker Values -->
            <p class="lead mb-5">
                Use Calculator for Poker Values  
                
                <asp:Button ID="Button_Calc" runat="server" Text="Go To Calculator" OnClick="Button_Calc_Click" align="Left" />


                &nbsp;&nbsp; 
            </p>
           
            <!-- Selecting a project user wants to view via dropdown list -->
            <p class="lead mb-5">
            <p class="lead mb-5" > Select a project you wish to view:&nbsp; </p>
            <asp:DropDownList ID="ddlProject" runat="server" Height="22px" Width="198px"></asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server" visible="false"></asp:TextBox>

            <asp:Button ID="viewProject" runat="server" Text="View Project" OnClick="view_Project" align="Left"/>
             
            &nbsp;

        

      </section>
        </div>
    
        <p>
            &nbsp;</p>
       
     <footer>
        
         <asp:Label ID="Label_welcome" runat="server" Text="Welcome: "></asp:Label>
        <br />
        <asp:Button ID="B_Logout" runat="server" OnClick="B_Logout_Click" Text="Logout" />


  
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Image1] FROM [Users] WHERE ([UserName] = @UserName)">
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="New" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>
</footer>   


</form>

</body>
</html>













