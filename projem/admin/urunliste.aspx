<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="urunliste.aspx.cs" Inherits="urunliste" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div style="width:auto; height:auto; margin:auto; float:right">

    <table class="nav-justified" style="margin:auto">
        <tr>
                <th>
                    <td>
                        <h3 style="background-color:#ff6a00; padding:8px">Tüm Ürünleri Listele</h3>
                        <asp:Button ID="Button1" runat="server" Text="Tüm Ürünleri Gör" OnClick="Button1_Click"  CssClass="btn btn-success" Height="53px" Width="181px"/>
                    </td>
                    <td >
                        <h3 style="background-color:#46afd1; padding:8px">Ana Kategoriye Göre Listele</h3>
                       
                            &nbsp;&nbsp;
                       
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="anaurun" DataTextField="anakatadi" DataValueField="anakatid" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">Lütfen Seçiniz...</asp:ListItem>
                        </asp:DropDownList>
                            <asp:SqlDataSource ID="anaurun" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_anakategori]"></asp:SqlDataSource>
              
                    </td>
                    <td>
                        <h3 style="background-color:#4cff00; padding:8px">Alt Kategoriye Göre Listele</h3>
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="altkategori" DataTextField="altkategoriadi" DataValueField="altkategoriid" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged1" >
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="altkategori" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT [altkategoriadi], [altkategoriid], [anakatno] FROM [tbl_altkategori] WHERE ([anakatno] = @anakatno)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="anakatno" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <h3 style="background-color:#f61818; padding:8px">Markaya Göre Listele</h3>
                        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="markakat" DataTextField="markaadi" DataValueField="markaid" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">Lütfen Seçiniz...</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="markakat" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_marka]"></asp:SqlDataSource>
                    </td>
                    <td>
                        <h3 style="background-color:#cb63ee; padding:8px">Kampanyalı Ürünlere Göre</h3>
                        <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="kampkategori" DataTextField="urndurumadi" DataValueField="urndurumid" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">Lütfen Seçiniz...</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="kampkategori" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_urundurum]"></asp:SqlDataSource>
                    </td>
                </th> 
                </tr></table>
    
       
                     <asp:Panel ID="Tumurunpanel" runat="server" Visible="false">
                       <th ><h2 style="background-color:#ff6a00; padding:8px; border:solid; border-color:white">Tüm Ürünler Listeleniyor</h2></th>
                       <% 
                urunislemleri urunislem = new urunislemleri();
                System.Data.DataTable uruntablo = new System.Data.DataTable();
                uruntablo = urunislem.urunlistele();
                
                
                    %>
                          <table class="table table-bordered">
             <caption>
            
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
                      
        
                      
               
                for (int i = 0; i < uruntablo.Rows.Count; i++)
                {
                    %>
                         
                     <tr >
                         <th></th>
                         <td><%=uruntablo.Rows[i]["urnadi"] %></td>
                         <td><img style="width:100px; height:100px" src="../urunresmi/<%=uruntablo.Rows[i]["urnresim"] %> "/></td>
                         <td><%=uruntablo.Rows[i]["urnfiyati"] %></td>
                         <td><%=uruntablo.Rows[i]["urnozellik"] %></td>
                         <td><%=uruntablo.Rows[i]["urnstok"] %></td>
                         <td><a href="urunincele.aspx?gncl=<%=uruntablo.Rows[i][0]%>">
                             <img style="width:25px; height:25px" src="../images/guncelle.png" />
                             </a></td>
                         <td><a href="urunliste.aspx?urunsil=<%=uruntablo.Rows[i][0]%>" onclick="return window.confirm('Bu ürünü silmek istediğinize emin misiniz?');">
                             <img style="width:25px; height:25px" src="../images/silme.png" /></a>
                         </td>
                     </tr>
                     <%  }
                 %>
                 </tr>
             </caption></asp:Panel>

                     <asp:Panel ID="Anakatpanel" runat="server" Visible="false">
                         <th><h2 style="background-color:#46afd1; padding:8px; border:solid; border-color:white"><%=DropDownList1.SelectedItem.ToString() %> Kategorisindeki ÜrünlerListeleniyor</h2></th>
                     <% 
                         urunislemleri urunislem = new urunislemleri();
                         System.Data.DataTable uruntablo = new System.Data.DataTable();
                         uruntablo = urunislem.anakatlist(Convert.ToInt16(DropDownList1.SelectedValue));
                
                    %>
                   
                       <table class="table table-bordered">
             <caption>
            
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
        
             
              <%    for (int i = 0; i < uruntablo.Rows.Count; i++)
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
                             <img style="width:25px; height:25px" src="../images/guncelle.png" />
                             </a></td>
                         <td><a href="urunliste.aspx?urunsil=<%=uruntablo.Rows[i][0]%>" onclick="return window.confirm('Bu ürünü silmek istediğinize emin misiniz?');">
                             <img style="width:25px; height:25px" src="../images/silme.png" /></a>
                         </td>
                     </tr>
                     <%  }
                 %>
                 </tr>
             </caption>
   
    </asp:Panel>
            <asp:Panel ID="Altkatpanel" runat="server" Visible="false">
                <th><h2 style="background-color:#4cff00; padding:8px; border:solid; border-color:white"><%=DropDownList2.SelectedItem.ToString() %> Alt Kategorisindeki Ürünler Listeleniyor</h2></th>
        <% 
                urunislemleri urunisle = new urunislemleri();
                System.Data.DataTable uruntablom = new System.Data.DataTable();
                uruntablom = urunisle.altkatlist(Convert.ToInt16(DropDownList2.SelectedValue));
                
                    %>
                
                 <table class="table table-bordered">
             <caption>
            
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
                        
                   
                for (int i = 0; i < uruntablom.Rows.Count; i++)
                {
                    %>
                      <tr>
                          <td></td>
                          <td><%=uruntablom.Rows[i]["urnadi"] %></td>
                          <td><img style="width:100px; height:100px" src="../urunresmi/<%=uruntablom.Rows[i]["urnresim"] %> "/></td>
                          <td><%=uruntablom.Rows[i]["urnfiyati"] %></td>
                          <td><%=uruntablom.Rows[i]["urnozellik"] %></td>
                          <td><%=uruntablom.Rows[i]["urnstok"] %></td>
                          <td><a href="urunincele.aspx?gncl=<%=uruntablom.Rows[i][0]%>">
                              <img style="width:25px; height:25px" src="../images/guncelle.png" />
                              </a></td>
                          <td><a href="urunliste.aspx?urunsil=<%=uruntablom.Rows[i][0]%>" onclick="return window.confirm('Bu ürünü silmek istediğinize emin misiniz?');"></a>
                              <img style="width:25px; height:25px" src="../images/silme.png" />
                          </td>
                      </tr>
                      <% } 
                 %>
                  </tr>
              </caption>

            </asp:Panel>

            <asp:Panel ID="Markapanel" runat="server" Visible="false">
                <th><h2 style="background-color:#f61818; padding:8px; border:solid; border-color:white"><%=DropDownList3.SelectedItem.ToString() %> Markalı Ürünler Listeleniyor</h2></th>
              <% 
                urunislemleri urunislem = new urunislemleri();
                System.Data.DataTable uruntablo = new System.Data.DataTable();
                uruntablo = urunislem.markalist(Convert.ToInt16(DropDownList3.SelectedValue));
                
                    %>
                 <table class="table table-bordered">
             <caption>
            
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
                     
                   
                for (int i = 0; i < uruntablo.Rows.Count; i++)
                {
                    %>
                    <tr>
                        <td></td>
                        <td><%=uruntablo.Rows[i]["urnadi"] %></td>
                        <td><img style="width:100px; height:100px" src="../urunresmi/<%=uruntablo.Rows[i]["urnresim"] %>"</td>
                        <td><%=uruntablo.Rows[i]["urnfiyati"] %></td>
                        <td><%=uruntablo.Rows[i]["urnozellik"] %></td>
                        <td><%=uruntablo.Rows[i]["urnstok"] %></td>
                        <td><a href="urunincele.aspx?gncl=<%=uruntablo.Rows[i][0]%>">
                            <img style="width:25px; height:25px" src="../images/guncelle.png" />
                            </a></td>
                        <td><a href="urunliste.aspx?urunsil=<%=uruntablo.Rows[i][0]%>" onclick="return window.confirm('Bu ürünü silmek istediğinize emin misiniz?');"></a>
                            <img style="width:25px; height:25px" src="../images/silme.png" />
                        </td>
                    </tr>
                    <% } 
                 %>
                </tr>
            </caption>
    </asp:Panel>
            <asp:Panel ID="Kampanyapanel" runat="server" Visible="false">
                <th><h2 style="background-color:#cb63ee; padding:8px; border:solid; border-color:white"><%=DropDownList4.SelectedItem.ToString() %> Durumundaki Ürünler Listeleniyor</h2></th>
                  <% 
                urunislemleri urunislem = new urunislemleri();
                System.Data.DataTable uruntablo = new System.Data.DataTable();
                uruntablo = urunislem.kampanyalist(Convert.ToInt16(DropDownList4.SelectedValue));
                
                    %>
                 <table class="table table-bordered">
             <caption>
            
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
                        
                   
                for (int i = 0; i < uruntablo.Rows.Count; i++)
                {
                    %>
                     <tr>
                         <td></td>
                         <td><%=uruntablo.Rows[i]["urnadi"] %></td>
                         <td><img style="width:100px; height:100px" src="../urunresmi/<%=uruntablo.Rows[i]["urnresim"] %>"</td>
                         <td><%=uruntablo.Rows[i]["urnfiyati"] %></td>
                         <td><%=uruntablo.Rows[i]["urnozellik"] %></td>
                         <td><%=uruntablo.Rows[i]["urnstok"] %></td>
                         <td><a href="urunincele.aspx?gncl=<%=uruntablo.Rows[i][0]%>">
                             <img style="width:25px; height:25px" src="../images/guncelle.png" />
                             </a></td>
                         <td><a href="urunliste.aspx?urunsil=<%=uruntablo.Rows[i][0]%>"  onclick="return window.confirm('Bu ürünü silmek istediğinize emin misiniz?');"></a>
                             <img style="width:25px; height:25px"  src="../images/silme.png" />
                         </td>
                     </tr>
                     <% } 
                 %>
                 </tr>
             </caption>
            </asp:Panel>
        </table></div>

</asp:Content>

