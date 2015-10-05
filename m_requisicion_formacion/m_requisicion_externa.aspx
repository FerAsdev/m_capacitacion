<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_requisicion_externa.aspx.cs" Inherits="m_requisicion_formacion.m_requisicion_externa" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Requisicion Externa</title>
    <link href="CSS/intranet_estilo.css" rel="stylesheet" />
    <link href="CSS/jquery.timepicker.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script src="Scripts/jquery.timepicker.js"></script>
    <!--Script para el date y time picker jquery -->
    <script>
        $(document).ready(function () {
            $("#hora_inicio").timepicker({ 'scrollDefault': 'now' });
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            function EndRequestHandler(sender, args) {
                $("#hora_inicio").timepicker({ 'scrollDefault': 'now' });
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
            <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
                EnableScriptLocalization="true" ID="ToolkitScriptManager1" CombineScripts="false" />
            <div id="menu" style="width: 250px; height: 370px;"></div>
            <div id="modulo">
                <h1>Requisición externa de capacitación</h1>
                <!-- Datos Generales -->
                <fieldset>
                    <legend>Datos Generales</legend>
                    <div id="divDatosGenerales" runat="server">
                        <table>
                            <tr>
                                <td style="width: 162px">Prioridad</td>
                                <td>
                                    <asp:DropDownList ID="dropListPrioridad" runat="server" CssClass="combobox" Width="201">
                                        <asp:ListItem Text="-Seleccione Prioridad-" Value="0" Selected="True" />
                                        <asp:ListItem Text="Programada" Value="1" />
                                        <asp:ListItem Text="Urgente" Value="2" />
                                        <asp:ListItem Text="Extra Urgente" Value="3" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="dropListPrioridad" InitialValue="0">Indique Prioridad</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 162px">Modalidad</td>
                                <td>
                                    <asp:DropDownList ID="dropListModalidad" runat="server" CssClass="combobox" Width="201" AutoPostBack="true">
                                        <asp:ListItem Text="-Seleccione modalidad-" Value="0" Selected="True" />
                                        <asp:ListItem Text="Presencial" Value="1" />
                                        <asp:ListItem Text="En Linea" Value="2" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="dropListModalidad" InitialValue="0">Indique modalidad</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="divDatosPresencial" runat="server">
                        <table>
                            <tr>
                                <td style="width: 162px">Fecha</td>
                                <td>
                                    <asp:TextBox runat="server" ID="fecha" CssClass="texto" Width="185px" />
                                    <ajaxToolkit:CalendarExtender ID="fecha_CalendarExtender" runat="server" TargetControlID="fecha" Format="yyyy-MM-dd">
                                    </ajaxToolkit:CalendarExtender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="fecha">Debe completar este campo.</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Hora inicio</td>
                                <td>
                                    <asp:DropDownList ID="horas" runat="server" Style="margin-left: 97px">
                                        <asp:ListItem Text="hh" Value="0" Selected="True" />
                                        <asp:ListItem Text="01" />
                                        <asp:ListItem Text="02" />
                                        <asp:ListItem Text="03" />
                                        <asp:ListItem Text="04" />
                                        <asp:ListItem Text="05" />
                                        <asp:ListItem Text="06" />
                                        <asp:ListItem Text="07" />
                                        <asp:ListItem Text="08" />
                                        <asp:ListItem Text="09" />
                                        <asp:ListItem Text="10" />
                                        <asp:ListItem Text="11" />
                                        <asp:ListItem Text="12" />
                                    </asp:DropDownList>
                                    <strong>:</strong>
                                    <asp:DropDownList ID="minutos" runat="server">
                                        <asp:ListItem Text="mm" Value="0" Selected="True" />
                                        <asp:ListItem Text="00" />
                                        <asp:ListItem Text="05" />
                                        <asp:ListItem Text="10" />
                                        <asp:ListItem Text="15" />
                                        <asp:ListItem Text="20" />
                                        <asp:ListItem Text="25" />
                                        <asp:ListItem Text="30" />
                                        <asp:ListItem Text="35" />
                                        <asp:ListItem Text="40" />
                                        <asp:ListItem Text="45" />
                                        <asp:ListItem Text="50" />
                                        <asp:ListItem Text="55" />

                                    </asp:DropDownList>
                                    <asp:DropDownList ID="meridiano" runat="server">
                                        <asp:ListItem Text="am" />
                                        <asp:ListItem Text="pm" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Selecciona una hora" ControlToValidate="horas" InitialValue="0"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Selecciona Minutos" ControlToValidate="minutos" InitialValue="0"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>

                </fieldset>
                <br />
                <!-- Datos Especificos -->
                <fieldset>
                    <legend>Datos Especificos</legend>

                    <table>
                        <tr>
                            <td class="auto-style3">Proveedor sugerido</td>
                            <td>
                                <asp:RadioButtonList ID="rbProveedor" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="Si" Value="1" />
                                    <asp:ListItem Text="No" Value="2" Selected="True" />
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>¿Se requieren viaticos?</td>
                            <td>
                                <asp:RadioButtonList ID="rbViaticos" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="Si" Value="1" />
                                    <asp:ListItem Text="No" Value="2" Selected="True" />
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 167px">Costo aproximado</td>
                            <td>
                                <asp:TextBox ID="txtCosto" runat="server" CssClass="textotabla" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCosto">Especifique un costo</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <div id="divDuracionHoras" runat="server">
                        <table>
                            <tr>
                                <td style="width: 167px">Duracion en Horas</td>
                                <td>
                                    <asp:TextBox ID="duracion_horas" runat="server" TextMode="Number" CssClass="textotabla" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="duracion_horas">Especifique duracion del curso.</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div id="divNumPartic" runat="server">
                        <table>
                            <tr>
                                <td>Numero de Participantes</td>
                                <td>
                                    <asp:TextBox ID="numParticipantes" runat="server" TextMode="Number" CssClass="textotabla" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="numParticipantes">Ingrese Numero de Participantes</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="divEspecificarLugar" runat="server">
                        <table>
                            <tr>
                                <td style="width: 165px">Especifiar Lugar</td>
                                <td>
                                    <asp:TextBox ID="textEspecificar" runat="server" CssClass="textotabla" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="textEspecificar">Especifique un lugar.</asp:RequiredFieldValidator>
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
