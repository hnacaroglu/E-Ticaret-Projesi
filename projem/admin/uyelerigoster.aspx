<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="uyelerigoster.aspx.cs" Inherits="uyelerigoster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div style="margin-left:auto; margin-top:50px;">
    <table class="table table-hover" style="border:solid; float:right">
            
        <tr class="success  ">
            <td style="border:solid">Üye Adı </td>
            <td style="border:solid">Üye Soyadı</td>
            <td style="border:solid">Kullanıcı Adı</td>
            <td style="border:solid">Mail Adresi</td>
            <td style="border:solid">Onay Durumu</td>
            <td style="border:solid">Üyeyi İncele</td>
                <td style="border:solid">Üyeyi Onayla</td>
             <td style="border:solid">Üyeyi Sil</td>
            
        </tr>
        <% uyekayitislemleri goster = new uyekayitislemleri();
           System.Data.DataTable tbl_uye = new System.Data.DataTable();

           tbl_uye = goster.uyelistele();
           for (int i = 0; i < tbl_uye.Rows.Count; i++)
           {
               
             %>
               <tr>
                   
                   <td style="border:solid"><%Response.Write(tbl_uye.Rows[i][1]); %></td>
                   <td style="border:solid"><%Response.Write(tbl_uye.Rows[i][2]); %></td>
                   <td style="border:solid"><%Response.Write(tbl_uye.Rows[i][3]); %></td>
                   <td style="border:solid"><%Response.Write(tbl_uye.Rows[i][6]); %></td>
                   <%if (Convert.ToInt16(tbl_uye.Rows[i][9])==1)
                     {%>
                         <td style="border:solid; background-color:#6bfc2d"><%Response.Write(tbl_uye.Rows[i][9]); %></td>
                     <%}

                     else
                     { %>
                          <td style="border:solid; background-color:#fe1717"><%Response.Write(tbl_uye.Rows[i][9]); %></td>
                   <%  }%> 
                   
                   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="uyeincele.aspx?prm1=<%=tbl_uye.Rows[i][0]%>"><img style="width:25px; height:25px;" src="../images/incele.png" /></a></td>
                   <td>&nbsp;&nbsp;&nbsp; <a href="uyelerigoster.aspx?onayla=<%=tbl_uye.Rows[i][0]%>"><img style="width:25px; height:25px;" src="../images/onayla.png" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <a href="uyelerigoster.aspx?onaylama=<%=tbl_uye.Rows[i][0]%>"><img style="width:25px; height:25px;" src="../images/delete-icon.png" />
                   </td>
                   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="uyelerigoster.aspx?sil1=<%=tbl_uye.Rows[i][0]%>" onclick="return window.confirm('Bu üyeyi silmek istediğinize emin misiniz?');"><img style="width:25px; height:25px;" src="../images/silme.png" /></a></td>
                  
               </tr>
        


          <% }  %> 
        
    <!--emailclass onaymail = new emailclass();
                     int onay=Convert.ToInt16(Request.QueryString["onayla"]);
                     if (Convert.ToInt16(tbl_uye.Rows[Convert.ToInt16(Request.QueryString["onayla"])][9]) == 1)
                     {
                         
                         string onaymsj="Sayın, " + tbl_uye.Rows[onay][1].ToString() + " " + tbl_uye.Rows[onay][2].ToString() + " ; " + "NacarShop alışveriş sitesi üyeliğiniz onaylanmıştır. http://www.bnmyenisitem.somee.com  adresinden siteyi ziyaret edebilir, kullanıcı adı ve şifre bilgileriniz ile giriş yaparak alışverişinize hemen başlayabilirsiniz....... İyi Alışverişler Dileriz....." ;
                           
                         string onaymailadresi= tbl_uye.Rows[onay][6].ToString();

                         onaymail.gonder("NacarShop Üyelik Onayı", onaymsj, "hikmetnacaroglu@gmail.com");
                     }
                         
                    -->

    </table>
        </div>
</asp:Content>

