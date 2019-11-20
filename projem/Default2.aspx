

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:Button ID="Button1" runat="server" Text="Buraya Tıkla" OnClick="Button1_Click" />
         <asp:Panel ID="Panel1" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Birşeyler yanlış gitti"></asp:Label>
            <br />
            <asp:Button ID="Button2" runat="server" Text="Okey" OnClick="Button2_Click" /> <asp:Button ID="Button3" runat="server" Text="İptal" />
               
            </asp:Panel>
        <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Button1" PopupControlID="Panel1"></asp:ModalPopupExtender>

    </div>
    </form>
</body>
</html>
