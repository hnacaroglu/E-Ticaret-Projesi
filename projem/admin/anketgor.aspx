<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="anketgor.aspx.cs" Inherits="anketgor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <table class="table table-hover">
        <tr>
            <th><h3>Tüm Anketler</h3> <th class="auto-style2"><h3>Seçenekler</h3> </th><th></th><th></th><th></th><th>Güncelle</th><th>Sil</th></th>
            
        </tr>
 <%
                    anavt anketgor = new anavt();
                    System.Data.DataTable anketler = new System.Data.DataTable();
                    anketgor.ac();
                    System.Data.SqlClient.SqlCommand anketlerim = new System.Data.SqlClient.SqlCommand("select * from tbl_anket", anketgor.baglanti);
                    System.Data.SqlClient.SqlDataAdapter anketdata = new System.Data.SqlClient.SqlDataAdapter(anketlerim);
                    anketdata.Fill(anketler);
                    anketgor.kapat();
                    
                     %>

        <%for (int i = 0; i < anketler.Rows.Count; i++)
                 {%>
                <tr >

                    <%  if (Convert.ToInt16(anketler.Rows[i][6])==1)
                     {%>

              <td style="background-color:#b3f60c; color:white;"> <%=anketler.Rows[i][1].ToString() %> </td>
              <td style="background-color:#b3f60c; color:white;"> <%=anketler.Rows[i][2].ToString() %> </td>   
              <td style="background-color:#b3f60c; color:white;"> <%=anketler.Rows[i][3].ToString() %> </td>   
              <td style="background-color:#b3f60c; color:white;"> <%=anketler.Rows[i][4].ToString() %> </td>   
              <td style="background-color:#b3f60c; color:white;"> <%=anketler.Rows[i][5].ToString() %> </td> 

                    <% }
                                else
                            {%>
                         
              <td style="background-color:#fa2a2a; color:white;"> <%=anketler.Rows[i][1].ToString() %> </td>
              <td style="background-color:#fa2a2a; color:white;"> <%=anketler.Rows[i][2].ToString() %> </td>   
              <td style="background-color:#fa2a2a; color:white;"> <%=anketler.Rows[i][3].ToString() %> </td>   
              <td style="background-color:#fa2a2a; color:white;"> <%=anketler.Rows[i][4].ToString() %> </td>   
              <td style="background-color:#fa2a2a; color:white;"> <%=anketler.Rows[i][5].ToString() %> </td> 
                   <%   
                   
                   } %>

       
            
            


             
                 <td><a href="anketguncelle.aspx?anket=<%=anketler.Rows[i][0]%>"><img style="width:25px; height:25px" src="../images/guncelle.png" /></a></td> 

                    <%int anktvar = Convert.ToInt16(Session["yayindaki"]); %>

                    <%if (Convert.ToInt16(anketler.Rows[i][6])==1)
                      {%>

          <td><a href="#" onclick="return window.confirm('DİKKAT: Bu anket yayında...Site anasayfasında yayında bulunan bir anket silinemez.Silme işlemini gerçekleştirmek için lütfen önce yayındaki anketi değiştirin.');"><img style="width:25px; height:25px" src="../images/silme.png" /></a></td> 
                          
                     <% }

                      else
                      {%>

                     <td><a href="anketgor.aspx?anketsil=<%=anketler.Rows[i][0]%>" onclick="return window.confirm('Gerçekten bu anketi silmek istediğinize emin misiniz?');"><img style="width:25px; height:25px" src="../images/silme.png" /></a></td> 
                            
                     <% } %>
                
          
                     </tr>
        

                <% } %><tr><td><h5>NOT: Yayında bulunan anket yeşil renk ile gösterilmektedir.</h5></td></tr>
            


        

    </table>


</asp:Content>

