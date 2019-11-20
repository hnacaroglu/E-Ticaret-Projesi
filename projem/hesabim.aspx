<%@ Page Title="" Language="C#" MasterPageFile="~/ana1.master" AutoEventWireup="true" CodeFile="hesabim.aspx.cs" Inherits="hesabim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Bilgilerinizi gerçekten güncellemek istiyor musunuz? ")) {
                confirm_value.value = "Evet";
            } else {
                confirm_value.value = "Hayır";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>   
      <style type="text/css">
          .auto-style1 {
              height: 56px;
          }
      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="account">
			<h2 class="account-in">HESABIM</h2>
         <table class="table table-striped">
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label1" runat="server" Text="Adınız: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vhesap"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label2" runat="server" Text="Soyadınız: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vhesap"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label3" runat="server" Text="Kullanıcı Adınız: "></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vhesap"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label4" runat="server" Text="E-mail: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vhesap"></asp:RequiredFieldValidator>
            </td>
        </tr>
             <tr>
            <td class="auto-style1">
                <asp:Label ID="Label8" runat="server" Text="Parola: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox8" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vhesap"></asp:RequiredFieldValidator>
            </td>
        </tr>
             <tr>
            <td class="auto-style1">
                <asp:Label ID="Label9" runat="server" Text="Parola Tekrarı: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox9" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vhesap"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label5" runat="server" Text="Resim:"></asp:Label>
            </td>
            <td>
                <img alt="" style="width:50px; height:50px" src="uyeresim/<%=TextBox5.Text %>" />
                <asp:TextBox ID="TextBox5" runat="server" Visible="false"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox5" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vhesap"></asp:RequiredFieldValidator>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label6" runat="server" Text="Telefon: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox6" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vhesap"></asp:RequiredFieldValidator>
            </td>
        </tr>
        
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Güncelle"  CssClass="btn btn-info"   OnClick = "Button1_Click" ValidationGroup="Vhesap"/>
                &nbsp;<asp:Button ID="Button2" runat="server" Text="Vazgeç"  CssClass="btn  btn-success" OnClick="Button2_Click" />

            </td>
        </tr>
    </table></div>
</asp:Content>

