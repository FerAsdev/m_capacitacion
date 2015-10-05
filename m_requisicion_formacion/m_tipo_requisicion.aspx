<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_tipo_requisicion.aspx.cs" Inherits="m_requisicion_formacion.m_tipo_requisicion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Tipo Capacitación</title>
    <link href="CSS/intranet_estilo.css" rel="stylesheet" />
</head>
<body>
    <div id="encabezado">
        <div id="logo"></div>
        <div id="relleno"></div>
    </div>
    <div id="contenedor">
        <form id="form1" runat="server">
            <div id="menu" style="width: 250px; height: 370px;"></div>
            <div id="modulo" style="margin:0 auto">
                                <center>
                <h1>Requisición de capacitación.</h1>

                <asp:DropDownList ID="tipoRequisicion" runat="server" CssClass="combobox">
                    <asp:ListItem Text="-Seleccione Tipo de Requisicion-" />
                    <asp:ListItem Text="Interna" />
                    <asp:ListItem Text="Externa" />
                </asp:DropDownList><br /><br />
                <asp:Button ID="Button1" runat="server" Text="Continuar" OnClick="Button1_Click" CssClass="botonformulario" />
                    </center>
            </div>
        </form>
    </div>
    <div id="pie">
        <img src="imagenes/inferior.png" width="1024" height="100" />
    </div>
</body>
</html>
