<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="slidderekle.aspx.cs" Inherits="admin_slidderekle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <table class="table">
        <th style="text-align:center">
           <h3>Slidder Ekle</h3>
        </th>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Slidder Açıklaması: "></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Bu Alan Boş  Geçilemez." ForeColor="Red" ValidationGroup="Vslid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td> <asp:Label ID="Label2" runat="server" Text="Slidder Resmi: "></asp:Label></td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FileUpload1" ErrorMessage="* Bu Alan Boş  Geçilemez." ForeColor="Red" ValidationGroup="Vslid"></asp:RequiredFieldValidator>
&nbsp;</td>
        </tr>
        <tr>
            <td></td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Kaydet" OnClick="Button1_Click" CssClass="btn btn-success" ValidationGroup="Vslid"/></td></tr>
    </table>

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

