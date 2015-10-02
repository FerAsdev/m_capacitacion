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
    <style type="text/css">
        .auto-style2 {
            width: 162px;
        }
        .auto-style3 {
            width: 157px;
        }
    </style>
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
                                    <asp:TextBox runat="server" ID="fecha" CssClass="texto" Width="185px"/>

                                    <ajaxToolkit:CalendarExtender ID="fecha_CalendarExtender" runat="server" TargetControlID="fecha">
                                    </ajaxToolkit:CalendarExtender>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="fecha">Debe completar este campo.</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Hora inicio</td>
                                <td>
                                    <asp:TextBox runat="server" ID="hora_inicio" CssClass="texto" Width="183px"  />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="hora_inicio">Debe completar este campo</asp:RequiredFieldValidator>
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
                                <asp:RadioButtonList ID="rbProveedor" runat="server" RepeatDirection="Horizontal" >
                                    <asp:ListItem Text="Si" Value="1" />
                                    <asp:ListItem Text="No" Value="2" Selected="True" />
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">¿Se requieren viaticos?</td>
                            <td>
                                <asp:RadioButtonList ID="rbViaticos" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="Si" Value="1" />
                                    <asp:ListItem Text="No" Value="2" Selected="True" />
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Costo aproximado</td>
                            <td>
                                <asp:TextBox ID="txtCosto" runat="server"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCosto">Especifique un costo</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <div id="divDuracionHoras" runat="server">
                        <table>
                            <tr>
                                <td style="width:159px">Duracion en Horas</td>
                                <td>
                                    <asp:TextBox ID="duracion_horas" runat="server" TextMode="Number" CssClass="texto"/>
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
                                    <asp:TextBox ID="numParticipantes" runat="server" TextMode="Number" CssClass="texto" Width="195" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="numParticipantes">Ingrese Numero de Participantes</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="divEspecificarLugar" runat="server">
                        <table>
                            <tr>
                                <td style="width: 162px">Especifiar Lugar</td>
                                <td>
                                    <asp:TextBox ID="textEspecificar" runat="server" CssClass="texto" Width="195" />
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
