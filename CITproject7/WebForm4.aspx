<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="CITproject7.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="FindMode" />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> <br />
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Visible="false">**NO STUFF INNIT YA CLOWN**</asp:Label>
        </div>
    </form>
</body>
</html>
