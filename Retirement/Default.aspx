<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <table>
            <tr>
                <td> &nbsp;</td>
                <td> &nbsp;</td>
                <asp:ValidationSummary ID="ValidationSummary" runat="server" 
                    HeaderText="The following errors occurred:"
                    ShowSummary="true" DisplayMode="BulletList" />
            </tr>

            <tr>
                <td>Beginning Balance</td>
                <td>
                    <asp:TextBox ID="txtBegBal" runat="server" CssClass="entry"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqBal" runat="server" ControlToValidate="txtBegBal" Display="Static" CssClass="validator" ErrorMessage="Beginning Balance is required" Text="*" />
                    <asp:CompareValidator 
                        ID="CompareValidator1" 
                        runat="server" 
                        ControlToValidate="txtBegBal"
                        Display="Static"
                        Type="Double"
                        Operator="GreaterThanEqual"
                        ValueToCompare="0"
                        CssClass="validator"
                        ErrorMessage="Beginning Balance must be numeric"
                        Text="Invalid" /> 
                </td>
            </tr>

            <tr>
                <td>Monthly Investment</td>
                <td>
                    <asp:DropDownList ID="drpInvestment" class="entry" runat="server">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="reqMthInvestment" runat="server" CssClass="validator" ErrorMessage="Monthly Investment is required" ControlToValidate="drpInvestment" Display="Static" Text="*" />
                </td>
            </tr>

            <tr>
                <td>Annual Interest Rate</td>
                <td>
                    <asp:TextBox ID="txtInterest" runat="server" CssClass="entry"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqInterest" runat="server" CssClass="validator" ErrorMessage="Interest Rate is required" ControlToValidate="txtInterest" Display="Static" Text="*" />
                    <asp:RangeValidator 
                        ID="RangeValidator1" 
                        runat="server" 
                        ControlToValidate="txtInterest"
                        Display="Static"
                        CssClass="validator"
                        ErrorMessage="Interest rate must range from 1 to 20"
                        MaximumValue="20"
                        MinimumValue="1"
                        Type="Double"
                        Text="1 - 20 please"
                        >
                    </asp:RangeValidator>
                </td>
            </tr>

            <tr>
                <td>Number of Years</td>
                <td>
                    <asp:TextBox ID="txtYears" runat="server" CssClass="entry"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqYears" runat="server" CssClass="validator" ErrorMessage="Number of Years is required" ControlToValidate="txtYears" Display="Static" Text="*" />
                    <asp:RangeValidator 
                        ID="RangeValidator2" 
                        runat="server" 
                        ControlToValidate="txtYears"
                        Display="Static"
                        CssClass="validator"
                        ErrorMessage="Number of years must range from 1 to 45"
                        MaximumValue="45"
                        MinimumValue="1"
                        Type="Integer"
                        Text="1 to 45 please" ></asp:RangeValidator>
                    
                </td>
            </tr>

            <tr>
                
                <td>
                    <asp:Label ID="lblText" runat="server"></asp:Label>
                </td>
                
                <td>
                    <asp:Label ID="lblValue" runat="server"></asp:Label>
                </td>
            </tr>

        </table>

    <div>
        <asp:Button ID="Button1" runat="server" CssClass="button" Text="Calculate" OnClick="btnCalculate_Click" />
        <asp:Button ID="Button2" runat="server" CssClass="button" CausesValidation="False" Text="Clear" OnClick="btnClear_Click" />
    </div>    
    

</asp:Content>
