
<%@ Page Title="Buy Shares" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="BuyShares.aspx.cs" Inherits="BuyShares" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="BuySharesContent" runat="server">

    
    <div>
        
        <br /> <br />

        <span id="lblBuyShares" style="font:bold">Buy Shares</span>&nbsp;

        <asp:DropDownList ID="drpBuyShares" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpBuyShares_SelectedIndexChanged" ViewStateMode="Enabled">
        </asp:DropDownList>

        <asp:Button ID="btnFirst" runat="server" Text="<<" CommandName="First" 
            OnCommand="NavigationButtons_Command" CssClass="navbutton" />
        <asp:Button ID="btnPrevious" runat="server" Text="<" CommandName="Previous" 
            OnCommand="NavigationButtons_Command" />
        <asp:Button ID="btnNext" runat="server" Text=">" CommandName="Next" 
            OnCommand="NavigationButtons_Command" />
        <asp:Button ID="btnLast" runat="server" Text=">>" CommandName="Last" 
            OnCommand="NavigationButtons_Command" />
        
        <br /> <br />

        <img src="~/Images/berkshirelogo.jpg" runat="server" class="image" id="imgLogo" />
        
        <span id="lblPrice" style="font:bold">Price per Share</span>&nbsp;
        
        <asp:Label ID="lblSharePrice" runat="server" Text="Label"></asp:Label>&nbsp; &nbsp;

        <span id="lblShares" style="font:bold">Number of Shares</span>&nbsp;
        
        <asp:DropDownList ID="drpShares" runat="server"> </asp:DropDownList>

        <br /> <br />

        <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" OnClick="btnAddToCart_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:ImageButton ID="imgbtnCheckout" runat="server" ImageUrl="~/Images/checkout2.jpg" ToolTip="Checkout" PostBackUrl="~/Checkout.aspx"/>

        <br /> <br />
        
    </div>    
    

</asp:Content>

