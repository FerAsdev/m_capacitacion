<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_requisicion_interna.aspx.cs" Inherits="m_requisicion_formacion.m_requisicion_interna" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Requisición interna</title>
    <link href="CSS/intranet_estilo.css" rel="stylesheet" />
    <link href="CSS/jquery-ui.css" rel="stylesheet" />
    <link href="CSS/jquery.timepicker.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.11.3.min.js"></script>
    <script src="Scripts/jquery.timepicker.js"></script>
    <script src="Scripts/jquery-ui.js"></script>


    <script>
        $(document).ready(function () {
            $("#fecha").datepicker();
            $("#fechaEnvio").datepicker();
            $("#hora").timepicker({ 'scrollDefault': 'now' });
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            function EndRequestHandler(sender, args) {
                $("#fecha").datepicker();
                $("#fechaEnvio").datepicker();
            };
        });
    </script>

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
                <h1>Requisición interna de capacitación</h1>
                <fieldset>
                <legend>Datos Generales</legend>
                    <div id="divDatosGenerales" runat="server">
                        <table>
                            <tr>
                                <td>Prioridad</td>
                                <td>
                                    <asp:DropDownList ID="prioridad" runat="server">
                                        <asp:ListItem Text="-Seleccione Prioridad-" Value="0" Selected="True" />
                                        <asp:ListItem Text="Programada" Value="1" />
                                        <asp:ListItem Text="Urgente" Value="2" />
                                        <asp:ListItem Text="Extra Urgente" Value="3" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Modalidad</td>
                                <td>
                                    <asp:DropDownList ID="dropListModalidad" runat="server" AutoPostBack="true">
                                        <asp:ListItem Text="-Seleccione modalidad-" Value="0" Selected="True" />
                                        <asp:ListItem Text="Presencial" Value="1" />
                                        <asp:ListItem Text="En Linea" Value="2" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />

                        <div id="divDatosPresencial" runat="server">
                            <table>
                                <tr>
                                    <td>Fecha</td>
                                    <td><asp:TextBox runat="server" ID="fecha" ReadOnly="true" /></td>
                                    <td>Hora inicio</td>
                                    <td><asp:TextBox runat="server" ID="hora"/></td>
                                </tr>
                                <tr>
                                    <td>Duracion en Horas</td>
                                    <td><asp:TextBox runat="server" TextMode="Number" /></td>
                                </tr>
                                <tr>
                                    <td>Numero de Participantes</td>
                                    <td><asp:TextBox runat="server" TextMode="Number" /></td>
                                </tr>
                                <tr>
                                    <td>Lugar</td>
                                    <td>
                                        <asp:DropDownList ID="dropListLugar" runat="server" AutoPostBack="true">
                                            <asp:ListItem Text="-Seleccione Lugar-" Selected="True" Value="0" />
                                            <asp:ListItem Text="Oficina de servicio" Value="1" />
                                            <asp:ListItem Text="Corporativo" Value="2" />
                                            <asp:ListItem Text="Otro" Value="3" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>

                            <div id="divEspecificarOficina" runat="server">
                                <table>
                                    <tr>
                                        <td>Especifiar Lugar</td>
                                        <td><asp:TextBox runat="server" /></td>
                                    </tr>
                                </table>
                            </div>
                            <div id="divEspecificarSala" runat="server">
                                <table>
                                    <tr>
                                        <td>Especificar Sala</td>
                                        <td>
                                            <asp:DropDownList ID="dropListSala" runat="server" AutoPostBack="true">
                                                <asp:ListItem Text="-Selecione Sala-" Value="0" Selected="True" />
                                                <asp:ListItem Text="Auditorio" Value="1" />
                                                <asp:ListItem Text="Pecera" Value="2" />
                                                <asp:ListItem Text="Sala De Juntas" Value="3" />
                                                <asp:ListItem Text="Sala De Capacitación" Value="4" />
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                                <div id="divTipoAcomodo" runat="server">
                                    <table>
                                        <tr>
                                            <td>Tipo de Acomodo</td>
                                            <td>
                                                <asp:DropDownList ID="dropAcomodo" runat="server">
                                                    <asp:ListItem Text="-Seleccione Acomodo-" Value="0" Selected="True" />
                                                    <asp:ListItem Text="Herradura" Value="1" />
                                                    <asp:ListItem Text="Tipo Escuela" Value="2" />
                                                    <asp:ListItem Text="Sala" Value="3" />
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </fieldset>
                <fieldset>
                    <legend>Datos Específicos</legend>
                    <div id="divDatosEspcecificos">
                        <table>
                            <tr>
                                <td>¿Existe procedimiento o política?</td>
                                <td>
                                    <asp:RadioButton Text="Si" runat="server" GroupName="politicas" OnCheckedChanged="radioButtonPoliticas"  />
                                    <asp:RadioButton Text="No" runat="server" GroupName="politicas" OnCheckedChanged="radioButtonPoliticas" />
                                </td>
                                <td>
                                    <asp:FileUpload ID="fileUploadPoliticas" runat="server"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
            </div>
        </form>
    </div>
    <div id="pie">
        <img src="imagenes/inferior.png" width="1024" height="100" />
    </div>
</body>
</html>
