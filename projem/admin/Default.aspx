<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="giris" %>

<!DOCTYPE html>

<html">
<head runat="server">
    <title>Admin</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />


</head>
<body style="background-color:#554f62">
  
    <form id="form1" runat="server">
    <div style="width:350px; height:200px; margin:250px auto">   

        <table class="table table-condensed">
            <tr><td><h3 style="color:#b6a5a5">Kullanıcı Adı:</h3> </td> <td>
                <asp:TextBox ID="TextBox1" runat="server" Height="48px"></asp:TextBox></td></tr>
            <tr><td><h3 style="color:#b6a5a5">Parola:</h3> </td><td> <asp:TextBox ID="TextBox2" runat="server" Height="47px" TextMode="Password"></asp:TextBox></td></tr>
            <tr><td></td><td>
                <asp:Button ID="Button1" runat="server" Text="Giriş" CssClass="btn btn-danger" Height="45px" Width="107px" OnClick="Button1_Click"/></td></tr>
        </table>

    </div>



</form>
</body>
</html>
