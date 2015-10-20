<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_requisicion_externa.aspx.cs" Inherits="m_requisicion_formacion.m_requisicion_externa" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Requisición Externa</title>
    <link href="CSS/intranet_estilo.css" rel="stylesheet" />
    <link href="CSS/estilo_calendario.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        function alerta() {
            alert('¡La solicitud se ha enviado con éxito!');
            window.location = "/m_tipo_requisicion.aspx"
        }
    </script>

    <style type="text/css">
        .auto-style3 {
            width: 162px;
        }

        .auto-style4 {
            width: 96px;
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
            <div id="menu" style="width: 250px; height: 370px;"></div>
            <div id="modulo">
                <h1>Solicitud de capacitación</h1>
                <h3>Requisición de capacitación Externa.</h3>
                <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
                    EnableScriptLocalization="true" ID="ToolkitScriptManager1" CombineScripts="false" />

                <!-- Datos Generales -->
                <fieldset>
                    <legend>Datos Generales</legend>
                    <div id="divDatosGenerales" runat="server">
                        <table>
                            <tr>
                                <td style="width: 162px">Prioridad
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="dropListPrioridad" InitialValue="0" ForeColor="Red" Font-Bold="true" />

                                </td>
                                <td>
                                    <asp:DropDownList ID="dropListPrioridad" runat="server" CssClass="combobox" Width="201">
                                        <asp:ListItem Text="-Seleccione Prioridad-" Value="0" Selected="True" />
                                        <asp:ListItem Text="Programada" Value="1" />
                                        <asp:ListItem Text="Urgente" Value="2" />
                                        <asp:ListItem Text="Extra Urgente" Value="3" />
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 162px">Modalidad
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="dropListModalidad" InitialValue="0" ForeColor="Red" Font-Bold="true" />

                                </td>
                                <td>
                                    <asp:DropDownList ID="dropListModalidad" runat="server" CssClass="combobox" Width="201" AutoPostBack="true">
                                        <asp:ListItem Text="-Seleccione modalidad-" Value="0" Selected="True" />
                                        <asp:ListItem Text="Presencial" Value="1" />
                                        <asp:ListItem Text="En Linea" Value="2" />
                                    </asp:DropDownList>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 162px">Nombre de
                                    <br />
                                    Capacitación
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                                        ErrorMessage="*" ForeColor="Red"
                                        Font-Bold="true" ControlToValidate="txtTema" />

                                </td>
                                <td>
                                    <asp:TextBox ID="txtTema" runat="server" CssClass="texto" Width="200" />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="divDatosPresencial" runat="server">
                        <table>
                            <tr>
                                <td style="width: 162px">Fecha de Inicio
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                         ErrorMessage="*" ControlToValidate="fecha"
                                         ForeColor="Red" Font-Bold="true" />

                                    <br />
                                    <br />
                                    <br />
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="fecha" ReadOnly="false"
                                        CssClass="texto" Width="100px" />
                                    <ajaxToolkit:CalendarExtender ID="fecha_CalendarExtender" runat="server"
                                        TargetControlID="fecha" CssClass="calendario">
                                    </ajaxToolkit:CalendarExtender>
                                    <br />
                                    <br />
                                    <br />
                                </td>
                                <td class="auto-style4">Fecha Final
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                         ErrorMessage="*" ControlToValidate="fecha"
                                         ForeColor="Red" Font-Bold="true" />
                                    <br />
                                    <br />
                                    <br />

                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="fechaFinal" ReadOnly="false"
                                        CssClass="texto" Width="100px" />
                                    <br />
                                    <br />
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                                        TargetControlID="fechaFinal" CssClass="calendario">
                                    </ajaxToolkit:CalendarExtender>
                                    <br />
                                </td>
                            </tr>

                            <tr>
                                <td>Hora de inicio
                                </td>
                                <td>
                                    <asp:DropDownList ID="horas" runat="server" CssClass="combobox">
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
                                    <asp:DropDownList ID="minutos" runat="server" CssClass="combobox">
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
                                    <asp:DropDownList ID="meridiano" runat="server" CssClass="combobox">
                                        <asp:ListItem Text="--" Value="0" />
                                        <asp:ListItem Text="am" />
                                        <asp:ListItem Text="pm" />
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:CheckBox Text="Por definir" runat="server"
                                        AutoPostBack="true" ID="horascheck" />
                                </td>
                            </tr>
                        </table>
                    </div>

                </fieldset>
                <br />
                <!-- Datos Especificos -->
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <fieldset>
                            <legend>Datos Especificos</legend>
                            <table>
                                <tr>
                                    <td class="auto-style3">Proveedor sugerido

                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbProveedor" runat="server"
                                            RepeatDirection="Horizontal" AutoPostBack="true">
                                            <asp:ListItem Text="Si" Value="1" />
                                            <asp:ListItem Text="No" Value="2" Selected="True" />
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr id="trProveedor" runat="server">
                                    <td class="auto-style3">Nombre Proveedor
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                                        ErrorMessage="*" ControlToValidate="txtProveedor"
                                        ForeColor="Red" Font-Bold="true" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProveedor" runat="server" Width="148" />

                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">¿Se requieren viaticos?</td>
                                    <td>
                                        <asp:RadioButtonList ID="rbViaticos" runat="server"
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem Text="Si" Value="1" />
                                            <asp:ListItem Text="No" Value="2" Selected="True" />
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">Costo aproximado

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                            ErrorMessage="*" ControlToValidate="txtCosto"
                                            ForeColor="Red" Font-Bold="true" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCosto" runat="server" Width="100px" Text="$000,000.00" CssClass="texto" />

                                    </td>
                                </tr>
                            </table>
                            <div id="divDuracionHoras" runat="server">
                                <table>
                                    <tr>
                                        <td class="auto-style3">Duracion en Horas
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                ErrorMessage="*" ControlToValidate="duracion_horas"
                                                ForeColor="Red" Font-Bold="true" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="duracion_horas" runat="server"
                                                TextMode="Number" Width="40px"
                                                min="1" max="24" CssClass="texto" />
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <div id="divNumPartic" runat="server">
                                <table>
                                    <tr>
                                        <td class="auto-style3">Numero de
                                            <br />
                                            Participantes
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ErrorMessage="*" ControlToValidate="numParticipantes" 
                                            ForeColor="Red" Font-Bold="true" />

                                        </td>
                                        <td>
                                            <asp:TextBox ID="numParticipantes" runat="server"
                                                TextMode="Number" CssClass="texto"
                                                min="1" Width="40px" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="divEspecificarLugar" runat="server">
                                <table>
                                    <tr>
                                        <td class="auto-style3">Especifiar Lugar
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                            ErrorMessage="*" ControlToValidate="textEspecificar"
                                            ForeColor="Red" Font-Bold="true" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="textEspecificar" runat="server" CssClass="texto" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </fieldset>
                        <br />
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Button runat="server" ID="EnviarSolicitud"
                    OnClick="enviarSolicitud_Click" Style="margin-left: 300px"
                    Text="Enviar Solicitud" CssClass="botonformulario" />
            </div>
        </form>
    </div>
    <div id="pie">
        <img src="imagenes/inferior.png" width="1024" height="100" />
    </div>
    <script type="text/javascript">
        function DisableButton() {
            var boton = document.getElementById("<%=EnviarSolicitud.ClientID %>")
            boton.text
            boton.disabled = true;

        }
        window.onbeforeunload = DisableButton;
    </script>
</body>
</html>
