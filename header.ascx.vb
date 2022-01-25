
Partial Class WebUserControl
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Hyp1.Font.Underline = Nothing
        Hyp2.Font.Underline = Nothing
        Hyp3.Font.Underline = Nothing
        Hypa1.Font.Underline = Nothing
        Hypa2.Font.Underline = Nothing
    End Sub
End Class
