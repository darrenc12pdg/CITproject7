<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SwailsForm.aspx.cs" Inherits="CITproject7.SwailsForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>


    <form id="form2" runat="server" class="auto-style1">


        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AllTeamID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="AllTeamID" HeaderText="AllTeamID" InsertVisible="False" ReadOnly="True" SortExpression="AllTeamID" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="ProjectName" HeaderText="ProjectName" SortExpression="ProjectName" />
                <asp:BoundField DataField="ProjectManager" HeaderText="ProjectManager" SortExpression="ProjectManager" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="AllTeamID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="AllTeamID" HeaderText="AllTeamID" InsertVisible="False" ReadOnly="True" SortExpression="AllTeamID" />
                <asp:CheckBoxField DataField="ProductOwner" HeaderText="ProductOwner" SortExpression="ProductOwner" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="ProjectName" HeaderText="ProjectName" SortExpression="ProjectName" />
                <asp:BoundField DataField="ProjectManager" HeaderText="ProjectManager" SortExpression="ProjectManager" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AllTeam.AllTeamID, Users.ProductOwner, Users.Email,  ProjectName.ProjectName , ProjectName.ProjectManager
FROM ((AllTeam
INNER JOIN Users ON AllTeam.UserId = Users.ID)
INNER JOIN ProjectName ON AllTeam.ProjectId = ProjectName.ProjectId) Where Users.ProductOwner = 1;"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView3" runat="server">
        </asp:GridView>
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT AllTeam.AllTeamID, Users.UserName, Users.Email,  ProjectName.ProjectName , ProjectName.ProjectManager
FROM ((AllTeam
INNER JOIN Users ON AllTeam.UserId = Users.ID)
INNER JOIN ProjectName ON AllTeam.ProjectId = ProjectName.ProjectId);"></asp:SqlDataSource>
