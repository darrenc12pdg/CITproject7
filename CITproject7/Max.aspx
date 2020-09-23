<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Max.aspx.cs" Inherits="CITproject7.Max" %>

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
      <!-- Sidebar navigation -->
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
            <a class="nav-link js-scroll-trigger" href="Projects.aspx">View Team</a>
          </li>
        </ul>
      </div>
    </nav>

      <form id="form1" runat="server">
        
    <div class="container-fluid p-0">
        <section class="resume-section p-3 p-lg-5 d-flex d-column" id="about">
        <div class="my-auto">

            <h1 class="mb-0">Poker Calculator </h1>
            <div class="subheading mb-5"> Calculate the Maximum Value for your Poker Planning</div>
            <h5> Add in commas between each number to calculate the Maximum</h5>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br /><br>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Calculate" Width="100px" /><br />
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> <br />
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Visible="false">**NO STUFF INNIT ER' BRAW KEEP ER LIT</asp:Label><br />
                   
                     <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Back" Width="100px" /><br />
                
        </div>
    </form>
         
     
  </body>

</html>
