<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CITproject7.Login" %>

<!--
	Author: W3layouts
	Author URL: http://w3layouts.com
	License: Creative Commons Attribution 3.0 Unported
	License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>

<html lang="en">
<head>
<title>Login </title>
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

    <style type="text/css">
        @import url(https://fonts.googleapis.com/css?family=Roboto:300);

input[type="text"]:focus,
input[type="password"]:focus {
  border-bottom: 2px solid #16a085;
  color: #16a085;
  transition: 0.2s ease;
}

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: center;
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

        .auto-style1 {
            width: 100%;
            height: 205px;
        }
        .auto-style4 {
            width: 302px;
            text-align: left;
        }
        .auto-style5 {
            width: 532px;
            text-align: center;
        }
        .auto-style6 {
            font-size: large;
        }
        .auto-style7 {
            width: 532px;
            text-align: center;
            font-size: large;
        }


    </style>


<body>
    <form id="form1" runat="server">

<!--//header-->
<!--main-->
<div class="container-fluid p-0">
      <section class="resume-section p-3 p-lg-5 d-flex d-column" id="about">
        <div class="my-auto">
          </div>
	<div class="form">
		<h2>Login Here</h2>
        <br />
       <table class="auto-style1">
            <tr>
                <td class="autostyle5"><strong class="autostyle6">UserName:</strong></td>
                <td class="autostyle4">
                    <asp:TextBox ID="TextBoxLoginUser" runat="server" Height="33px" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTextBoxLoginUser"  runat="server" Forecolor="red"
                        ErrorMessage="Required Username" ControlToValidate="TextBoxLoginUser"></asp:RequiredFieldValidator> 
                    <asp:Label ID="Label2" runat="server" text="**Username is not Correct**" color="Red" visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="autostyle7"><strong>Password:</strong></td>
                <td class="autostyle4">
                    <asp:TextBox ID="TextBoxLoginPass" runat="server" TextMode="Password" Height="33px" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTextBoxLoginPass" runat="server" Forecolor="red" 
                        ErrorMessage="Required Password" ControlToValidate="TextBoxLoginPass"></asp:RequiredFieldValidator> 
                    <asp:Label ID="Label1" runat="server" text="**Password is not Correct**" color="Red" visible="false"></asp:Label>
                </td>
            </tr>
        </table>
			<div class="login-form">
					&nbsp;<h6><a href="#">Forgot Password?</a></h6>
						<div class="login-form"></div>
						&nbsp;<asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonLogin_Click" Text="Login" />
				</div>	
			<div class="message">
				<p>Don't Have an Account? <a href="Default.aspx">Register Now</a></p>
			</div>	
	</div>	
</section>
<!--//main-->

    </form>

</body>
</html>
