<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_tipo_requisicion.aspx.cs" Inherits="m_requisicion_formacion.m_tipo_requisicion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Tipo Capacitación</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:DropDownList ID="tipoRequisicion" runat="server">
            <asp:ListItem Text="Interna" />
            <asp:ListItem Text="Externa" />            
        </asp:DropDownList><br />
        <asp:Button ID="Button1" runat="server" Text="Continuar" OnClick="Button1_Click"/>
    </div>
    </form>
</body>
</html>
