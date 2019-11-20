<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ankethazirla.aspx.cs" Inherits="ankethazirla" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <table class="table table-bordered">
        <th><td><h3>Anket Hazırlama</h3></td></th>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Anket Sorusu: "></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vanket"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td> <asp:Label ID="Label2" runat="server" Text="A Seçeneği:"></asp:Label></td>
            <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vanket"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td> <asp:Label ID="Label3" runat="server" Text="B Seçeneği:"></asp:Label></td>
            <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vanket"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td> <asp:Label ID="Label4" runat="server" Text="C Seçeneği:"></asp:Label></td>
            <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vanket"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td> <asp:Label ID="Label5" runat="server" Text="D Seçeneği:"></asp:Label></td>
            <td><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vanket"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Kaydet" CssClass="btn btn-success" OnClick="Button1_Click" ValidationGroup="Vanket" /></td>
        </tr>
    </table>
     <table class="table table-hover">
        <tr>
            <th><h3>Tüm Anketler</h3> <th class="auto-style1"><h3>Seçenekler</h3> </th><th></th><th></th><th></th><th>Güncelle</th><th>Sil</th></th>
            
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
             <tr><td>
                <%=anketler.Rows[i][1].ToString() %> </td>
              
              <td class="auto-style1"> <%=anketler.Rows[i][2].ToString() %></td>   
              <td> <%=anketler.Rows[i][3].ToString() %></td>   
              <td> <%=anketler.Rows[i][4].ToString() %></td>   
              <td> <%=anketler.Rows[i][5].ToString() %></td>  
                 <td><a href="anketguncelle.aspx?anket=<%=anketler.Rows[i][0]%>"><img style="width:25px; height:25px" src="../images/guncelle.png" /></a></td> 


                  <%if (Convert.ToInt16(anketler.Rows[i][6])==1)
                      {%>

          <td><a href="#" onclick="return window.confirm('DİKKAT: Bu anket yayında...Site anasayfasında yayında bulunan bir anket silinemez.Silme işlemini gerçekleştirmek için lütfen önce yayındaki anketi değiştirin.');"><img style="width:25px; height:25px" src="../images/delete-icon.png" /></a></td> 
                          
                     <% }

                      else
                      {%>

                     <td><a href="anketgor.aspx?anketsil=<%=anketler.Rows[i][0]%>" onclick="return window.confirm('Gerçekten bu anketi silmek istediğinize emin misiniz?');"><img style="width:25px; height:25px" src="../images/delete-icon.png" /></a></td> 
                            
                     <% } %>
                
                <!-- <td><a href="ankethazirla.aspx?anketsil=<%=anketler.Rows[i][0]%>"><img style="width:25px; height:25px" src="../images/delete-icon.png" /></a></td> -->
           </tr>

                <% } %>
            


        

    </table>


</asp:Content>

