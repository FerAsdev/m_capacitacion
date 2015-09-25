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
            $("#hora").timepicker({ 'scrollDefault': 'now' });
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            function EndRequestHandler(sender, args) {
                $("#fecha").datepicker();
                $("#hora").timepicker({ 'scrollDefault': 'now' });
            };
        });
    </script>
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

</head>
<body>
    <div id="encabezado">
        <div id="logo"></div>
        <div id="relleno"></div>
    </div>
    <div id="contenedor">
        <form id="form1" runat="server" enctype="multipart/form-data" method="post">
            <div id="menu" style="width: 250px; height: 370px;"></div>
            <div id="modulo">
                <h1>Requisición interna de capacitación</h1>
                <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <fieldset>
                            <legend>Datos Generales</legend>
                            <div id="divDatosGenerales" runat="server">
                                <table>
                                    <tr>
                                        <td style="width: 162px">Prioridad</td>
                                        <td>
                                            <asp:DropDownList ID="prioridad" runat="server" CssClass="combobox" Width="201">
                                                <asp:ListItem Text="-Seleccione Prioridad-" Value="0" Selected="True" />
                                                <asp:ListItem Text="Programada" Value="1" />
                                                <asp:ListItem Text="Urgente" Value="2" />
                                                <asp:ListItem Text="Extra Urgente" Value="3" />
                                            </asp:DropDownList>
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
                                        </td>
                                    </tr>
                                </table>

                                <div id="divDatosPresencial" runat="server">
                                    <table>
                                        <tr>
                                            <td>Fecha</td>
                                            <td>
                                                <asp:TextBox runat="server" ID="fecha" ReadOnly="false" CssClass="texto" Width="195" /></td>

                                        </tr>
                                        <tr>
                                            <td>Hora inicio</td>
                                            <td>
                                                <asp:TextBox runat="server" ID="hora" CssClass="texto" Width="195" /></td>
                                        </tr>
                                        <tr>
                                            <td>Duracion en Horas</td>
                                            <td>
                                                <asp:TextBox runat="server" TextMode="Number" CssClass="texto" Width="195" /></td>
                                        </tr>
                                        <tr>
                                            <td>Numero de Participantes</td>
                                            <td>
                                                <asp:TextBox runat="server" TextMode="Number" CssClass="texto" Width="195" /></td>
                                        </tr>
                                        <tr>
                                </div>
                                <div id="divLugar" runat="server">
                                    <table>
                                        <tr>
                                            <td>Lugar</td>
                                            <td>
                                                <asp:DropDownList ID="dropListLugar" runat="server" AutoPostBack="true" CssClass="combobox" Width="201">
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
                                                <td style="width: 162px">Especifiar Lugar</td>
                                                <td>
                                                    <asp:TextBox runat="server" CssClass="texto" Width="195" /></td>
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
                                                </td>
                                            </tr>
                                        </table>
                                        <div id="divTipoAcomodo" runat="server">
                                            <table>
                                                <tr>
                                                    <td style="width: 163px">Tipo de Acomodo</td>
                                                    <td>
                                                        <asp:DropDownList ID="dropAcomodo" runat="server" CssClass="combobox" Width="201">
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
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" onclick="EnableDisable(this)">
                                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
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
                                    <asp:RadioButton Text="Si" runat="server" GroupName="materialEspecial" />
                                    <asp:RadioButton Text="No" runat="server" GroupName="materialEspecial" />
                                </td>
                            </tr>
                            <tr>
                                <td>Coffe Break</td>
                                <td>
                                    <asp:RadioButton Text="Si" runat="server" GroupName="coffeBreak" />
                                    <asp:RadioButton Text="No" runat="server" GroupName="coffeBreak" />
                                </td>
                            </tr>
                            <tr>
                                <td>¿Requiere evaluación?</td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" onclick="EnableDisable2(this)">
                                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
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

        </form>
    </div>
    <div id="pie">
        <img src="imagenes/inferior.png" width="1024" height="100" />
    </div>
</body>
</html>
