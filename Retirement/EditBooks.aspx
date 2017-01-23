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

        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />

    </Columns>
        
</asp:GridView>

<asp:SqlDataSource ID="SqlDataSourceBooks" runat="server"
    ConflictDetection="CompareAllValues" 
    ConnectionString="<%$ ConnectionStrings:ConnectionStringCollectibles %>" 
    SelectCommand="SELECT * FROM [Books]"
    DeleteCommand="DELETE FROM [Books] WHERE [isbn13] = @original_isbn13 AND [author] = @original_author"
    InsertCommand="INSERT INTO [Books] ([item], [isbn13], [title], [author], [notes]
                   VALUES (@item, @isbn13, @title, @author, @notes)"
    UpdateCommand="UPDATE [Books] SET [item] = @item,
                                      [title] = @title,
                                      [notes] = @notes
                                  WHERE [isbn13] = @original_isbn13
                                    AND [author] = @original_author">

    <DeleteParameters>
        <asp:Parameter Name="original_isbn13" Type="Decimal" />
        <asp:Parameter Name="original_author" Type="String" />
    </DeleteParameters>

    <InsertParameters>
        <asp:Parameter Name="item" Type="Int32" />
        <asp:Parameter Name="isbn13" Type="Decimal" />
        <asp:Parameter Name="title" Type="String" />
        <asp:Parameter Name="author" Type="String" />
        <asp:Parameter Name="notes" Type="String" />
    </InsertParameters>

    <UpdateParameters>
        <asp:Parameter Name="item" Type="Int32" />
        <asp:Parameter Name="title" Type="String" />
        <asp:Parameter Name="notes" Type="String" />
        <asp:Parameter Name="original_isbn13" Type="Decimal" />
        <asp:Parameter Name="original_author" Type="String" />
    </UpdateParameters>

</asp:SqlDataSource>

    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    <br /><br />
    
    <asp:ValidationSummary ID="ValidationSummary" runat="server" 
                    HeaderText="The following errors occurred:"
                    ShowSummary="true" DisplayMode="BulletList" />
    &nbsp;   
    <asp:Label ID="lblItem" runat="server" Text="Item"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
    <asp:TextBox ID="txtItem" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="ReqItem" runat="server" ControlToValidate="txtItem" Display="Static" CssClass="validator" ErrorMessage="Item is required" ValidationGroup="AddGroup" />
                    <asp:CompareValidator 
                        ID="CompareValidator1" 
                        runat="server" 
                        ControlToValidate="txtItem"
                        Display="Static"
                        Type="Integer"
                        Operator="GreaterThanEqual"
                        ValueToCompare="0"
                        CssClass="validator"
                        ErrorMessage="Item must be an Integer"
                        Text="*" /> 
    <br /><br />
    &nbsp;
    <asp:Label ID="lblIsbn13" runat="server" Text="ISBN 13"></asp:Label>&nbsp;&nbsp;
    <asp:TextBox ID="txtIsbn13" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="ReqISBN" runat="server" ControlToValidate="txtIsbn13" Display="Static" CssClass="validator" ErrorMessage="ISBN is required" Text="*" />
    <br /><br />
    &nbsp;
    <asp:Label ID="lblTitle" runat="server" Text="Title"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="ReqTitle" runat="server" ControlToValidate="txtTitle" Display="Static" CssClass="validator" ErrorMessage="Title is required" Text="*" />
    <br /><br />
    &nbsp
    <asp:Label ID="lblAuthor" runat="server" Text="Author"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="ReqAuthor" runat="server" ControlToValidate="txtAuthor" Display="Static" CssClass="validator" ErrorMessage="Author is required" Text="*" />
    <br /><br />
    &nbsp;
    <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtNotes" runat="server"></asp:TextBox>
    <br /><br />

    &nbsp;
    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
    <br />

</body>
    
</html>
       
</asp:Content>
