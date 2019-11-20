<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="anakatekle.aspx.cs" Inherits="anakatekle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 176px;
        }
        .auto-style3 {
            width: 146px;
        }
        .auto-style4 {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <table class="table table-bordered">
        <th style="text-align:center" class="auto-style3">
          <h2> Ana Kategori Ekleme</h2>
            
        </th>
     
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label1" runat="server" Text="Ana Kategori Adı: "></asp:Label></td>
            <td class="auto-style2">
                <asp:TextBox ID="TextBox1" runat="server" CssClass=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Bu Alan Boş Geçilemez..." ForeColor="Red" ValidationGroup="Vana"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style2">
                <asp:Button ID="Button1" runat="server" Text="Kaydet" OnClick="Button1_Click" CssClass="btn btn-success" ValidationGroup="Vana" /></td>
        </tr>
    </table>
        <table class="table table-bordered" style="border:solid; border-color:aqua">
              <% 
                  kategoriislem anakatislem = new kategoriislem();
                System.Data.DataTable anatablo = new System.Data.DataTable();
                anatablo = anakatislem.anakatlist();
                
                    %>
       <th><h3>Mevcut Kategoriler</h3></th>
           <th><h4>Güncelle</h4></th>
          <th><h4>Sil</h4></th>
     
        <%for (int i = 0; i < anatablo.Rows.Count; i++)
          {%>
           <tr><td>
               <%=anatablo.Rows[i]["anakatadi"] %>  </td>
                <td><a href="anakatguncelle.aspx?anakatgncl=<%=anatablo.Rows[i][0]%>"> <img style="width:25px; height:25px;" src="../images/guncelle.png" /></a>&nbsp;
                    &nbsp;
               </td>

               <%
              System.Data.DataTable urunvarmi = new System.Data.DataTable();
              urunislemleri bagliurun = new urunislemleri();
              urunvarmi = bagliurun.anakatlist(Convert.ToInt16(anatablo.Rows[i][0]));

              if (Convert.ToInt16(urunvarmi.Rows.Count)==0)
               { %>

                  
               
               <%  
                   System.Data.DataTable altkatvarmi = new System.Data.DataTable();
                   kategoriler katvarmi = new kategoriler();
                   altkatvarmi = katvarmi.altmenucek(Convert.ToInt16(anatablo.Rows[i][0]));
                   
                   if (Convert.ToInt16(altkatvarmi.Rows.Count)==0)
                   {%>

<td><a href="anakatekle.aspx?anakatsil=<%=anatablo.Rows[i][0]%>"  onclick="return window.confirm('Gerçekten bu Ana kategoriyi silmek istediğinize emin misiniz?');"><img style="width:25px; height:25px;" src="../images/silme.png" /></td>
                       
                  <%} %> 
                 
              
              <%else
                   {%>
                         <td><a href="#"  onclick="return window.confirm('Bu Ana kategoriye ait ürünler ve alt kategoriler mevcut olduğu için silme işlemi gerçekleşemez. Lütfen önce bu ürünler ve alt kategorileri siliniz... ');"><img style="width:25px; height:25px;" src="../images/silme.png" /></td>
                 <%  } %>
             

               
                  
             <% }  %>
               
            <% else
              {%>

               <td><a href="#"  onclick="return window.confirm('Bu Ana kategoriye ait ürünler ve alt kategoriler mevcut olduğu için silme işlemi gerçekleşemez. Lütfen önce bu ürünler ve alt kategorileri siliniz... ');"><img style="width:25px; height:25px;" src="../images/silme.png" /></td>
                  
           <%   } %>


           </tr>

              
          <%} %>
        

    </table>


   

    
</asp:Content>

