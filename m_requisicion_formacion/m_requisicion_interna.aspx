<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_requisicion_interna.aspx.cs" Inherits="m_requisicion_formacion.m_requisicion_interna" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Requisición interna</title>
    <link href="CSS/intranet_estilo.css" rel="stylesheet" />



</head>
<body>
    <script type="text/javascript">
        function EnableDisable(rbl) {
            var rb = rbl.getElementsByTagName("input");
            document.getElementById("<%=fileUploadPoliticas.ClientID %>").disabled = true;
            for (var i = 0; i < rb.length; i++) {
                if (rb[i].value == 1 && rb[i].checked) {
                    document.getElementById("<%=fileUploadPoliticas.ClientID %>").disabled = false;
                    }
                }
            }
            function EnableDisable2(rbl) {
                var rb = rbl.getElementsByTagName("input");
                document.getElementById("<%=fileUploadEvaluacion.ClientID %>").disabled = true;
                for (var i = 0; i < rb.length; i++) {
                    if (rb[i].value == 1 && rb[i].checked) {
                        document.getElementById("<%=fileUploadEvaluacion.ClientID %>").disabled = false;
                }
            }
        }

    </script>
    <div id="encabezado">
        <div id="logo"></div>
        <div id="relleno"></div>
    </div>
    <div id="contenedor">
        <form id="form1" runat="server" enctype="multipart/form-data" method="post">
            <div id="menu" style="width: 250px; height: 370px;"></div>
            <div id="modulo">
                <h1>Requisición interna de capacitación</h1>
                <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
                    EnableScriptLocalization="true" ID="ToolkitScriptManager1" CombineScripts="false" />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="dropListPrioridad" InitialValue="0">Seleccione Prioridad</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 162px">Modalidad</td>
                                        <td>
                                            <asp:DropDownList ID="dropListModalidad" runat="server" AutoPostBack="true" CssClass="combobox" Width="201">
                                                <asp:ListItem Text="-Seleccione modalidad-" Value="0" Selected="True" />
                                                <asp:ListItem Text="Presencial" Value="1" />
                                                <asp:ListItem Text="En Linea" Value="2" />
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="dropListModalidad" InitialValue="0">Seleccione Modalidad</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="divDatosPresencial" runat="server">
                                <table>
                                    <tr>
                                        <td>Fecha</td>
                                        <td>
                                            <asp:TextBox runat="server" ID="fecha" ReadOnly="false" CssClass="texto" Width="195" />

                                            <ajaxToolkit:CalendarExtender ID="fecha_CalendarExtender" runat="server" Enabled="True" TargetControlID="fecha" Format="yyyy-MM-dd">
                                            </ajaxToolkit:CalendarExtender>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="fecha">Ingrese una Fecha</asp:RequiredFieldValidator>
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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Selecciona una hora" ControlToValidate="horas" InitialValue="0"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Selecciona Minutos" ControlToValidate="minutos" InitialValue="0"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Duración en Horas</td>
                                        <td>
                                            <asp:TextBox ID="duracion_horas" runat="server" TextMode="Number" CssClass="texto" Width="195" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="duracion_horas">Ingrese la duracion en horas.</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Número de Participantes</td>
                                        <td>
                                            <asp:TextBox ID="numParticipantes" runat="server" TextMode="Number" CssClass="texto" Width="195" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="numParticipantes">Ingrese el número de participantes.</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                            </div>
                            <div id="divLugar" runat="server">
                                <table>
                                    <tr>
                                        <td style="width: 163px">Lugar</td>
                                        <td>
                                            <asp:DropDownList ID="dropListLugar" runat="server" AutoPostBack="true" CssClass="combobox" Width="201">
                                                <asp:ListItem Text="-Seleccione Lugar-" Selected="True" Value="0" />
                                                <asp:ListItem Text="Oficina de servicio" Value="1" />
                                                <asp:ListItem Text="Corporativo" Value="2" />
                                                <asp:ListItem Text="Otro" Value="3" />
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="dropListLugar" InitialValue="0">Seleccione Lugar</asp:RequiredFieldValidator>
                                        </td>

                                    </tr>
                                </table>
                            </div>
                            <div id="divEspecificarOficina" runat="server">
                                <table>
                                    <tr>
                                        <td style="width: 162px">Especifiar Lugar</td>
                                        <td>
                                            <asp:TextBox ID="textEspecificar" runat="server" CssClass="texto" Width="195" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="textEspecificar">Especifique lugar.</asp:RequiredFieldValidator>
                                        </td>

                                    </tr>
                                </table>
                            </div>
                            <div id="divEspecificarSala" runat="server">
                                <table>
                                    <tr>
                                        <td style="width: 162px">Especificar Sala</td>
                                        <td>
                                            <asp:DropDownList ID="dropListSala" runat="server" AutoPostBack="true" CssClass="combobox" Width="201">
                                                <asp:ListItem Text="-Selecione Sala-" Value="0" Selected="True" />
                                                <asp:ListItem Text="Auditorio" Value="1" />
                                                <asp:ListItem Text="Pecera" Value="2" />
                                                <asp:ListItem Text="Sala De Juntas" Value="3" />
                                                <asp:ListItem Text="Sala De Capacitación" Value="4" />
                                            </asp:DropDownList>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="dropListSala" InitialValue="0">Especifique sala.</asp:RequiredFieldValidator>

                                        </td>
                                    </tr>
                                </table>
                                <div id="divTipoAcomodo" runat="server">
                                    <table>
                                        <tr>
                                            <td style="width: 163px">Tipo de Acomodo</td>
                                            <td>
                                                <asp:DropDownList ID="dropListAcomodo" runat="server" CssClass="combobox" Width="201">
                                                    <asp:ListItem Text="-Seleccione Acomodo-" Value="0" Selected="True" />
                                                    <asp:ListItem Text="Herradura" Value="1" />
                                                    <asp:ListItem Text="Tipo Escuela" Value="2" />
                                                    <asp:ListItem Text="Sala" Value="3" />
                                                </asp:DropDownList>

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="dropListAcomodo" InitialValue="0">Especifique tipo de acomodo.</asp:RequiredFieldValidator>

                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
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
                                    <asp:DropDownList runat="server" ID="dropListParticipantes" CssClass="listitem">
                                        <asp:ListItem Text="-Seleccione Participantes-" Value="0" Selected="True" />
                                        <asp:ListItem Text="Comercial" Value="1" />
                                        <asp:ListItem Text="Staff" Value="2" />
                                        <asp:ListItem Text="Clientes" Value="3" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="dropListParticipantes" InitialValue="0"><br />Seleccione participantes.</asp:RequiredFieldValidator>

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
            </div>
            <br />
            <br />
            <center>
                <asp:Button ID="enviarSolicitud" runat="server" Text="Enviar Solicitud" CssClass="botonformulario" OnClick="enviarSolicitud_Click" />
            </center>

        </form>

    </div>
    <div id="pie">
        <img src="imagenes/inferior.png" width="1024" height="100" />
    </div>
</body>
</html>
