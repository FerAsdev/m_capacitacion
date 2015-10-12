<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListBox Upload Files.aspx.cs" Inherits="m_requisicion_formacion.ListBox_Upload_Files" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:FileUpload ID="FileUpload1" runat="server" Height="19px" Width="312px" />
        <br />
        <br />
    
    </div>
        <asp:ListBox ID="ListBox1" runat="server" Height="100px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="204px"></asp:ListBox>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Agregar" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" style="margin-left: 15px" Text="Eliminar" OnClick="Button2_Click" />
        </p>
    </form>
</body>
</html>
