<%@ Page Title="Edit Books" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="EditBooks2.aspx.cs" Inherits="EditBooks2" %>

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
    &nbsp;<asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="isbn13,author" DataSourceID="SqlDataSourceBooks" Width="425px">
        <EditItemTemplate>
            item:
            <asp:TextBox ID="itemTextBox" runat="server" Text='<%# Bind("item") %>' />
            <br />
            isbn13:
            <asp:Label ID="isbn13Label1" runat="server" Text='<%# Eval("isbn13") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            author:
            <asp:Label ID="authorLabel1" runat="server" Text='<%# Eval("author") %>' />
            <br />
            notes:
            <asp:TextBox ID="notesTextBox" runat="server" Text='<%# Bind("notes") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            item:
            <asp:TextBox ID="itemTextBox" runat="server" Text='<%# Bind("item") %>' />
            <br />
            isbn13:
            <asp:TextBox ID="isbn13TextBox" runat="server" Text='<%# Bind("isbn13") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            author:
            <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
            <br />
            notes:
            <asp:TextBox ID="notesTextBox" runat="server" Text='<%# Bind("notes") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            item:
            <asp:Label ID="itemLabel" runat="server" Text='<%# Bind("item") %>' />
            <br />
            isbn13:
            <asp:Label ID="isbn13Label" runat="server" Text='<%# Eval("isbn13") %>' />
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
            <br />
            author:
            <asp:Label ID="authorLabel" runat="server" Text='<%# Eval("author") %>' />
            <br />
            notes:
            <asp:Label ID="notesLabel" runat="server" Text='<%# Bind("notes") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    <br />

    &nbsp;
    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
    <br />

</body>
    
</html>
       
</asp:Content>
