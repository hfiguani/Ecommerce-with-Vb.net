<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Inventory.aspx.vb" Inherits="_Default" %>

<%@ Register src="header.ascx" tagname="header" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
<title>Figan hardware store | View Inventory</title>
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
                <td align="center" height="70px">
                  <asp:Label ID="Label1" runat="server" ForeColor="#DF3A01 " Font-Bold="true" Font-Size="Larger" Font-Names="Microsoft sans serif"  Text="Current Stock " 
               ></asp:Label>  
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                        BorderWidth="1px" CellPadding="2" DataKeyNames="StockID" 
                        DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" 
                        Width="765px">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="StockID" HeaderText="Stock Number" ReadOnly="True" 
                                SortExpression="StockID">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                                SortExpression="Quantity">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Description" HeaderText="Description" 
                                SortExpression="Description">
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" 
                                EditText="Update Stock" SelectText="Update Stock" ShowCancelButton="False" 
                                ShowEditButton="True" >
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fhstore %>" 
                        DeleteCommand="DELETE FROM [Inventory] WHERE [StockID] = @StockID" 
                        InsertCommand="INSERT INTO [Inventory] ([StockID], [Quantity], [Description], [Price]) VALUES (@StockID, @Quantity, @Description, @Price)" 
                        SelectCommand="SELECT [StockID], [Quantity], [Description], [Price] FROM [Inventory]" 
                        UpdateCommand="UPDATE [Inventory] SET [Quantity] = @Quantity, [Description] = @Description, [Price] = @Price WHERE [StockID] = @StockID">
                        <DeleteParameters>
                            <asp:Parameter Name="StockID" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="StockID" Type="String" />
                            <asp:Parameter Name="Quantity" Type="Int16" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Price" Type="Decimal" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Quantity" Type="Int16" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Price" Type="Decimal" />
                            <asp:Parameter Name="StockID" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                        CellPadding="2" DataKeyNames="StockID" DataSourceID="SqlDataSource2" 
                        ForeColor="Black" GridLines="None" Height="50px" Width="201px">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <Fields>
                            <asp:BoundField DataField="StockID" HeaderText="StockID" ReadOnly="True" 
                                SortExpression="StockID" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                                SortExpression="Quantity" />
                            <asp:BoundField DataField="Description" HeaderText="Description" 
                                SortExpression="Description" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                            <asp:BoundField DataField="pic" HeaderText="pic" SortExpression="pic" />
                            <asp:CommandField ButtonType="Button" CancelText="" EditText="Update" 
                                NewText="Add product" ShowEditButton="True" ShowInsertButton="True" />
                        </Fields>
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                            HorizontalAlign="Center" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fhstore %>" 
                        DeleteCommand="DELETE FROM [Inventory] WHERE [StockID] = @StockID" 
                        InsertCommand="INSERT INTO [Inventory] ([StockID], [Quantity], [Description], [Price], [pic]) VALUES (@StockID, @Quantity, @Description, @Price, @pic)" 
                        SelectCommand="SELECT * FROM [Inventory] WHERE ([StockID] = @StockID)" 
                        UpdateCommand="UPDATE [Inventory] SET [Quantity] = @Quantity, [Description] = @Description, [Price] = @Price, [pic] = @pic WHERE [StockID] = @StockID">
                        <DeleteParameters>
                            <asp:Parameter Name="StockID" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="StockID" Type="String" />
                            <asp:Parameter Name="Quantity" Type="Int16" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Price" Type="Decimal" />
                            <asp:Parameter Name="pic" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="StockID" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Quantity" Type="Int16" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Price" Type="Decimal" />
                            <asp:Parameter Name="pic" Type="String" />
                            <asp:Parameter Name="StockID" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    
        
    <div id="footer">&copy; 2013 Hafed Figuani,CMT-215 ASP.Net</div>
    </div>
    
    </form>
</body>
</html>
