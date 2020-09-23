<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Starss.aspx.cs" Inherits="CITproject7.Starss" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

        </div>
        <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>

        <table class="auto-style1">
            <tr>
                <td class="auto-style3">Project Name</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBoxN" runat="server" CssClass="auto-style6" Height="34px" Width="200px"></asp:TextBox>
                    <br />
                </td>
            </tr>
            </table>

        <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />
    </form>
</body>
</html>
