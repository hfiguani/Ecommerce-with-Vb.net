<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Orders.aspx.vb" Inherits="_Default" %>

<%@ Register src="header.ascx" tagname="header" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
<title>Figan hardware store | View Orders</title>
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
    
        <table class="style1">
            <tr>
                <td align="center" height="60px">
                 <asp:Label ID="Label5" runat="server" ForeColor="#DF3A01" Font-Bold="true" Font-Names="Microsoft sans serif" Font-Size="Larger" Text=" All Orders " 
               ></asp:Label>   
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fhstore %>" 
                        SelectCommand="SELECT * FROM [Orders] ORDER BY [Or_date]">
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                        CellPadding="2" DataKeyNames="OrderID" DataSourceID="SqlDataSource1" 
                        ForeColor="Black" GridLines="None" Width="875px" AllowPaging="True">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="OrderID" HeaderText="Order ID" ReadOnly="True" 
                                SortExpression="OrderID">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cust_name" HeaderText="Customer" 
                                SortExpression="Cust_name" />
                            <asp:BoundField DataField="Cust_address" HeaderText="Address" 
                                SortExpression="Cust_address" />
                            <asp:BoundField DataField="Or_date" HeaderText="Order Date" 
                                SortExpression="Or_date">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Shipping" HeaderText="Shipping" 
                                SortExpression="Shipping">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                            <asp:CommandField ButtonType="Button" SelectText="View Details" 
                                ShowSelectButton="True">
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
                <td align="center" height="5px">
                    </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fhstore %>" 
                        
                        SelectCommand="SELECT [Pname], [Pquantity], [Pprice], [Pextention], [Ptax], [Ptotal] FROM [ODetails] WHERE ([OrderID] = @OrderID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="OrderID" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                        BorderWidth="1px" CellPadding="2" 
                        DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="None" 
                        Width="875px">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="Pname" HeaderText="Name" 
                                SortExpression="Pname" />
                            <asp:BoundField DataField="Pquantity" HeaderText="Quantity" 
                                SortExpression="Pquantity" />
                            <asp:BoundField DataField="Pprice" HeaderText="Price" 
                                SortExpression="Pprice" />
                            <asp:BoundField DataField="Pextention" HeaderText="Extention" 
                                SortExpression="Pextention" />
                            <asp:BoundField DataField="Ptax" HeaderText="Tax" 
                                SortExpression="Ptax" />
                            <asp:BoundField DataField="Ptotal" HeaderText="Total" SortExpression="Ptotal" />
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
        </table>
    
        
    <div id="footer">&copy; 2013 Hafed Figuani,CMT-215 ASP.Net</div>
    </div>
    
    </form>
</body>
</html>
