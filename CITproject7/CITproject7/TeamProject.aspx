<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeamProject.aspx.cs" Inherits="CITproject7.TeamProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
</body>
</html>


<!DOCTYPE html>
<html lang="en">
<head>
<title>CSS Template</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
    box-sizing: border-box;
}

body {
    font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
    background-color: #666;
    padding: 30px;
    text-align: center;
    font-size: 35px;
    color: white;
}
/* Container for flexboxes */
section {
    display: -webkit-flex;
    display: flex;
}

/* Style the navigation menu */
nav {
    -webkit-flex: 1;
    -ms-flex: 1;
    flex: 1;
    background: #ccc;
    padding: 20px;
}

/* Style the list inside the menu */
nav ul {
    list-style-type: none;
    padding: 0;
}

/* Style the content */
article {
    -webkit-flex: 3;
    -ms-flex: 3;
    flex: 3;
    background-color: #f1f1f1;
    padding: 10px;
}

/* Style the footer */
footer {
    background-color: #777;
    padding: 10px;
    text-align: center;
    color: white;
}

/* Responsive layout - makes the menu and the content (inside the section) sit on top of each other instead of next to each other */
@media (max-width: 600px) {
    section {
      -webkit-flex-direction: column;
      flex-direction: column;
    }
}
</style>
</head>
<body>



<header>
  <h2>Welcome to the Scrum Management System</h2>
</header>

<section>
  <nav>
    <ul>
      <li><a href="Users.aspx">Go Back</a></li>
      <li><a href="AddTeam.aspx">Add a Member to the Project Team</a></li>
      <li><a href="#">Search for Member</a></li>
    </ul>
  </nav>
  
  <article>
    <h1>Team Project Page</h1>
    <p>View the All Users </p>
      <p>
          <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" Height="278px" Width="1124px">
              <Columns>
                  <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                  <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                  <asp:BoundField DataField="SecondName" HeaderText="SecondName" SortExpression="SecondName" />
                  <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                  <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                  <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                  <asp:CheckBoxField DataField="ProductOwner" HeaderText="ProductOwner" SortExpression="ProductOwner" />
                  <asp:CheckBoxField DataField="ScrumMaster" HeaderText="ScrumMaster" SortExpression="ScrumMaster" />
                  <asp:CheckBoxField DataField="Developer" HeaderText="Developer" SortExpression="Developer" />
                  <asp:CheckBoxField DataField="ProjectManager" HeaderText="ProjectManager" SortExpression="ProjectManager" />
              </Columns>
          </asp:GridView>
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
      </p>
      <p>Add New Members to your Project Team</p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="213px" Width="737px">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="SurName" HeaderText="SurName" SortExpression="SurName" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
      </p>
      <p>
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="177px" Width="1096px">
              <Columns>
                  <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                  <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                  <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                  <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                  <asp:BoundField DataField="SurName" HeaderText="SurName" SortExpression="SurName" />
              </Columns>
          </asp:GridView>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [TeamMembers] WHERE [Id] = @Id" InsertCommand="INSERT INTO [TeamMembers] ([Id], [UserID], [UserName], [FirstName], [SurName]) VALUES (@Id, @UserID, @UserName, @FirstName, @SurName)" SelectCommand="SELECT * FROM [TeamMembers] WHERE ([UserName] = @UserName)" UpdateCommand="UPDATE [TeamMembers] SET [UserID] = @UserID, [UserName] = @UserName, [FirstName] = @FirstName, [SurName] = @SurName WHERE [Id] = @Id">
              <DeleteParameters>
                  <asp:Parameter Name="Id" Type="Int32" />
              </DeleteParameters>
              <InsertParameters>
                  <asp:Parameter Name="Id" Type="Int32" />
                  <asp:Parameter Name="UserID" Type="Int32" />
                  <asp:Parameter Name="UserName" Type="String" />
                  <asp:Parameter Name="FirstName" Type="String" />
                  <asp:Parameter Name="SurName" Type="String" />
              </InsertParameters>
              <SelectParameters>
                  <asp:SessionParameter Name="UserName" SessionField="New" Type="String" />
              </SelectParameters>
              <UpdateParameters>
                  <asp:Parameter Name="UserID" Type="Int32" />
                  <asp:Parameter Name="UserName" Type="String" />
                  <asp:Parameter Name="FirstName" Type="String" />
                  <asp:Parameter Name="SurName" Type="String" />
                  <asp:Parameter Name="Id" Type="Int32" />
              </UpdateParameters>
          </asp:SqlDataSource>
      </p>
  </article>
</section>

<footer>
  <p>CIT 7 2018</p>
</footer>

</body>
</html>


    </form>



