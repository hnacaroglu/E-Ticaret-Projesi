<%@ Page Title="" Language="C#" MasterPageFile="~/ana1.master" AutoEventWireup="true" CodeFile="uyeform.aspx.cs" Inherits="uyeform" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 199px;
            height: 31px;
        }
        
          .auto-style4 {
            margin:10px auto;
         
        }

        .auto-style5 {
            width: 259px;
            height: 31px;
        }
        .auto-style7 {
            height: 40px;
            width: 259px;
            margin-left: 40px;
        }
        .auto-style8 {
            width: 199px;
            height: 41px;
        }
        .auto-style9 {
            height: 41px;
            width: 259px;
        }

        .auto-style10 {        height: 53px;
    }
        .auto-style11 {
            height: 40px;
            width: 199px;
        }
        #divici {
        color:white;
        font-weight:bold;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div>
        <div class="auto-style4" style="width:500px; height:550px; background-color:#fb5e33; border-radius:10px; ">
    <table class="auto-style4" style="align-content:center; margin:10px 50px 10px 50px">
        <th id="divici" style="font-size:20px; text-align:center; margin:10px auto" class="auto-style10" colspan="2"> Kullanıcı Kayıt Formu</th>
        <tr>
            <td id="divici" class="auto-style11">
                <asp:Label ID="Label3" runat="server" Text="Adı:"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox3" runat="server" Height="25px" Width="173px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Boş Geçilemez." ForeColor="White" SetFocusOnError="True" ValidationGroup="Tetikle"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td id="divici" class="auto-style11">
                <asp:Label ID="Label4" runat="server" Text="Soyadı: "></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox4" runat="server" Height="25px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="Boş Geçilemez." ForeColor="White" SetFocusOnError="True" ValidationGroup="Tetikle"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td id="divici" class="auto-style11">
                <asp:Label ID="Label5" runat="server" Text="Kullanıcı Adı: "></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox5" runat="server" Height="25px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="Boş Geçilemez." ForeColor="White" SetFocusOnError="True" ValidationGroup="Tetikle"></asp:RequiredFieldValidator>
                <br />
            &nbsp;<asp:Label ID="Label13" runat="server" Text="" ForeColor="White" Font-Bold="true"></asp:Label>
            </td>
        </tr>
        <tr>
            <td id="divici" class="auto-style11">&nbsp;<asp:Label ID="Label6" runat="server" Text="Parola:"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox6" runat="server" Height="25px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox6" ErrorMessage="Boş Geçilemez." ForeColor="White" SetFocusOnError="True" ValidationGroup="Tetikle"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td id="divici" class="auto-style11">
                <asp:Label ID="Label7" runat="server" Text="Parola Tekrarı:"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox7" runat="server" Height="27px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox7" ErrorMessage="Boş Geçilemez." ForeColor="White" SetFocusOnError="True" ValidationGroup="Tetikle"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox6" ControlToValidate="TextBox7" ErrorMessage="Şifreler Uyuşmuyor." ForeColor="White" SetFocusOnError="True" ValidationGroup="Tetikle"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td id="divici" class="auto-style11">
                <asp:Label ID="Label8" runat="server" Text="E-Mail: "></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox8" runat="server" Height="25px">ornek@gmail.com</asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox8" ErrorMessage="Boş Geçilemez." ForeColor="White" SetFocusOnError="True" ValidationGroup="Tetikle"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox8" ErrorMessage="Geçerli Bir E-Mail Yazınız." ForeColor="White" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Tetikle"></asp:RegularExpressionValidator>
            </td>
        </tr>
           <tr>
            <td id="divici" class="auto-style11">
                <asp:Label ID="Label1" runat="server" Text="Resim:  "></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td id="divici" class="auto-style11">
                <asp:Label ID="Label9" runat="server" Text="Telefon: "></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox9" runat="server" Height="25px"></asp:TextBox>
                &nbsp;05XXXXXXXXX<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox9" ErrorMessage="Boş Geçilemez." ForeColor="White" ValidationGroup="Tetikle"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox9" ErrorMessage="Geçerli Telefon Giriniz." ForeColor="White" ValidationExpression="^(05(\d{9}))$" ValidationGroup="Tetikle"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td id="divici" class="auto-style11">
                <asp:Label ID="Label11" runat="server" Text="Doğrulama Kodu: "></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox10" runat="server" Height="25px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label12" runat="server" Visible="False"></asp:Label>
            &nbsp;
            </td>
            <td class="auto-style5">
                <asp:Image ID="Image1" runat="server" />
                <asp:Image ID="Image2" runat="server" />
                <asp:Image ID="Image3" runat="server" />
                <asp:Image ID="Image4" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style8"></td>
            <td class="auto-style9">
                <asp:Button ID="Button1" runat="server" Text="Kaydet" ForeColor="White"  CssClass="btn btn-success" OnClick="Button1_Click" ValidationGroup="Tetikle" />
            &nbsp;
            </td>
        </tr>
    </table>
           
            <asp:Panel ID="pop" runat="server" >
                <div class="alert alert-success" style="width:200px; height:auto">
  <strong>Tebrikler!</strong>Bilgileriniz başarıyla kaydedilmiştir. Üyeliğiniz onaylandıktan sonra hesabınıza giriş yapabilirsiniz.
                    <asp:Button ID="Button2" runat="server" Text="İptal" style="display:none"/>
                     <asp:Button ID="Button3" runat="server" Text="Tamam" OnClick="Button2_Click" />
                     
</div>

            </asp:Panel>
            <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Button2" PopupControlID="pop"></asp:ModalPopupExtender>
</div></div>
</asp:Content>

