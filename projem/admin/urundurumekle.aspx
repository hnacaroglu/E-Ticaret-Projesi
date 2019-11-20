<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="urundurumekle.aspx.cs" Inherits="admin_urundurumekle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 276px;
        }
        .auto-style2 {
            width: 309px;
        }
        .auto-style3 {
            width: 110px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:850px; height:auto; margin:auto">
    <table class="table table-bordered">
        <tr style="text-align:center">
           <td class="auto-style1"><th><h3>Ürün Durum Kategorisi Ekleme</h3></th></td> 
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label1" runat="server" Text="Durum Adı: "></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vdurum"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Kaydet" OnClick="Button1_Click"  CssClass="btn btn-success" ValidationGroup="Vdurum"/></td>
        </tr>
    </table>
     <table class="table table-bordered" style="border:solid; border-color:aqua">
              <% 
                  urundurum durumislem = new urundurum();
                System.Data.DataTable drmtablo = new System.Data.DataTable();
                drmtablo = durumislem.kampanyalist();
                
                    %>
       <th class="auto-style2"><h3>Mevcut Ürün Durumları</h3></th><th class="auto-style3">Güncelle</th><th>Sil</th>

        <%for (int i = 0; i < drmtablo.Rows.Count; i++)
          {%>
           <tr><td class="auto-style2">
               <%=drmtablo.Rows[i]["urndurumadi"] %>  </td>
                <td class="auto-style3"><a href="urundurumguncelle.aspx?kampgncl=<%=drmtablo.Rows[i][0]%>"> <img style="width:25px; height:25px;" src="../images/guncelle.png" /></a>&nbsp;
                    &nbsp;
               </td>
               <td>
                   <%System.Data.DataTable urundurum = new System.Data.DataTable();
                     urunislemleri durumu = new urunislemleri();
                     urundurum = durumu.kampanyalist(Convert.ToInt16(drmtablo.Rows[i][0]));


                     if (Convert.ToInt16(urundurum.Rows.Count)==0)
                     { %>
                         <a href="urundurumekle.aspx?kampsil=<%=drmtablo.Rows[i][0]%>" onclick="return window.confirm('Gerçekten bu alanı silmek istediğinize emin misiniz?');"><img style="width:25px; height:25px;" src="../images/silme.png" />

                 

                    <%  }   %>
                   
                   

                   <%  
                     else
                     {%> <a href="#" onclick="return window.confirm('DİKKAT: Bu alana bağlı mevcut ürünler site anasayfasında görüntülenmektedir.Bu alanı silmek hataya sebep olacağından bu işlem gerçekleştirelemez. Lütfen önce bağlı ürünleri siliniz.');"><img style="width:25px; height:25px;" src="../images/silme.png" />
                        
                   <%   }
                       
                      %>

                 </td>

           </tr>

              
          <%} %>
        

    </table>
</div>
</asp:Content>

