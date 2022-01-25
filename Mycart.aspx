<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Mycart.aspx.vb" Inherits="_Default" %>

<%@ Register src="header.ascx" tagname="header" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
<title>Figan hardware store | My Cart</title>
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server" style="clip: rect(auto, auto, auto, auto)">
    <div align="center" id="wrap">
          <uc1:header ID="header1" runat="server" />
    <div align="center" id="cwarp" runat="server">
        <table class="style1">
            <tr>
                <td align="center" height="40px">
                    
                    <asp:Label ID="Label1" runat="server" ForeColor="#DF3A01" Font-Bold="True" 
                        Font-Size="Larger" Font-Names="Microsoft sans serif"  Text="Chopping Cart" 
               ></asp:Label>
                    
                </td>
            </tr>
            <tr>
                <td height="500px" valign="top" align="center">
                    <table class="style13">
                        <tr>
                            <td align="center" width="630px">
                                <table class="style13" width="800px">
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:fhstore %>" 
                                                DeleteCommand="DELETE FROM [Cart] WHERE [CartID] = @CartID" 
                                                InsertCommand="INSERT INTO [Cart] ([Proname], [Proquantity], [Proprice], [Proext], [CartID]) VALUES (@Proname, @Proquantity, @Proprice, @Proext, @CartID)" 
                                                SelectCommand="SELECT [Proname], [Proquantity], [Proprice], [Proext], [CartID] FROM [Cart] ORDER BY [Proname]" 
                                                UpdateCommand="UPDATE [Cart] SET [Proquantity] = @Proquantity,[Inventory].[Quantity] = (Select Quantity from Inventory WHERE [StockID] = @CartID)+(Select proquantity from Cart WHERE [CartID] = @CartID)-@Proquantity WHERE [CartID] = @CartID ">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="CartID" Type="String" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="Proname" Type="String" />
                                                    <asp:Parameter Name="Proquantity" Type="Int16" />
                                                    <asp:Parameter Name="Proprice" Type="Decimal" />
                                                    <asp:Parameter Name="Proext" Type="Decimal" />
                                                    <asp:Parameter Name="CartID" Type="String" />
                                                </InsertParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="Proname" Type="String" />
                                                    <asp:Parameter Name="Proquantity" Type="Int16" />
                                                    <asp:Parameter Name="Proprice" Type="Decimal" />
                                                    <asp:Parameter Name="Proext" Type="Decimal" />
                                                    <asp:Parameter Name="CartID" Type="String" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                                                CellPadding="2" DataSourceID="SqlDataSource1" ForeColor="Black"  DataKeyNames="CartID"
                                                GridLines="None" Width="795px" AllowPaging="True">
                                                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                                <Columns>
                                                    <asp:BoundField DataField="Proname" HeaderText="Product" 
                                                        SortExpression="Proname" ReadOnly="True" /> 
                                                    <asp:BoundField DataField="Proquantity" HeaderText="Quantity" 
                                                        SortExpression="Proquantity" />
                                                    <asp:BoundField DataField="Proprice" HeaderText="Price" 
                                                        SortExpression="Proprice" ReadOnly="True" />
                                                    <asp:BoundField DataField="Proext" HeaderText="Extension" 
                                                        SortExpression="Proext" ReadOnly="True" />
                                                    <asp:CommandField ButtonType="Button" SelectText="Update" 
                                                        ShowDeleteButton="True" EditText="Change Quantity" 
                                                        ShowCancelButton="False" ShowEditButton="True" >
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    </asp:CommandField>
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
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td width="630px" align="center">
                                 <asp:HyperLink ID="H1" runat="server" NavigateUrl="~/s.aspx">Back to Catalog</asp:HyperLink>
                                &nbsp; |&nbsp;
                                <asp:HyperLink ID="H2" runat="server" NavigateUrl="~/Checkout.aspx">Check Out</asp:HyperLink> </td>
           </td>
                        </tr>
                        <tr>
                            <td width="630px">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
        
    <div id="footer">&copy; 2013 Hafed Figuani,CMT-215 ASP.Net</div>
    </div>
    
    </form>
</body>
</html>
