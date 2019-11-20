<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="anketguncelle.aspx.cs" Inherits="admin_anketguncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 200px;
        }
        .auto-style2 {
            width: 420px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <table>

        <tr><th>   <h3>Anket Güncelle Sayfası</h3>  </th></tr>

       
        
    </table>
    
    <table class="table table-hover">
        <tr>
            <th class="auto-style2"><h3>Anket Sorusu</h3> <th class="auto-style1"><h3>Seçenekler</h3> </th></th>
            
        </tr>

                    
                   

       
             <tr><td> Soru:<asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="59px" Width="184px"></asp:TextBox>
                 <br />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage=" * Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vganket"></asp:RequiredFieldValidator>
                 </td>
              
              <td >A: <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                  <br />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage=" * Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vganket"></asp:RequiredFieldValidator>
                 </td>   
              <td>B: <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                  <br />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage=" * Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vganket"></asp:RequiredFieldValidator>
                 </td>   
              <td> C:<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                  <br />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage=" * Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vganket"></asp:RequiredFieldValidator>
                 </td>   
              <td>  D:<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                  <br />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage=" * Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vganket"></asp:RequiredFieldValidator>
                 </td>  
                 <td>
                     <asp:Button ID="Button1" runat="server" Text="Güncelle" OnClick="Button1_Click" ValidationGroup="Vganket" CssClass="btn btn-primary"/></td> 
                
           </tr>

           
            


        

    </table>



</asp:Content>

