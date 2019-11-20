<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="urundurumguncelle.aspx.cs" Inherits="urundurumguncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="width:600px; height:auto; margin:auto">
      <table><th><h3>Kampanya Güncelleme</h3></th></table>
   <table class="table table-bordered">
       
       <th><h4>Yeni İsim</h4></th>
        
          <%  int gelen = Convert.ToInt16(Request.QueryString["kampgncl"]);
              urundurum kampanyabulma = new urundurum();
                System.Data.DataTable kamptek = new System.Data.DataTable();
                kamptek = kampanyabulma.kampanyabul(gelen);              
                    %>
        
        <tr><td>
              
              
            <asp:TextBox ID="TextBox1" runat="server" text="" Height="36px" Width="147px"></asp:TextBox>&nbsp;<asp:Button ID="Button1" runat="server" Text="Güncelle" OnClick="Button1_Click"  CssClass="btn btn-success" />&nbsp;<asp:Button ID="Button2" runat="server" Text="Vazgeç" CssClass=" btn btn-warning" OnClick="Button2_Click" />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            </td>    
            
             

        </tr>
<td></td>

    </table></div>
</asp:Content>

