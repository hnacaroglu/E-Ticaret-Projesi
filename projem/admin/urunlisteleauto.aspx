<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="urunlisteleauto.aspx.cs" Inherits="admin_urunlisteleauto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="anakatadi" DataValueField="anakatid">
    </asp:DropDownList>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT * FROM [tbl_anakategori]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="urnid" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="urnresim" HeaderText="urnresim" SortExpression="urnresim" />
            <asp:BoundField DataField="urnstok" HeaderText="urnstok" SortExpression="urnstok" />
            <asp:BoundField DataField="urnfiyati" HeaderText="urnfiyati" SortExpression="urnfiyati" />
            <asp:BoundField DataField="urnozellik" HeaderText="urnozellik" SortExpression="urnozellik" />
            <asp:BoundField DataField="urnadi" HeaderText="urnadi" SortExpression="urnadi" />
            <asp:BoundField DataField="urndurum" HeaderText="urndurum" SortExpression="urndurum" />
            <asp:BoundField DataField="urnmarka" HeaderText="urnmarka" SortExpression="urnmarka" />
            <asp:BoundField DataField="urnkategori" HeaderText="urnkategori" SortExpression="urnkategori" />
            <asp:BoundField DataField="urnid" HeaderText="urnid" InsertVisible="False" ReadOnly="True" SortExpression="urnid" />
            <asp:BoundField DataField="urnaltkategori" HeaderText="urnaltkategori" SortExpression="urnaltkategori" />

            <asp:ImageField DataImageUrlField="urnresim">
            </asp:ImageField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:sitebaglantiyolu %>" SelectCommand="SELECT [urnresim], [urnstok], [urnfiyati], [urnozellik], [urnadi], [urndurum], [urnmarka], [urnkategori], [urnid], [urnaltkategori] FROM [tbl_urunler] WHERE ([urnkategori] = @urnkategori)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="urnkategori" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>

