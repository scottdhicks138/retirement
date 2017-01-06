

<%@ Page Title="Stocks" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Stocks.aspx.cs" Inherits="Stocks" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="StocksContent" runat="server">

    
    <div>
        
        <br />
        <asp:Label ID="lblCurrentPortfolio" runat="server" Text="Current Portfolio" CssClass="label"></asp:Label>
        <asp:Label ID="lblPortfolioValue" runat="server" Text="$$$" CssClass="label"></asp:Label>
        <br /><br />
        
        <div>
        <asp:GridView ID="grdStocks" runat="server" AutoGenerateColumns="true">
            </asp:GridView>
        </div>

        <div>
        <br />
        <asp:Button ID="btnBuyShares" runat="server" CssClass="button2" Text="Buy Shares" OnClick="btnBuyShares_Click" />
        <br />
        </div>

    </div>    
    

</asp:Content>
