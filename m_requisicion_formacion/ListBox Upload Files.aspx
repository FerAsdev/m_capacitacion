<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListBox Upload Files.aspx.cs" Inherits="m_requisicion_formacion.ListBox_Upload_Files" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script>
        function hola() {
            alert('Hola mundo');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="Fichero" runat="server" /><br />
            <asp:ListBox ID="ListFile" runat="server" Width="300px"/><br />
            <asp:Button ID="BtnAdd" runat="server" Text="Agregar" OnClick="AgregarFile" CausesValidation="false" />
            <asp:Button ID="BtnQuit" runat="server" Text="Quitar" style="margin-left:15px"  Width="67px" OnClick="QuitarFile" CausesValidation="false"/>
        </div>
    </form>
</body>
</html>
