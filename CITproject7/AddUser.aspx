<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="CITproject7.AddUser" %>

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
                        <a class="nav-link js-scroll-trigger" href="Projects.aspx">View Team</a>
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
            <a href="Brought to you by">CIT Team 7</a>
                        <br />
                        <br />
                    </div>
                    <div>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [UserName], [Email], [ProductOwner], [ScrumMaster], [Developer] FROM [Users]"></asp:SqlDataSource>
                        <p class="lead mb-5">&nbsp;</p>
                        <p class="lead mb-5">1. Please select a project to add a User to: </p>
                        <asp:TextBox ID="TextBox3" runat="server" Width="242px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Search" />
                        <br />
                        <br />
                        <p class="lead mb-5">2. Please Enter Full Email for User to Perform adding User to a Project: </p>
                        <asp:TextBox ID="TextBox1" runat="server" Width="242px"></asp:TextBox>
                        <asp:TextBox ID="TextBox2" runat="server" Width="242px" Visible="false"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
                        <br />
                        <br />

                    </div>
                    <asp:GridView ID="GridView1" runat="server" Height="120px" Width="365px" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                            <asp:BoundField DataField="SecondName" HeaderText="SecondName" SortExpression="SecondName" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:CheckBoxField DataField="ProductOwner" HeaderText="ProductOwner" SortExpression="ProductOwner" />
                            <asp:CheckBoxField DataField="ScrumMaster" HeaderText="ScrumMaster" SortExpression="ScrumMaster" />
                            <asp:CheckBoxField DataField="Developer" HeaderText="Developer" SortExpression="Developer" />
                            <asp:CheckBoxField DataField="ProjectManager" HeaderText="ProjectManager" SortExpression="ProjectManager" />
                            <asp:TemplateField HeaderText="Image1" SortExpression="Image1">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" Width="30px" Height="30px" runat="server" ImageUrl='<%# Eval("Image1") %>' />
                                    <!-- <asp:Label ID="Label1" runat="server" Text='<%# Bind("Image1") %>'></asp:Label> -->
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [FirstName], [SecondName], [UserName], [Email], [ProductOwner], [ScrumMaster], [Developer], [ProjectManager], [Image1] FROM [Users] WHERE (Email LIKE '%' + @search + '%')">
                        <SelectParameters>
                            <asp:Parameter Name="search" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <p class="lead mb-5">3. Please Select Which Project to add selected User  </p>
                    <asp:DropDownList ID="ddlProject" runat="server" Height="22px" Width="198px"></asp:DropDownList>
                    <asp:DropDownList ID="ddlUser" runat="server" Height="22px" Width="198px"></asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Visible="False" Text="Add User" />
                    <br />
                    <br />
                    <!-- <asp:DropDownList ID="ddlProject2" runat="server" Height="22px" Width="198px"></asp:DropDownList> -->
                    <!-- <asp:DropDownList ID="ddlSelectedProject" runat="server" Height="22px" Width="198px"></asp:DropDownList> -->
                    <br />
                    <br />
            </section>
        </div>

        <p>
            &nbsp;
        </p>




    </form>

</body>
</html>









