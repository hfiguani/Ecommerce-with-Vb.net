Imports System.Data.SqlClient

Public Module mymodule
    Public conn As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\figanstore.mdf;Integrated Security=True;User Instance=True")
    Public cmd As New SqlCommand
    Public Const saltax As Decimal = 0.0625D
    Public Const shipp As Decimal = 9.95D
End Module
