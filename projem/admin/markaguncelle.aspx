<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="markaguncelle.aspx.cs" Inherits="admin_markaguncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="table table-bordered">
        <th><td><h3>Marka Güncelleme</h3></td></th>
        <tr><td>
            <asp:Label ID="Label1" runat="server" Text="Marka Adı: "></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Bu Alan Boş Geçilemez." ValidationGroup="Vmarka" ForeColor="Red"></asp:RequiredFieldValidator>
            </td></tr>
        <tr><td>Marka resmi</td>
            <td>
                <asp:Image ID="Image1" runat="server" Width="150px" Height="150px"/><asp:FileUpload ID="FileUpload1" runat="server" /></td>
           </tr>
        <tr><td></td><td><asp:Button ID="Button1" runat="server" Text="Güncelle" OnClick="Button1_Click" CssClass="btn btn-success" ValidationGroup="Vmarka" /> &nbsp;<asp:Button ID="Button2" runat="server" Text="Vazgeç" CssClass="btn btn-danger" OnClick="Button2_Click" /></td> </tr>
    </table>





   <!-- <table class="table table-bordered" style="border:solid; border-color:aqua">
              <% int i = Convert.ToInt16(Request.QueryString["markagncl"]);
                markaislem markaislem = new markaislem();
                System.Data.DataTable markatablo = new System.Data.DataTable();
                markatablo = markaislem.markayibul(i);
                
                    %>
       <th><h3>Marka </h3></th>

        <%
            %>
           <tr><td>
               <%=markatablo.Rows[0]["markaadi"] %>  </td>
               

           </tr>

              
        
        

    </table>-->
</asp:Content>

