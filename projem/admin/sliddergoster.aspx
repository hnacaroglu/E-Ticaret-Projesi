<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="sliddergoster.aspx.cs" Inherits="sliddergoster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    <style type="text/css">
        .auto-style1 {
            width: 269px;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div style="width:750px; height:auto; margin:auto ">

    <table class="table table"><th><h3>Slider Güncelleme</h3></th></table>
   <table class="table table-bordered">
     <tr>  <th class="auto-style1">Slider Adı</th><th>Slider Resmi</th>
       
        

  

    </tr>

        <tr> 
              <td class="auto-style1" >
               
                  <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vslider"></asp:RequiredFieldValidator>
              </td><td> <asp:Image Width="120px" Height="120px" ID="Image1" runat="server" /><asp:FileUpload ID="FileUpload1" runat="server" /></td>
           
          
           

        </tr>
       <tr><td class="auto-style1" ></td>
       <td >
                <asp:Button ID="Button1" runat="server" Text="Kaydet" OnClick="Button1_Click" CssClass="btn btn-success" ValidationGroup="Vslider"/>&nbsp;<asp:Button ID="Button2" runat="server" Text="Vazgeç" CssClass="btn btn-default" OnClick="Button2_Click" />
           </td>
           </tr>
     

    </table></div>
     
     
</asp:Content>

