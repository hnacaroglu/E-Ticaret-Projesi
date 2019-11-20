<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="altkatekle.aspx.cs" Inherits="admin_altkatekle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="table table-bordered">
        <th>
           <td>Alt Kategori Ekle</td>
        </th>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Ana Kategori Adı:"></asp:Label></td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="anaaltkategori" DataTextField="anakatadi" DataValueField="anakatid"></asp:DropDownList>
                <asp:SqlDataSource ID="anaaltkategori" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_anakategori]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td> <asp:Label ID="Label2" runat="server" Text="Alt Kategori Adı: "></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Valt" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Kaydet" OnClick="Button1_Click" CssClass="btn btn-success" ValidationGroup="Valt" /></td>
        </tr>
    </table>
      <table class="table table-bordered" style="border:solid; border-color:aqua">
             
           <%  System.Data.DataTable alttablo = new System.Data.DataTable();
                  kategoriislem altkatislem = new kategoriislem();               
                alttablo = altkatislem.altkatlist();                
                    %>
       <th><h3>Mevcut Alt KAtegoriler</h3></th>
          <th><h4>Güncelle</h4></th>
          <th><h4>Sil</h4></th>
        <%for (int i = 0; i < alttablo.Rows.Count; i++)
          {%>
           <tr><td>
               <%=alttablo.Rows[i]["altkategoriadi"] %>  </td>
                <td>
                    
                    
                    <a href="altkatguncel.aspx?altkatgncl=<%=alttablo.Rows[i][0]%>"> <img style="width:25px; height:25px;" src="../images/guncelle.png" /></a>&nbsp;
                    &nbsp;
               </td>
               <td>
                   
                   <%
              System.Data.DataTable urunvarmi = new System.Data.DataTable();
              urunislemleri urunler = new urunislemleri();
              urunvarmi = urunler.altkatlist(Convert.ToInt16(alttablo.Rows[i][0]));
                       
                       if (Convert.ToInt16(urunvarmi.Rows.Count)==0)
                     {%>

                            <a href="altkatekle.aspx?altkatsil=<%=alttablo.Rows[i][0]%>"  onclick="return window.confirm('Gerçekten bu alt kategoriyi silmek istediğinize emin misiniz?');"><img style="width:25px; height:25px;" src="../images/silme.png" /></td>


                            <% } %>

                <%else
                       {%>
                              <a href="#" onclick="return window.confirm('Bu alt kategoriye ait ürünler mevcut olduğu için silme işlemi gerçekleşemez. Lütfen önce bu ürünleri siliniz... ');" ><img style="width:25px; height:25px;" src="../images/silme.png" /></td>
                       <%} %>

           </tr>

              
          <%} %>
        

    </table>
</asp:Content>

