<%@ Page Title="Collectibles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Collectibles.aspx.cs" Inherits="Collectibles" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="CollectiblesContent" runat="server">

    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<body>
    
    <div>
    
        <asp:Label ID="lblChoose" runat="server" Text="Choose a collection"></asp:Label> &nbsp;
        <asp:DropDownList ID="drpCollections" runat="server" DataSourceID="SqlDataSourceCollections" DataTextField="description" DataValueField="collection"></asp:DropDownList> &nbsp;
        <asp:Button ID="btnDetailView" runat="server" Text="Detail View" OnClick="btnDetailView_Click" /> &nbsp;
        <asp:Button ID="btnFormView" runat="server" Text="Form View" OnClick="btnFormView_Click" /> &nbsp;

        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSourceCollectibles" style="margin-top: 18px" ShowFooter="False" ShowHeader="False" Width="428px">
            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
            <ItemTemplate>
                <table style="width: 100%; background-color: #F0F0F0">
                    <tr>
                        <td>
                            <asp:Label ID="authorLabel" runat="server" Text='<%# Eval("author") %>' />
                        </td>
                        <td>
                            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                        </td>
                        
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                            &nbsp;*
                            <asp:Label ID="valueLabel" runat="server" Text='<%# Eval("value", "{0:C2}") %>' />
                            &nbsp;=
                            <asp:Label ID="totalLabel" runat="server" Text='<%# Eval("total", "{0:C2}") %>' Font-Bold="True" ForeColor="#216C2A" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
            </ItemTemplate>
        </asp:DataList>

        <asp:SqlDataSource ID="SqlDataSourceCollections" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringCollectibles %>" SelectCommand="SELECT * FROM [Collections]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCollectibles" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringCollectibles %>" SelectCommand="SELECT Books.author, Books.title, Collectibles.description, Collectibles.quantity, Collectibles.value, Collectibles.quantity * Collectibles.value AS total FROM Collectibles INNER JOIN Books ON Collectibles.item = Books.item"></asp:SqlDataSource>
        <br />

        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <asp:Label ID="lblGrandTotal" runat="server" Text="Grand Total"></asp:Label> &nbsp;&nbsp;
                <asp:Label ID="lblGrandTotalAmt" runat="server" Text='<%# Eval("grandTotal", "{0:C2}") %>'></asp:Label>
            </ItemTemplate>
        </asp:DataList>
        <br />

        &nbsp;&nbsp;

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringCollectibles %>" DataSourceMode="DataReader" SelectCommand="SELECT SUM(quantity * value) AS grandTotal FROM Collectibles INNER JOIN Books ON Collectibles.item = Books.item"></asp:SqlDataSource>


    </div>
   
</body>
</html>

</asp:Content>
