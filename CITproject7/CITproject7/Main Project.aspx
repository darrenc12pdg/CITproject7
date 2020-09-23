<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main Project.aspx.cs" Inherits="CITproject7.Main_Project" %>

<!DOCTYPE html>

<body>
    <form id="form1" runat="server">
        
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">Name</td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtPName" TextMode="MultiLine" runat="server" CssClass="auto-style6" Height="34px" Width="200px" ControlToValidate="TxtPName"></asp:TextBox>
                    <br />
                </td>
            </tr>
             <tr>
                <td class="auto-style3">Email<br />
                    <br />
                    <br />
                 </td>
                <td class="auto-style9">
                    <asp:TextBox ID="TxtEmail" TextMode="MultiLine" runat="server" CssClass="auto-style6" Height="34px" Width="200px" ControlToValidate="TxtEmail"></asp:TextBox>
                    <br />
       
     
       
     

       
                    <br />

                    <asp:DropDownList ID="ddlProject" runat="server" Height="22px" Width="283px">
                    </asp:DropDownList>

                    <asp:DropDownList ID="ddlScrum" runat="server" Height="22px" Width="283px">
                    </asp:DropDownList>

                     <asp:DropDownList ID="ddlOwners" runat="server" Height="22px" Width="283px">
                    </asp:DropDownList>

                     <asp:DropDownList ID="ddlDeveloper" runat="server" Height="22px" Width="283px">
                    </asp:DropDownList>



                    <br />
                </td>
            </tr>
           
            </table>
     
       
        <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />

       
        <br />
        <br />

       
    </form>
</body>
</html>