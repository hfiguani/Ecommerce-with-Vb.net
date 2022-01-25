<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register src="header.ascx" tagname="header" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
<title>Figan hardware store | home</title>
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            
            margin-right:5px;
        }
        .style13
        {
            height: 23px;
        }
        .style14
        {
            width: 716px;
        }
        .style15
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="clip: rect(auto, auto, auto, auto)">
    <div align="center" id="wrap">
          <uc1:header ID="header1" runat="server" />
    
        <table class="style1">
            <tr>
                <td class="style13" colspan="3" align="left">
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <asp:Label ID="Label1" runat="server" ForeColor="#DF3A01 " Font-Bold="true" Font-Size="Larger" Font-Names="Microsoft sans serif"  Text="Welcome to Figan Hardware Store.  " 
               ></asp:Label>
                    <br />
                    <br />
                </td>
                <td class="style13" align="left">
                    
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style14" rowspan="5">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fhstore %>" 
                        SelectCommand="SELECT [StockID], [Description], [Price], [pic] FROM [Inventory] ORDER BY [Description]">
                    </asp:SqlDataSource>
                               <asp:DataList ID="DataList2" runat="server" DataKeyField="StockID" 
                        DataSourceID="SqlDataSource2" Width="694px" 
                        Height="248px" HorizontalAlign="Center" RepeatColumns="3" 
                        RepeatDirection="Horizontal" CellPadding="8" CellSpacing="8">
                                   <AlternatingItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                   <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" 
                                       BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
                        <ItemTemplate>                           
                           <b> <asp:Label ID="DescriptionLabel" runat="server" 
                                Text='<%# Eval("Description") %>' /></b>
                            <br />
                            <img src='images/<%# Eval("pic")%>' alt='<%# Eval("Description")%>'/>
                            <br />
                            Price: $ <asp:Label ID="PiceLabel" runat="server" Text='<%# Eval("Price") %>' />
                            <br />
                            Quantity:<asp:TextBox ID="quant" runat="server" Width="30px"></asp:TextBox><asp:RangeValidator
                                ID="RangeValidator1" runat="server" ErrorMessage="*" ForeColor="Red" Type="Integer" MinimumValue="1" MaximumValue="500" ControlToValidate="quant"></asp:RangeValidator><asp:Button ID="Badd" runat="server" Text="Add to Cart" OnClick="Badd_Click" CommandArgument='<%# Eval("StockID") %>' />
<br />
                        </ItemTemplate>
                    </asp:DataList>
                  </td>
                <td valign="top" colspan="2" nowrap="wrap">
                    <table class="style15">
                        <tr>
                            <td colspan="2">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fhstore %>" 
                        
                        SelectCommand="SELECT [Proname], [Proquantity], [Proprice], [Proext] FROM [Cart] ORDER BY [Proname]">
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                        Caption="My Cart" CaptionAlign="Top" CellPadding="2" 
                        DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" 
                        ShowHeader="False" Width="265px">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="Proname" HeaderText="Proname" 
                                SortExpression="Proname" />
                            <asp:BoundField DataField="Proquantity" HeaderText="Proquantity" 
                                SortExpression="Proquantity" />
                             <asp:TemplateField >
                    <ItemTemplate>
                        <asp:LinkButton ID="lbt" runat="server" CausesValidation="false" 
                        Text=" * "  Enabled="false">
                        </asp:LinkButton>
                    </ItemTemplate>
                    </asp:TemplateField> 
                            <asp:BoundField DataField="Proprice" HeaderText="Proprice" 
                                SortExpression="Proprice" />
                            <asp:BoundField DataField="Proext" HeaderText="Proext" 
                                SortExpression="Proext" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                            HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                    Sales Tax</td>
                            <td align="right">
                    <asp:Label ID="labtax" runat="server" ForeColor="#CC6600"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2" 
                                style="border-color: #808080; background-color: #FFCC66; border-top-style: groove;">
                    <asp:Label ID="labtot" runat="server" Font-Bold="True" Font-Size="Larger" 
                        ForeColor="#0066CC"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:HyperLink ID="H1" runat="server" NavigateUrl="~/Mycart.aspx">Make Change</asp:HyperLink>
                                &nbsp; |&nbsp;
                                <asp:HyperLink ID="H2" runat="server" NavigateUrl="~/Checkout.aspx">Check Out</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                    <br />
                    </td>
                <td valign="top" nowrap="wrap">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;</td>
                <td valign="top" align="right">
                    &nbsp;</td>
                <td valign="top" align="right">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top" align="right" colspan="2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                <td valign="top" align="right">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    &nbsp;</td>
                <td align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
        
    <div id="footer">&copy; 2013 Hafed Figuani,CMT-215 ASP.NetASP.Net</div>
    </div>
    
    </form>
</body>
</html>
