<%@ Control Language="VB" AutoEventWireup="false" CodeFile="header.ascx.vb" Inherits="WebUserControl" %>
<style type="text/css">
    .style1
    {
        width: 100%;
        height: 26px;
       
    }
     .style
    {
        width: 100%;
        
        border-bottom:1px solid silver;
    }
    .style3
    {
        width: 1000px;
        height: 200px;
        margin-top: 0px;
    }
    .style4
    {
        width: 70px;
        height: 71px;
        margin-left:30px;
        margin-top:10px;
        
    }
        
    .Label1
    {
        margin-top:20px;
        color:#006699;
        
        
        }
   
    .style7
    { 
      padding-right:30px;
      height:30px;}
    .style8
    {
        width: 437px;
        height: 30px;
    }
    .style9
    {
        width: 108px;
    }
    .style10
    {
        width: 558px;
        text-align:left;
    }
    .style11
    {
        height: 54px;
    }
    .style12
    {
        height: 30px;
    }
    #line{ border-bottom:1px solid #006699}
    </style>

<table cellpadding="0" cellspacing="0" class="style">
    <tr>
        <td class="style11" colspan="3">
           <table class="style1">
                <tr>
                    <td class="style9">
            <img alt="" class="style4" src="images/logo.jpg"/></td>
                    <td class="style10">
            <asp:Label ID="Label1" runat="server" ForeColor="#006699" Font-Bold="true" Font-Size="Larger" Font-Names="Microsoft sans serif"  Text="FIGAN HARDWARE " 
               ></asp:Label><asp:Label ID="Label5" runat="server" ForeColor="#DF3A01" Font-Bold="true" Font-Names="Microsoft sans serif" Font-Size="Larger" Text="STORE " 
               ></asp:Label><br />
                        <asp:Label ID="Label3" runat="server"  Text="All your favorite tools !"></asp:Label>
            
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" ForeColor="Gray" Text="Search"></asp:Label>
        &nbsp;&nbsp;:
            <asp:TextBox ID="TextBox1" runat="server" Width="162px"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Go" Width="35px" />
                    </td>
                </tr>
            </table>
</td>
    </tr>
    <tr>
        <td colspan="3"> <img alt="" class="style3" src="images/header.jpg" /></td>
    </tr>
    <tr id="line">
        <td class="style12">            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            </td>
        <td class="style8">            Admin :&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="Hypa1" runat="server" TextDecorations="None" ForeColor="Black" NavigateUrl="~/Inventory.aspx">Inventory</asp:HyperLink>
&nbsp; |
            <asp:HyperLink ID="Hypa2" runat="server" TextDecorations="None" ForeColor="Black" NavigateUrl="~/Orders.aspx">View Orders</asp:HyperLink>
        </td>
        <td class="style7" align="right"  >                        
            &nbsp;&nbsp;
            <asp:HyperLink ID="Hyp1" runat="server" ForeColor="Black" 
                NavigateUrl="~/Default.aspx" TextDecorations="None">Catalog</asp:HyperLink>
&nbsp;&nbsp; |&nbsp;&nbsp;<asp:HyperLink ID="Hyp2" runat="server" ForeColor="Black" 
                NavigateUrl="~/Mycart.aspx" TextDecorations="None">My Cart</asp:HyperLink>
            &nbsp; |
            <asp:HyperLink ID="Hyp3" runat="server" ForeColor="Black" TextDecorations="None" NavigateUrl="~/Checkout.aspx">Check Out</asp:HyperLink>
        </td>
    </tr>
</table>

