<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="CITproject7.Users" %>

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

    <!--Navigation bar -->

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

        <section class="resume-section p-3 p-lg-5 d-flex d-column" id="about">
            <div class="my-auto">
                <h1 class="mb-0">Scrumdog
            <span class="text-primary">Portal</span>
                </h1>
                <div class="subheading mb-5">
                    Team Project and Scrum Management Tool·
            <a href="CIT7.aspx">CIT Team 7</a>

                     <!-- When form is ran it performs the Logout button and displays the Welcome label greeting the user with their username  -->
                    <form id="form2" runat="server" class="auto-style1">
                        <br />
                        <asp:Label ID="Label_welcome" runat="server" Text="Welcome:" CssClass="auto-style1"></asp:Label>
                        <br />
                        <asp:Button ID="B_Logout" runat="server" OnClick="B_Logout_Click" Text="Logout" CssClass="auto-style1" />

                        <!-- Gridview is configured to display the user's profile picture based on the session variable -->
                        <asp:GridView ID="GridView1" runat="server" ShowHeader="False" GridLines="None" Height="20px" Width="20px" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                            <Columns>

                                
                                <asp:TemplateField HeaderText="" SortExpression="Image1">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Image1") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" Width="200px" Height="200px" runat="server" ImageUrl='<%# Eval("Image1") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <!-- Selecting the correct image based on the session variable --> 
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Image1] FROM [Users] WHERE ([UserName] = @UserName)">
                            <SelectParameters>
                                <asp:SessionParameter Name="UserName" SessionField="New" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:Label ID="Label_ID" runat="server" Visible="false"></asp:Label>
                    </form>
                </div>
        </section>



    </div>




    <header>
    </header>
</body>
</html>

