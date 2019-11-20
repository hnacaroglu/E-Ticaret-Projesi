<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="uyeincele.aspx.cs" Inherits="uyeincele" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table ><tr><td><h2>Üye İncele</h2></td></tr></table>
      <table class="table table-striped" style="float:right">
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label1" runat="server" Text="Adı: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage=" *Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vuye"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label2" runat="server" Text="Soyadı: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage=" *Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vuye"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label3" runat="server" Text="Kullanıcı Adı: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage=" *Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vuye"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label4" runat="server" Text="E-mail: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            &nbsp; *örnek@gmail.com<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4" ErrorMessage=" *Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vuye"></asp:RequiredFieldValidator>
            &nbsp;<br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="* Geçerli bir E-mail adresi giriniz." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Vuye"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label5" runat="server" Text="Resim:"></asp:Label>
            </td>
            <td>
                
                <asp:Image style="width:150px; height:150px" ID="Image1" runat="server" />
                &nbsp;<asp:FileUpload ID="FileUpload1" runat="server" />
            &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label6" runat="server" Text="Telefon: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            &nbsp;* 05XXXXXXXXX&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox6" ErrorMessage="*Geçerli Bir Telefon Numarası Giriniz." ForeColor="Red" ValidationExpression="^(05(\d{9}))$" ValidationGroup="Vuye"></asp:RegularExpressionValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox6" ErrorMessage=" *Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vuye"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            
            <td class="auto-style1">
                <asp:Label ID="Label7" runat="server" Text="Onay: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox7" ErrorMessage=" *Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vuye"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Güncelle"  CssClass="btn btn-info" OnClick="Button1_Click" ValidationGroup="Vuye"/>
                &nbsp;<asp:Button ID="Button2" runat="server" Text="Vazgeç"  CssClass="btn  btn-success" OnClick="Button2_Click"/>

            </td>
        </tr>
    </table>
</asp:Content>

