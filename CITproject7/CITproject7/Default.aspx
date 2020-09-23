<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CITproject7.Register" %>

<!--
	Author: W3layouts
	Author URL: http://w3layouts.com
	License: Creative Commons Attribution 3.0 Unported
	License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="en">
<head>
<title> Register for Scrum </title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Trendy Flat Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />

<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Trendy Flat Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta tag Keywords -->
<!--font-awesome-css-->
<link href="Content/font-awesome.css" rel="stylesheet"> 
<!--//font-awesome-css-->
<!-- css files -->
<link href="Content/style.css" rel="stylesheet" type="text/css" media="all">

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

    <style type="text/css">
        @import url(https://fonts.googleapis.com/css?family=Roboto:300);
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 245px;
            height: 40px;
        }
        .auto-style4 {
            height: 40px;
        }
        .auto-style5 {
            width: 246px;
        }
        .auto-style6 {
            margin-left: 0px;
        }
        .auto-style7 {
            margin-left: 113px;
        }
        .auto-style10 {
            width: 245px;
            height: 18px;
        }
        .auto-style11 {
            height: 18px;
        }

        @import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
	background: #eee !important;	
}



    </style>


<body>
    <form id="Register" runat="server">
<!--header-->
   <div class="container-fluid p-0">
      <section class="resume-section p-3 p-lg-5 d-flex d-column" id="about">
        <div class="my-auto">
          </div>
    
<div class="login-page">
	<h1>Scrum Register</h1>
</div>
        <br />
<!--//header-->
<!--main-->
	<div class="login-page">
		<h2>Fill in the following fields </h2>
        <br />

        <table class="register-form">
            <tr>
                <td class="auto-style3">First Name</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxFN" runat="server" CssClass="auto-style6" Height="34px" Width="200px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" BackColor="White" ControlToValidate="TextBoxFN" ErrorMessage="Enter First Name" ForeColor="Red" Height="16px" Width="296px"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Second Name</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxSN" runat="server" CssClass="auto-style6" Height="34px" Width="200px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxSN" ErrorMessage="Enter Second Name" ForeColor="Red" Height="16px" Width="296px"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">User Name </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxUN" runat="server" CssClass="auto-style6" Height="34px" Width="200px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxUN" ErrorMessage="Enter UserName" ForeColor="Red" Height="16px" Width="296px"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Password</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxPass" runat="server" CssClass="auto-style7" Height="16px" TextMode="Password" Width="200px"></asp:TextBox>
                    <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPass" ErrorMessage="Please Enter a Password" ForeColor="Red" Width="299px"></asp:RequiredFieldValidator>
                </td>
            </tr>
              <tr>
                <td class="auto-style10"> Confirm Password</td>
                <td class="auto-style11">
                    <asp:TextBox ID="TextBoxConPass" runat="server" CssClass="auto-style7" Height="16px" TextMode="Password" Width="200px"></asp:TextBox>
                    <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxConPass" ErrorMessage="Please Enter a Password" ForeColor="Red" Width="299px"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPass" ControlToValidate="TextBoxConPass" ErrorMessage="Passwords do not match" ForeColor="Red" Width="297px"></asp:CompareValidator>
                </td>
            <tr>
                <td class="auto-style3">Email </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxEmail" runat="server" Height="16px" TextMode="Email" Width="200px"></asp:TextBox>
                    <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxConPass" ErrorMessage="Please Enter valid Email" ForeColor="Red" Width="299px"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="auto-style3">Profile Picture</td>
                <td class="auto-style4">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                          
                </td>
            </tr>
        </table>
        <br />
		<p>Select all Roles </p>
        <p>&nbsp;</p>

        <table class="auto-style1">
            <tr>
                <td class="auto-style5">
                    <br />
                    Product Owner<br />
                </td>
                <td>
                    <br />
                    <asp:CheckBox ID="CheckBoxProduct" runat="server" />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <br />
                    Scrum Master<br />
                </td>
                <td>
                    <br />
                    <asp:CheckBox ID="CheckBoxScrum" runat="server" />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <br />
                    Developer<br />
                </td>
                <td>
                    <br />
                    <asp:CheckBox ID="CheckBoxDeveloper" runat="server" />
                </td>
            </tr>
        </table>
			<div class="w3ls-form">
					&nbsp;<asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />
&nbsp;</div>	
			<div class="form">
				<p>Already have an Account?<a href="Login.aspx">Login Here</a></p>
			</div>	
	</div>	
</section>
<!--//main-->


    </form>

</body>
</html>
