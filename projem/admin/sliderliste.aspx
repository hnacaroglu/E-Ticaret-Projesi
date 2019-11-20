<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="sliderliste.aspx.cs" Inherits="admin_sliderliste" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



       <%System.Data.DataTable slidergetir = new System.Data.DataTable();
        sliderislemleri slidder = new sliderislemleri();
        slidergetir = slidder.slidercek();
                     %>

   
    <table class="table table-bordered">
        <th><h3>Mevcut Sliderlar</h3></th>
         <tr>
             <td>Slider Açıklaması</td>
             <td>Slider Resmi </td>
             <td>Güncelle</td>
             <td>Slider Sil</td>

         </tr> <%for (int i = 0; i < slidergetir.Rows.Count; i++)
      {%>

        <tr> 
            <td><%=slidergetir.Rows[i][1].ToString() %></td>
            <td><img style="width:120px; height:120px"  src="../sliderresim/<%=slidergetir.Rows[i][2].ToString() %>"</td>
            <td><a href="sliddergoster.aspx?slid=<%=slidergetir.Rows[i][0]%>">
                <img style="width:25px; height:25px" src="../images/guncelle.png" /></a></td>
            <td><a href="slidderekle.aspx?slidersil=<%=slidergetir.Rows[i][0]%>" onclick="return window.confirm('Bu sliderı silmek istediğinize emin misiniz?');"><img style="width:25px; height:25px" src="../images/delete-icon.png" /></a></td>
           

        </tr>
     
<% } %>
    </table>


</asp:Content>

