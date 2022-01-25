<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Checkout.aspx.vb" Inherits="_Default" %>

<%@ Register src="header.ascx" tagname="header" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
<title>Figan hardware store | Check Out</title>
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style13
        {
            width: 58%;
        }
        #succes
        {
            margin-top:40px;}
       
        .style15
        {
            height: 23px;
        }
        .style16
        {
            height: 101px;
        }
    </style>
</head>
<body>
<form id="form1" runat="server" style="clip: rect(auto, auto, auto, auto)">
    <div align="center" id="wrap" runat="server">
          <uc1:header ID="header1" runat="server" />
    <asp:Panel ID="succes" runat="server" ForeColor="#006600" 
                        HorizontalAlign="Center">
                        Thank you for shopping with us ....<br />
               <br />
                        <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#006699" 
                            NavigateUrl="~/Default.aspx">Catalog</asp:HyperLink>
                        &nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#006699" 
                            NavigateUrl="~/Orders.aspx">See  Order</asp:HyperLink>
               <br />
                    </asp:Panel>
        <div ID="myorder" runat="server">

          <table class="style1"  >
            <tr>
                <td align="center" class="style16">    
                    
                    <asp:Label ID="Label1" runat="server" ForeColor="#DF3A01" Font-Bold="True" 
                        Font-Size="Larger" Font-Names="Microsoft sans serif"  Text="Welcome , Check Out.  " 
               ></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center">
                    
                    <table class="style14" width="600px">
                        <tr>
                            <td colspan="2">
                    
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fhstore %>" 
                        SelectCommand="SELECT [Proname], [Proquantity], [Proprice], [Proext] FROM [Cart]">
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                        CellPadding="2" DataSourceID="SqlDataSource1" ForeColor="Black" 
                        GridLines="None" Width="600px">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="Proname" HeaderText="Product" 
                                SortExpression="Proname" />
                            <asp:BoundField DataField="Proquantity" HeaderText="Quantity" 
                                SortExpression="Proquantity" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Proprice" HeaderText="Price" 
                                SortExpression="Proprice" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Proext" HeaderText="Extension" 
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
                    
                                Sales tax</td>
                            <td align="right">
                    
                    <asp:Label ID="labtax" runat="server" ForeColor="#CC6600"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style15">
                                Shipping fee</td>
                            <td align="right" class="style15">
                    <asp:Label ID="labship" runat="server" ForeColor="#CC6600"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" bgcolor="#FFCC66" colspan="2" 
                                style="border-top-style: groove; border-top-color: #808080">
                    <asp:Label ID="labtot" runat="server" Font-Bold="True" Font-Size="Larger" 
                        ForeColor="#0066CC"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table class="style13" align="center">
                        <tr>
                            <td align="left" width="100px">
                                Full Name : </td>
                            <td align="left">
                                <asp:TextBox ID="fullname" runat="server" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="fullname" Display="Dynamic" 
        ErrorMessage="* Please enter your name" ForeColor="Red" 
        SetFocusOnError="True" ></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ControlToValidate="fullname" Display="Dynamic" 
            ErrorMessage="Letters only,Please." ForeColor="Red" 
            ValidationExpression="^[a-zA-Z ]*$"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td align="left">
                                Address :</td>
                            <td align="left">
                                <asp:TextBox ID="Address" runat="server" TextMode="multiline" Height="90px"  
                                    Rows="5" Width="248px"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="Address" Display="Dynamic" 
        ErrorMessage="* Please enter your Address." ForeColor="Red" 
        SetFocusOnError="True" ></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                                <asp:Button ID="BCKO" runat="server" Text="Check Out" Width="93px" />
                            </td>
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
