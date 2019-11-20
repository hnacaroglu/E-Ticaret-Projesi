<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="anakatguncelle.aspx.cs" Inherits="admin_anakatguncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table><th><h3>Ana Kategori Güncelleme</h3></th></table>
   <table class="table table-bordered">
       <th>Güncel İsim</th>
       <th>Yeni İsim</th>
        
          <% int anano = Convert.ToInt16(Request.QueryString["anakatgncl"]);
              kategoriislem anakatislem = new kategoriislem();
                System.Data.DataTable anakattablo = new System.Data.DataTable();
                anakattablo = anakatislem.anakatbulma(anano);
                
                    %>
          <%
            %>
        <tr><td>
              <%=anakattablo.Rows[0]["anakatadi"] %> <td> <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Bu Alan Boş Geçilemez..." ForeColor="Red" ValidationGroup="VAna"></asp:RequiredFieldValidator></td><tr><td></td><td>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Güncelle" OnClick="Button1_Click" CssClass="btn btn-success" ValidationGroup="VAna" />&nbsp;<asp:Button ID="Button2" runat="server" Text="Vazgeç" CssClass="btn btn-danger" OnClick="Button2_Click" /> </td> </tr>
            </td>
            
            

        </tr>
<td></td>

    </table>




</asp:Content>

