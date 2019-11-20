<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="anketyayinla.aspx.cs" Inherits="anketyayinla" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:800px; height:auto; margin:auto">
    <table class="table table-bordered">
        <tr>
        <th><h3>Anket Yayınlama</h3></th> </tr>
           <tr><th>Yayındaki Anket</th>
               <th>Yayınlanacak Anket</th>
           </tr> 
       
        <tr>
            <td> <% anavt anketgor = new anavt();
                    System.Data.DataTable yanketler = new System.Data.DataTable();
                    anketgor.ac();
                    System.Data.SqlClient.SqlCommand yanketlerim = new System.Data.SqlClient.SqlCommand("select * from tbl_anket where durum=1", anketgor.baglanti);
                    System.Data.SqlClient.SqlDataAdapter yanketdata = new System.Data.SqlClient.SqlDataAdapter(yanketlerim);
                    yanketdata.Fill(yanketler);
                    anketgor.kapat();

                    Session["yayindaki"] = Convert.ToInt16(yanketler.Rows[0][6]);
                    %>


<%= yanketler.Rows[0][1].ToString()%>

               
                    </td>
            <td>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="anket" DataTextField="soru" DataValueField="sirano"></asp:DropDownList>
            <asp:SqlDataSource ID="anket" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT [sirano], [durum], [soru] FROM [tbl_anket]"></asp:SqlDataSource>
            </td><td>
                <asp:Button ID="Button1" runat="server" Text="Yayınla" OnClick="Button1_Click"  CssClass="btn btn-success"/></td></tr>
    </table>

</div>
</asp:Content>

