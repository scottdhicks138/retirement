<%@ Page Title="Edit Books" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="EditBooks.aspx.cs" Inherits="EditBooks" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="EditBooksContent" runat="server">

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

<body>
    <asp:GridView ID="grdBooks" runat="server" AutoGenerateColumns="False" DataKeyNames="isbn13,author" DataSourceID="SqlDataSourceBooks" Width="431px" AllowPaging="True" AllowSorting="True" OnRowDeleted="grdBooks_RowDeleted" OnRowUpdated="grdBooks_RowUpdated">
            
    <Columns>
                    
        <asp:BoundField DataField="item" HeaderText="Item" SortExpression="item" > <HeaderStyle Width="4px" /> </asp:BoundField>

        <asp:BoundField DataField="isbn13" HeaderText="ISBN" ReadOnly="True" SortExpression="isbn13" > <HeaderStyle Width="13px" /> </asp:BoundField>

        <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />

        <asp:BoundField DataField="author" HeaderText="Author" ReadOnly="True" SortExpression="author" />

        <asp:BoundField DataField="notes" HeaderText="Notes" SortExpression="notes" />

        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />

    </Columns>
        
</asp:GridView>

<asp:SqlDataSource ID="SqlDataSourceBooks" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionStringCollectibles %>" 
    SelectCommand="SELECT * FROM [Books]">

</asp:SqlDataSource>

    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    <br /><br />
    
    <asp:ValidationSummary ID="ValidationSummary" runat="server" 
                    HeaderText="The following errors occurred:"
                    ShowSummary="true" DisplayMode="BulletList" />
    &nbsp;<asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="isbn13,author" DataSourceID="SqlDataSourceBooks" Height="50px" Width="426px">
        <Fields>
            <asp:BoundField DataField="item" HeaderText="item" SortExpression="item" />
            <asp:BoundField DataField="isbn13" HeaderText="isbn13" ReadOnly="True" SortExpression="isbn13" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="author" HeaderText="author" ReadOnly="True" SortExpression="author" />
            <asp:BoundField DataField="notes" HeaderText="notes" SortExpression="notes" />
        </Fields>
    </asp:DetailsView>
    <br /><br />

    &nbsp;
    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
    <br />

</body>
    
</html>
       
</asp:Content>
