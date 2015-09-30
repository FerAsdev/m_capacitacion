<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_requisicion_externa.aspx.cs" Inherits="m_requisicion_formacion.m_requisicion_externa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Requisicion Externa</title>
    <link href="CSS/intranet_estilo.css" rel="stylesheet" />
    <link href="CSS/jquery.timepicker.css" rel="stylesheet" />
</head>
<body>

    <div id="encabezado">
        <div id="logo"></div>
        <div id="relleno"></div>
    </div>
    <div id="contenedor">
        <form id="form1" runat="server">
            <div id="menu" style="width: 250px; height: 370px;"></div>
            <div id="modulo">
                <h1>Requisición externa de capacitación</h1>
                <fieldset>
                    <legend>Datos Generales Requisición Externa</legend>

                    <table>
                        <tr>
                            <td>Duración en horas</td>
                            <td>
                                <asp:TextBox ID="duracionHoras" runat="server" TextMode="Number" />
                            </td>
                        </tr>
                        <tr>
                            <td>Proveedor sugerido</td>
                            <td>
                                <asp:RadioButtonList runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="Si" Value="1" />
                                    <asp:ListItem Text="No" Value="2" Selected="True" />
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>¿Se requieren viaticos?</td>
                            <td>
                                <asp:RadioButtonList runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="Si" Value="1" />
                                    <asp:ListItem Text="No" Value="2" Selected="True" />
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>Costo aproximado</td>
                            <td>
                                <asp:TextBox ID="txtCosto" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>Numero de participantes</td>
                            <td>
                                <asp:TextBox ID="txtNumParticipantes" runat="server" TextMode="Number" />
                            </td>
                        </tr>
                        <tr>
                            <td>Modalidad</td>
                            <td>
                                <asp:DropDownList ID="dropListModalidad" runat="server" CssClass="combobox">
                                    <asp:ListItem Text="-Seleccione modalidad-" Value="0" Selected="True" />
                                    <asp:ListItem Text="Presencial" Value="1" />
                                    <asp:ListItem Text="En Linea" Value="2" />
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <br />
                <br />
                <fieldset>
                    <legend>Datos Específicos</legend>
                    <div id="divDatosEspcecificos">
                        <table>
                            <tr>
                                <td>¿Existe procedimiento o política?</td>
                                <td>
                                    <asp:RadioButtonList ID="rblPoliticas" runat="server" RepeatDirection="Horizontal" onclick="EnableDisable(this)">
                                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="2" Selected="true"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>

                            </tr>
                            <tr>
                                <td>Adjuntar archivo</td>
                                <td>
                                    <asp:FileUpload ID="fileUploadPoliticas" runat="server" disabled="disabled" />
                                </td>
                            </tr>
                            <tr>
                                <td>Participantes</td>
                                <td>
                                    <asp:DropDownList runat="server" ID="dropListParticipantes" CssClass="combobox">
                                        <asp:ListItem Text="-Seleccione Participantes-" Value="0" Selected="True" />
                                        <asp:ListItem Text="Comercial" Value="1" />
                                        <asp:ListItem Text="Staff" Value="2" />
                                        <asp:ListItem Text="Clientes" Value="3" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Especificar si se requiere material de apoyo o equipo especial. (Bocinas, Microfono, Etc...)</td>
                                <td>
                                    <asp:RadioButtonList ID="rblMaterial" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="Si" />
                                        <asp:ListItem Text="No" Selected="true" />
                                    </asp:RadioButtonList>

                                </td>
                            </tr>
                            <tr>
                                <td>Coffe Break</td>
                                <td>
                                    <asp:RadioButtonList ID="rblCoffe" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="Si" />
                                        <asp:ListItem Text="No" Selected="True" />
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>¿Requiere evaluación?</td>
                                <td>
                                    <asp:RadioButtonList ID="rblEvaluacion" runat="server" RepeatDirection="Horizontal" onclick="EnableDisable2(this)">
                                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="2" Selected="True"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>Adjuntar archivo</td>
                                <td>
                                    <asp:FileUpload ID="fileUploadEvaluacion" runat="server" disabled="disabled" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
                <br />
                <br />
                <center> 
                <asp:Button ID="enviarSolicitud" runat="server" Text="Enviar Solicitud" CssClass="botonformulario" OnClick="enviarSolicitud_Click" />
                </center>
                <br />
                <br />

            </div>

        </form>

    </div>
    <div id="pie">
        <img src="imagenes/inferior.png" width="1024" height="100" />
    </div>
</body>
</html>
