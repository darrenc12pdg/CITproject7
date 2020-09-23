<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Team.aspx.cs" Inherits="CITproject7.Team" %>


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
                        <a class="nav-link js-scroll-trigger" href="Team.aspx"> View Team</a>
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
                    <div class="subheading mb-5">
                        Team Project and Scrum Management Tool·
            <a href="CIT7.aspx">CIT Team 7</a>
                    </div>
                    <p class="lead mb-5">Welcome to your scrum portal. </p>
                    <p class="lead mb-5">Please select the project you wish to work on: </p>
                    
                    <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
                    <br />
                    <asp:DropDownList ID="ddlProject" runat="server" Height="22px" Width="198px"></asp:DropDownList>
                    <asp:Button ID="viewProject" runat="server" Text="View Project" OnClick="view_Project" align="Left" />
                    <asp:TextBox ID="TextBox4" runat="server" Visible="false" Text="Test"></asp:TextBox>
                    <asp:Label ID="Label_ID" runat="server" Visible="false" CssClass="auto-style1"></asp:Label>


                    <footer>
                    </footer>
    </form>

</body>
</html>









