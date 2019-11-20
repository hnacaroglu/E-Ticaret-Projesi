<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="urunlistele.aspx.cs" Inherits="admin_urunlistele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
   

  <asp:Panel ID="AnaPanel" runat="server" Visible="true">
    <table class="table table-bordered" >
       
            
            <tr>
                <th>
                    <td>
                        <h3>Tüm Ürünler</h3>
                    </td>
                    <td>
                        <h3>Ana Kategoriye Göre Listele</h3>
                    </td>
                    <td>
                        <h3>Alt Kategoriye Göre Listele</h3>
                    </td>
                    <td>
                        <h3>Markaya Göre Listele</h3>
                    </td>
                    <td>
                        <h3>Kampanyalı Ürünlere Göre</h3>
                    </td>
                </th>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Tüm Ürünleri Gör" Height="54px" />
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="anakatlist" DataTextField="anakatadi" DataValueField="anakatid"></asp:DropDownList>
                        <asp:SqlDataSource ID="anakatlist" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_anakategori]"></asp:SqlDataSource>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="Gör" OnClick="Button2_Click1" />
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="altkatlist" DataTextField="altkategoriadi" DataValueField="altkategoriid">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="altkatlist" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_altkategori]"></asp:SqlDataSource>
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Gör" />
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="markalist" DataTextField="markaadi" DataValueField="markaid"></asp:DropDownList>
                        <asp:SqlDataSource ID="markalist" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_marka]"></asp:SqlDataSource>
                        <asp:Button ID="Button4" runat="server" Text="Gör" OnClick="Button4_Click"/></td>
                    <td>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="kamplist" DataTextField="urndurumadi" DataValueField="urndurumid"></asp:DropDownList>
                        <asp:SqlDataSource ID="kamplist" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_urundurum]"></asp:SqlDataSource>
                        <asp:Button ID="Button5" runat="server" Text="Gör" OnClick="Button5_Click1" /></td>
                </tr>
            </tr>

             
               
            
    </table>
  </asp:Panel>
    <asp:Panel ID="tumurunler" runat="server" Visible="false">
         <table class="table table-bordered">
             <caption>
                 <a href="#">Tüm Ürünler</a>
                 <tr>
                     <th>
                         <td>Ürün Adı</td>
                         <td>Ürünün Resmi</td>
                         <td>Fiyatı</td>
                         <td>Özellik</td>
                         <td>Stok</td>
                         <td>Güncelle</td>
                         <td>Ürünü Sil</td>
                     </th>
                     <% 
                urunislemleri urunislem = new urunislemleri();
                System.Data.DataTable uruntablo = new System.Data.DataTable();
                uruntablo = urunislem.urunlistele();
                
                    %><%
                      
        
                      
                   
                for (int i = 0; i < uruntablo.Rows.Count; i++)
                {
                    %>
                     <tr>
                         <td></td>
                         <td><%=uruntablo.Rows[i]["urnadi"] %></td>
                         <td><img style="width:100px; height:100px" src="../urunresmi/<%=uruntablo.Rows[i]["urnresim"] %> "/></td>
                         <td><%=uruntablo.Rows[i]["urnfiyati"] %></td>
                         <td><%=uruntablo.Rows[i]["urnozellik"] %></td>
                         <td><%=uruntablo.Rows[i]["urnstok"] %></td>
                         <td><a href="urunincele.aspx?gncl=<%=uruntablo.Rows[i][0]%>">
                             <img src="../images/guncel.png" />
                             </a></td>
                         <td><a href="urunlistele.aspx?urunsil=<%=uruntablo.Rows[i][0]%>">
                             <img style="width:25px; height:25px" src="../images/sil.jpg" /></a>
                         </td>
                     </tr>
                     <%  }
                 %>
                 </tr>
             </caption></table>
    </asp:Panel>

    <asp:Panel ID="anakat" runat="server" Visible="false">    
        <table class="table table-bordered">
            <caption>
                <a href="#">Ana Kategoriye Göre</a>
                <tr>
                    <th>
                        <td>Ürün Adı</td>
                        <td>Ürünün Resmi</td>
                        <td>Fiyatı</td>
                        <td>Özellik</td>
                        <td>Stok</td>
                        <td>Güncelle</td>
                        <td>Ürünü Sil</td>
                    </th>
                    <% 
                urunislemleri urunislem = new urunislemleri();
                System.Data.DataTable uruntablo = new System.Data.DataTable();
                uruntablo = urunislem.anakatlist(Convert.ToInt16(DropDownList1.SelectedValue));
                
                    %><%
                        
                   
                for (int i = 0; i < uruntablo.Rows.Count; i++)
                {
                    %>
                    <tr>
                        <td></td>
                        <td><%=uruntablo.Rows[i]["urnadi"] %></td>
                        <td><%=uruntablo.Rows[i]["urnresim"] %></td>
                        <td><%=uruntablo.Rows[i]["urnfiyati"] %></td>
                        <td><%=uruntablo.Rows[i]["urnozellik"] %></td>
                        <td><%=uruntablo.Rows[i]["urnstok"] %></td>
                        <td><a href="urunincele.aspx?gncl=<%=uruntablo.Rows[i][0]%>">
                            <img src="../images/guncel.png" />
                            </a></td>
                        <td><a href="urunlistele.aspx?urunsil=<%=uruntablo.Rows[i][0]%>"></a>
                            <img src="../images/sil.jpg" / width="25px" height="25px">
                        </td>
                    </tr>
                    <% } 
                 %>
                </tr>
            </caption>
    </asp:Panel>
    <asp:Panel ID="altkat" runat="server" Visible="false">
        
          <table class="table table-bordered">
              <caption>
                  <a href="#">Alt Kategoriye Göre</a>
                  <tr>
                      <th>
                          <td>Ürün Adı</td>
                          <td>Ürünün Resmi</td>
                          <td>Fiyatı</td>
                          <td>Özellik</td>
                          <td>Stok</td>
                          <td>Güncelle</td>
                          <td>Ürünü Sil</td>
                      </th>
                      <% 
                urunislemleri urunislem = new urunislemleri();
                System.Data.DataTable uruntablo = new System.Data.DataTable();
                uruntablo = urunislem.altkatlist(Convert.ToInt16(DropDownList2.SelectedValue));
                
                    %><%
                        
                   
                for (int i = 0; i < uruntablo.Rows.Count; i++)
                {
                    %>
                      <tr>
                          <td></td>
                          <td><%=uruntablo.Rows[i]["urnadi"] %></td>
                          <td><%=uruntablo.Rows[i]["urnresim"] %></td>
                          <td><%=uruntablo.Rows[i]["urnfiyati"] %></td>
                          <td><%=uruntablo.Rows[i]["urnozellik"] %></td>
                          <td><%=uruntablo.Rows[i]["urnstok"] %></td>
                          <td><a href="urunincele.aspx?gncl=<%=uruntablo.Rows[i][0]%>">
                              <img src="../images/guncel.png" />
                              </a></td>
                          <td><a href="urunlistele.aspx?urunsil=<%=uruntablo.Rows[i][0]%>"></a>
                              <img src="../images/sil.jpg" />
                          </td>
                      </tr>
                      <% } 
                 %>
                  </tr>
              </caption></table>
    </asp:Panel>

    <asp:Panel ID="markakat" runat="server" Visible="false">

        <table class="table table-bordered">
            <caption>
                <a href="#">Markaya Göre</a>
                <tr>
                    <th>
                        <td>Ürün Adı</td>
                        <td>Ürünün Resmi</td>
                        <td>Fiyatı</td>
                        <td>Özellik</td>
                        <td>Stok</td>
                        <td>Güncelle</td>
                        <td>Ürünü Sil</td>
                    </th>
                    <% 
                urunislemleri urunislem = new urunislemleri();
                System.Data.DataTable uruntablo = new System.Data.DataTable();
                uruntablo = urunislem.markalist(Convert.ToInt16(DropDownList3.SelectedValue));
                
                    %><%
                     
                   
                for (int i = 0; i < uruntablo.Rows.Count; i++)
                {
                    %>
                    <tr>
                        <td></td>
                        <td><%=uruntablo.Rows[i]["urnadi"] %></td>
                        <td><%=uruntablo.Rows[i]["urnresim"] %></td>
                        <td><%=uruntablo.Rows[i]["urnfiyati"] %></td>
                        <td><%=uruntablo.Rows[i]["urnozellik"] %></td>
                        <td><%=uruntablo.Rows[i]["urnstok"] %></td>
                        <td><a href="urunincele.aspx?gncl=<%=uruntablo.Rows[i][0]%>">
                            <img src="../images/guncel.png" />
                            </a></td>
                        <td><a href="urunlistele.aspx?urunsil=<%=uruntablo.Rows[i][0]%>"></a>
                            <img src="../images/sil.jpg" />
                        </td>
                    </tr>
                    <% } 
                 %>
                </tr>
            </caption>
    </asp:Panel>
    <asp:Panel ID="kmpny" runat="server" Visible="false">

         <table class="table table-bordered">
             <caption>
                 <a href="#">Kampanyaya Göre</a>
                 <tr>
                     <th>
                         <td>Ürün Adı</td>
                         <td>Ürünün Resmi</td>
                         <td>Fiyatı</td>
                         <td>Özellik</td>
                         <td>Stok</td>
                         <td>Güncelle</td>
                         <td>Ürünü Sil</td>
                     </th>
                     <% 
                urunislemleri urunislem = new urunislemleri();
                System.Data.DataTable uruntablo = new System.Data.DataTable();
                uruntablo = urunislem.kampanyalist(Convert.ToInt16(DropDownList4.SelectedValue));
                
                    %><%
                        
                   
                for (int i = 0; i < uruntablo.Rows.Count; i++)
                {
                    %>
                     <tr>
                         <td></td>
                         <td><%=uruntablo.Rows[i]["urnadi"] %></td>
                         <td><%=uruntablo.Rows[i]["urnresim"] %></td>
                         <td><%=uruntablo.Rows[i]["urnfiyati"] %></td>
                         <td><%=uruntablo.Rows[i]["urnozellik"] %></td>
                         <td><%=uruntablo.Rows[i]["urnstok"] %></td>
                         <td><a href="urunincele.aspx?gncl=<%=uruntablo.Rows[i][0]%>">
                             <img src="../images/guncel.png" />
                             </a></td>
                         <td><a href="urunlistele.aspx?urunsil=<%=uruntablo.Rows[i][0]%>"></a>
                             <img src="../images/sil.jpg" />
                         </td>
                     </tr>
                     <% } 
                 %>
                 </tr>
             </caption>
    </asp:Panel>
     

</asp:Content>

