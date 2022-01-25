Imports System.Data.SqlClient
Partial Class _Default
    Inherits System.Web.UI.Page

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

   

    Protected Sub GridView1_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridView1.RowUpdated
       
        GridView1.DataBind()
        GridView1.SelectRow(-1)
    End Sub
End Class
