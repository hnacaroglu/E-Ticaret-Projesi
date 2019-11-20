<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="altkatguncel.aspx.cs" Inherits="altkatguncel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 255px;
        }
        .auto-style2 {
            width: 146px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


     <table><th><h3>Alt Kategori Güncelleme</h3></th></table>
   <table class="table table-bordered">
       <th class="auto-style2">Güncel İsim</th>
       <th>Yeni İsim</th>
        
          <% int i = Convert.ToInt16(Request.QueryString["altkatgncl"]);
              kategoriislem altkatislem = new kategoriislem();
                System.Data.DataTable altkattablo = new System.Data.DataTable();
                altkattablo = altkatislem.altkatbul(i);
                
                    %>
          <%
         %>
        <tr><td class="auto-style2">
              <%=altkattablo.Rows[0]["altkategoriadi"] %></td>  <td><asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="valt" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
            </td>
           <tr> <td class="auto-style2"></td><td class="auto-style1"><asp:Button ID="Button1" runat="server" Text="Güncelle" OnClick="Button1_Click" CssClass="btn btn-success" ValidationGroup="valt" /> &nbsp;<asp:Button ID="Button2" runat="server" Text="Vazgeç" OnClick="Button2_Click" CssClass="btn btn-danger" />
            &nbsp;</td>  </tr>  
            
             

        </tr>
<td class="auto-style2"></td>

    </table>


</asp:Content>

