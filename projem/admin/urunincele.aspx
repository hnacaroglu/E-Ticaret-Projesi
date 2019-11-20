<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="urunincele.aspx.cs" Inherits="admin_urunincele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table class="table table-bordered" style="float:right">
        
        <tr><th><h3>Ürün Güncelleme</h3></th></tr><tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Ana Kategorisi: "></asp:Label></td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="gnclanakatlist" DataTextField="anakatadi" DataValueField="anakatid">
                </asp:DropDownList>
              
                <asp:SqlDataSource ID="gnclanakatlist" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_anakategori]"></asp:SqlDataSource>
              
            </td>
        </tr>
        <tr>
            <td> <asp:Label ID="Label2" runat="server" Text="Alt Kategorisi: "></asp:Label></td>
            <td>
                  <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="guncelaltklist" DataTextField="altkategoriadi" DataValueField="altkategoriid" >
                </asp:DropDownList>
                  <asp:SqlDataSource ID="guncelaltklist" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_altkategori] WHERE ([anakatno] = @anakatno)">
                      <SelectParameters>
                          <asp:ControlParameter ControlID="DropDownList1" Name="anakatno" PropertyName="SelectedValue" Type="Int32" />
                      </SelectParameters>
                  </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td> <asp:Label ID="Label3" runat="server" Text="Markası: "></asp:Label></td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="guncelmarkalist" DataTextField="markaadi" DataValueField="markaid">
                </asp:DropDownList>
                <asp:SqlDataSource ID="guncelmarkalist" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_marka]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td> <asp:Label ID="Label4" runat="server" Text="Kampanya Durumu: "></asp:Label></td>
            <td>
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="guncelkamplist" DataTextField="urndurumadi" DataValueField="urndurumid">
                </asp:DropDownList>
                <asp:SqlDataSource ID="guncelkamplist" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_urundurum]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td> <asp:Label ID="Label5" runat="server" Text="Adı:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="* Bu Alan Boş Geçilemez..." ForeColor="Red" ValidationGroup="Vurun"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td> <asp:Label ID="Label6" runat="server" Text="Kısa Özellik: "></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox6" ErrorMessage="* Bu Alan Boş Geçilemez..." ForeColor="Red" ValidationGroup="Vurun"></asp:RequiredFieldValidator>
            </td>
        </tr>
          <tr>
            <td> <asp:Label ID="Label13" runat="server" Text="Detaylı Bilgi:  "></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4" ErrorMessage="* Bu Alan Boş Geçilemez..." ForeColor="Red" ValidationGroup="Vurun"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td> <asp:Label ID="Label7" runat="server" Text="Fiyatı: "></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox7" ErrorMessage="* Bu Alan Boş Geçilemez..." ForeColor="Red" ValidationGroup="Vurun"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td> <asp:Label ID="Label8" runat="server" Text="Stok Adedi: "></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox8" ErrorMessage="* Bu Alan Boş Geçilemez..." ForeColor="Red" ValidationGroup="Vurun"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td> <asp:Label ID="Label9" runat="server" Text="Resim: "></asp:Label></td>
            <td>
                <asp:Image style="width:120px; height:120px" ID="Image1" runat="server" />
            &nbsp;&nbsp;
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
         <tr>
            <td> <asp:Label ID="Label10" runat="server" Text="2. Resim: "></asp:Label></td>
            <td>
                <asp:Image style="width:120px; height:120px"  ID="Image2" runat="server" />
            &nbsp;&nbsp;
                <asp:FileUpload ID="FileUpload2" runat="server" /></td></tr>
         <tr>
            <td> <asp:Label ID="Label11" runat="server" Text="3. Resim: "></asp:Label></td>
            <td>
                <asp:Image style="width:120px; height:120px"  ID="Image3" runat="server" />
            &nbsp;&nbsp;
                <asp:FileUpload ID="FileUpload3" runat="server" /></td></tr>
         <tr>
            <td> <asp:Label ID="Label12" runat="server" Text="4. Resim: "></asp:Label></td>
            <td>
                <asp:Image style="width:120px; height:120px"  ID="Image4" runat="server" />
            &nbsp;&nbsp;
                <asp:FileUpload ID="FileUpload4" runat="server" /></td></tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Güncelle" OnClick="Button1_Click" CssClass="btn btn-success" ValidationGroup="Vurun" />&nbsp;<asp:Button ID="Button2" runat="server" Text="Vazgeç" CssClass="btn btn-warning" OnClick="Button2_Click" />
            </td>
        </tr>
    </table>
    
</asp:Content>

