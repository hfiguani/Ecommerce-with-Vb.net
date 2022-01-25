Imports System.Data.SqlClient
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub BCKO_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BCKO.Click
        Try
            If conn.State = Data.ConnectionState.Open Then
                conn.Close()
            End If

            ' here I open connexion that I have declared in the module
            conn.Open()
            cmd.Connection = conn
            cmd.CommandText = "SELECT SUM(Prototal) FROM Cart"
            Dim total As Decimal = cmd.ExecuteScalar
            If total > 0 Then
                cmd.Connection = conn
                cmd.CommandText = "insert into Orders values('" & fullname.Text & "','" & Address.Text & "','" & DateTime.Now() & "','" & FormatNumber(shipp, 2) & "','" & FormatNumber(total, 2) & "')"
                cmd.ExecuteNonQuery()

                cmd.Connection = conn
                cmd.CommandText = "SELECT MAX(OrderID) FROM Orders"
                Dim maxid As Integer = cmd.ExecuteScalar

                cmd.Connection = conn
                cmd.CommandText = "SELECT COUNT(CartID) FROM Cart"
                Dim coun As Integer = cmd.ExecuteScalar
                cmd.Connection = conn
                cmd.CommandText = "insert into ODetails (StockID,Pname,Pquantity,Pprice,Pextention,Ptax,Ptotal) select * from Cart"
                cmd.ExecuteNonQuery()


                cmd.Connection = conn
                cmd.CommandText = "update ODetails set OrderID='" & maxid & "' where DetailsID IN ( select TOP (" & coun & ") DetailsID from ODetails order by DetailsID desc) "
                cmd.ExecuteNonQuery()
                myorder.Visible = False
                succes.Visible = True
                succes.Height = 450

                cmd.Connection = conn
                cmd.CommandText = "Delete from Cart"
                cmd.ExecuteNonQuery()

            Else
                BCKO.Enabled = False
            End If
            conn.Close()
        Catch ex As Exception
            MsgBox(ex.ToString)
        Finally
            If conn.State = Data.ConnectionState.Open Then conn.Close()
        End Try

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        succes.Visible = False
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
            labtot.Text = FormatCurrency(rectot + shipp)
            labship.Text = FormatCurrency(shipp)
            conn.Close()
        Catch ex As Exception
            MsgBox(ex.ToString)
        Finally
            If conn.State = Data.ConnectionState.Open Then conn.Close()
        End Try
    End Sub
End Class
