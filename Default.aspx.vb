Imports System.Data.SqlClient
Partial Class _Default
    Inherits System.Web.UI.Page
    Shared catalg As New Table()



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If conn.State = Data.ConnectionState.Open Then
                conn.Close()
            End If

            ' here I open connexion that I have declared in the module
            conn.Open()
            cmd.Connection = conn
            cmd.CommandText = "SELECT SUM(Protax) FROM Cart"
            Dim rectax As Decimal = cmd.ExecuteScalar
            labtax.Text = FormatCurrency(rectax)
            cmd.Connection = conn
            cmd.CommandText = "SELECT SUM(Prototal) FROM Cart"
            Dim rectot As Decimal = cmd.ExecuteScalar
            labtot.Text = FormatCurrency(rectot)
            conn.Close()
        Catch ex As Exception
            MsgBox(ex.ToString)
        Finally
            If conn.State = Data.ConnectionState.Open Then conn.Close()
        End Try
    End Sub
    Public Sub populatetable()
  
    End Sub

    Protected Sub Badd_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim prid As String = CType(sender, Button).CommandArgument
        Dim container = DirectCast(DirectCast(sender, Control).NamingContainer, DataListItem)
        Dim prq = DirectCast(container.FindControl("quant"), TextBox)

        Dim prquant As Integer

        If prq.Text = "" Then
            prquant = 1
        Else
            prquant = prq.Text
        End If
        Try
            If conn.State = Data.ConnectionState.Open Then
                conn.Close()
            End If
            Dim Dr As SqlDataReader
            ' here I open connexion that I have declared in the module
            conn.Open()
            cmd.Connection = conn
            cmd.CommandText = "SELECT Quantity FROM Inventory where StockID='" & prid & "'"
            Dim stk As Integer = cmd.ExecuteScalar
            If stk < prquant Then
                MsgBox("OUT OF STOCK OR INSUFFICIENT QUANTITY, ITEM IS BACKORDERED.", vbOKOnly, "Abord")
            Else

                cmd.Connection = conn
                cmd.CommandText = "SELECT StockID,Description,price,Quantity FROM Inventory where StockID='" & prid & "'"
                Dr = cmd.ExecuteReader
                Dr.Read()
                Dim poid As String = Dr(0)
                Dim descr As String = Dr(1)
                Dim pri As String = Dr(2)
                Dim qun As String = Dr(3)
                Dr.Close()

                cmd.Connection = conn
                cmd.CommandText = "SELECT COUNT(CartID) FROM Cart where CartID='" & prid & "'"
                Dim rec As Integer = cmd.ExecuteScalar
                Dim recquant As Byte
                If rec = 0 Then
                    recquant = 0
                Else
                    cmd.CommandText = "SELECT * FROM Cart where CartID='" & prid & "'"
                    Dr = cmd.ExecuteReader
                    Dr.Read()
                    recquant = Dr(2)
                    Dr.Close()
                End If
                Dim ext, tax, total As Decimal
                ext = (prquant + recquant) * pri
                tax = ext * saltax
                total = ext + tax
                If rec = 0 Then
                    cmd.Connection = conn
                    cmd.CommandText = "insert into Cart values('" & poid & "','" & descr & "','" & prquant + recquant & "','" & pri & "','" & FormatNumber(ext, 2) & "','" & FormatNumber(tax, 2) & "','" & FormatNumber(total, 2) & "')"
                    cmd.ExecuteNonQuery()
                Else
                    cmd.Connection = conn
                    cmd.CommandText = "update Cart set Proname='" & descr & "',Proquantity='" & prquant + recquant & "',Proprice='" & FormatNumber(pri, 2) & "',Proext='" & FormatNumber(ext, 2) & "',Protax='" & FormatNumber(tax, 2) & "',Prototal='" & FormatNumber(total, 2) & "' where CartID='" & poid & "'"
                    cmd.ExecuteNonQuery()
                End If
                cmd.Connection = conn
                cmd.CommandText = "update Inventory set Quantity='" & qun - (prquant + recquant) & "' where StockID='" & poid & "'"
                cmd.ExecuteNonQuery()

                cmd.Connection = conn
                cmd.CommandText = "SELECT SUM(Protax) FROM Cart"
                Dim rectax As Decimal = cmd.ExecuteScalar
                labtax.Text = FormatCurrency(rectax)
                cmd.Connection = conn
                cmd.CommandText = "SELECT SUM(Prototal) FROM Cart"
                Dim rectot As Decimal = cmd.ExecuteScalar
                labtot.Text = FormatCurrency(rectot)

            End If

            conn.Close()
        Catch ex As Exception
            MsgBox(ex.ToString)
        Finally
            If conn.State = Data.ConnectionState.Open Then conn.Close()
        End Try

    End Sub

    Protected Sub DataList2_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList2.ItemCommand
        GridView1.DataBind()
        GridView1.SelectRow(-1)
    End Sub
End Class
