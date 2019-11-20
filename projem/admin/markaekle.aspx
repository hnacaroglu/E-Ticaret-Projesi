<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="markaekle.aspx.cs" Inherits="admin_markaekle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <table class="table table-bordered">
        <th>
           <h3>Marka Ekleme</h3>
        </th>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Marka Adı: "></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vmark"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Marka Resmi: "></asp:Label></td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Kaydet" OnClick="Button1_Click"  CssClass="btn btn-success" ValidationGroup="Vmark"/></td>
        </tr>
    </table>
    
    <table class="table table-bordered" style="border:solid; border-color:aqua">
              <% 
                markaislem markaislem = new markaislem();
                System.Data.DataTable markatablo = new System.Data.DataTable();
                markatablo = markaislem.markalist();
                
                    %>
       <th><h3>Mevcut Markalar</h3></th>
        <tr><th>Marka Adı</th>
            <th>Marka Resmi</th>
            <th>Güncelle</th>
            <th>Sil</th></tr>

        <%for (int i = 0; i < markatablo.Rows.Count; i++)
          {%>
           <tr><td>
               <%=markatablo.Rows[i]["markaadi"] %>  </td>
               <td>
                   <img style="width:60px; height:60px;" alt="" src="../markaresim/<%=markatablo.Rows[i]["markaresim"]%>" /></td>
                <td><a href="markaguncelle.aspx?markagncl=<%=markatablo.Rows[i][0]%>">
                    <img style="width:25px; height:25px" src="../images/guncelle.png" /></a>&nbsp;
                    &nbsp;
               </td>
               <td><a href="markaekle.aspx?markasil=<%=markatablo.Rows[i][0]%>" onclick="return window.confirm('Gerçekten bu markayı silmek istediğinize emin misiniz?');">
                   <img style="width:25px; height:25px" src="../images/delete-icon.png" /></a></td>

           </tr>

              
          <%} %>
        

    </table>


</asp:Content>

