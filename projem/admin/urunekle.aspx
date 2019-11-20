<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="urunekle.aspx.cs" Inherits="admin_urunekle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="table table-bordered">
        <tr ><td style="text-align:center"><h2>Ürün Ekleme </h2> </td></tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Ana Kategorisi: "></asp:Label></td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="urunanakategori" DataTextField="anakatadi" DataValueField="anakatid">
                </asp:DropDownList>
                <asp:SqlDataSource ID="urunanakategori" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_anakategori]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>  <asp:Label ID="Label2" runat="server" Text="Alt Kategorisi: "></asp:Label></td>
            <td> <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="urunaltkategori" DataTextField="altkategoriadi" DataValueField="altkategoriid"></asp:DropDownList>
                <asp:SqlDataSource ID="urunaltkategori" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_altkategori] WHERE ([anakatno] = @anakatno)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="anakatno" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>  <asp:Label ID="Label3" runat="server" Text="Markası: "></asp:Label></td>
            <td> <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="urunmarka" DataTextField="markaadi" DataValueField="markaid"></asp:DropDownList>
                <asp:SqlDataSource ID="urunmarka" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_marka]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>  <asp:Label ID="Label4" runat="server" Text="Kampanya Durumu: "></asp:Label></td>
            <td> <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="urundurum" DataTextField="urndurumadi" DataValueField="urndurumid"></asp:DropDownList>
                <asp:SqlDataSource ID="urundurum" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_urundurum]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>  <asp:Label ID="Label5" runat="server" Text="Adı:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vurunekle"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>  <asp:Label ID="Label6" runat="server" Text="Kısa Özellikler: "></asp:Label></td>
            <td> <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vurunekle"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Detaylı Bilgiler: "></asp:Label></td>
              <td>
                  <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vurunekle"></asp:RequiredFieldValidator>
            </td>

        </tr>

        <tr>
            <td>  <asp:Label ID="Label7" runat="server" Text="Fiyatı: "></asp:Label></td>
            <td> <asp:TextBox ID="TextBox3" runat="server" onkeydown="return onlyNumber(event)"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vurunekle"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>  <asp:Label ID="Label8" runat="server" Text="Stok Adeti: "></asp:Label></td>
            <td> <asp:TextBox ID="TextBox4" runat="server" onkeydown="return onlyNumber(event)"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4" ErrorMessage="* Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Vurunekle"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>  <asp:Label ID="Label9" runat="server" Text="Resmi: "></asp:Label></td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" /></td>
        </tr>
        <tr>
            <td>  <asp:Label ID="Label11" runat="server" Text="2. Resim: "></asp:Label></td>
            <td>
                <asp:FileUpload ID="FileUpload2" runat="server" /></td>
        </tr>
        <tr>
            <td>  <asp:Label ID="Label12" runat="server" Text="3. Resim: "></asp:Label></td>
            <td>
                <asp:FileUpload ID="FileUpload3" runat="server" /></td>
        </tr>
        <tr>
            <td>  <asp:Label ID="Label13" runat="server" Text="4. Resim: "></asp:Label></td>
            <td>
                <asp:FileUpload ID="FileUpload4" runat="server" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Kaydet" OnClick="Button1_Click" CssClass="btn btn-success" ValidationGroup="Vurunekle"/></td>
        </tr>
    </table>

</asp:Content>

