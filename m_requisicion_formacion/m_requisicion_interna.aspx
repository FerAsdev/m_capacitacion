<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_requisicion_interna.aspx.cs" Inherits="m_requisicion_formacion.m_requisicion_interna" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Requisición Interna</title>
    <link href="CSS/intranet_estilo.css" rel="stylesheet" />
    <link href="CSS/estilo_calendario.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.11.3.min.js"></script>
    <script type="text/javascript">
        function alerta() {
            alert('¡La solicitud se ha enviado con éxito!');
            window.location = "/m_requisicion_interna.aspx"
        }
    </script>



    <style type="text/css">
        .auto-style3 {
            width: 162px;
        }

        .auto-style7 {
            width: 375px;
        }

        .auto-style8 {
            width: 375px;
        }

        .auto-style9 {
            width: 375px;
            height: 36px;
        }

        .auto-style10 {
            height: 36px;
        }
    </style>

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
                <h1>Solicitud de capacitación</h1>
                <h3>Requisición de capacitación Interna</h3>
                <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
                    EnableScriptLocalization="true" ID="ToolkitScriptManager1" CombineScripts="false" />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <fieldset>
                            <legend>Datos Generales</legend>
                            <div id="divDatosGenerales" runat="server">
                                <table>
                                    <tr>
                                        <td class="auto-style3">Prioridad
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="dropListPrioridad" InitialValue="0" Font-Bold="true" ForeColor="Red" />

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
                                        <td class="auto-style3">Modalidad
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="dropListModalidad" InitialValue="0" Font-Bold="true" ForeColor="Red" />

                                        </td>
                                        <td>
                                            <asp:DropDownList ID="dropListModalidad" runat="server" AutoPostBack="true" CssClass="combobox" Width="201">
                                                <asp:ListItem Text="-Seleccione modalidad-" Value="0" Selected="True" />
                                                <asp:ListItem Text="Presencial" Value="1" />
                                                <asp:ListItem Text="En Linea" Value="2" />
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="divDatosPresencial" runat="server">
                                <table>
                                    <tr>
                                        <td class="auto-style3">Nombre de
                                            <br />
                                            Capacitación
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtTema" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTema" runat="server" CssClass="texto" Width="195px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style3">Fecha
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="fecha" Font-Bold="true" ForeColor="Red" />
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="fecha" ReadOnly="false" CssClass="texto" Width="100px" />

                                            <ajaxToolkit:CalendarExtender ID="fecha_CalendarExtender" runat="server" Enabled="True" TargetControlID="fecha" CssClass="calendario" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style3">Hora inicio
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="horas" InitialValue="0" Font-Bold="true" ForeColor="Red" />
                                        </td>
                                        <td>
                                            <br />
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
                                                <asp:ListItem Text="--" Value="0" Selected="True" />
                                                <asp:ListItem Text="am" />
                                                <asp:ListItem Text="pm" />
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style3">Duración en Horas
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="duracion_horas" Font-Bold="true" ForeColor="Red" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="duracion_horas" runat="server" TextMode="Number" CssClass="texto" Width="50" min="1" />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style3">Número de
                                            <br />
                                            Participantes
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="numParticipantes" Font-Bold="true" ForeColor="Red" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="numParticipantes" runat="server" TextMode="Number" CssClass="texto" Width="50" min="1" />
                                        </td>
                                    </tr>
                                    <tr>
                            </div>
                            <div id="divLugar" runat="server">
                                <table>
                                    <tr>
                                        <td class="auto-style3">Lugar
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ControlToValidate="dropListLugar" InitialValue="0" Font-Bold="true" ForeColor="Red" />
                                        </td>
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
                            </div>
                            <div id="divEspecificarOficina" runat="server">
                                <table class="auto-style23">
                                    <tr>
                                        <td class="auto-style3">Lugar de Capacitación
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ControlToValidate="textEspecificar" Font-Bold="true" ForeColor="Red" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="textEspecificar" runat="server" CssClass="texto" Width="195" />
                                        </td>

                                    </tr>
                                </table>
                            </div>
                            <div id="divOficinas" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="chkAll" onclick="toggleCheckBoxes(this)" />Seleccionar Todas
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="CheckAlamo" runat="server" Text="Os Alamo" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckApizaco" runat="server" Text="Os Apizaco" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckCatemaco" runat="server" Text="Os Catemaco" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckCoatza" runat="server" Text="Os Coatzacoalcos" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckCordoba" runat="server" Text="Os Cordoba" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="CheckFortin" runat="server" Text="Os Fortin" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckHuamantla" runat="server" Text="Os Huamantla" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckJuanPablo" runat="server" Text="Os Juan Pablo" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckMartinez" runat="server" Text="Os Martinez" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckOrizaba" runat="server" Text="Os Orizaba" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="CheckPoza" runat="server" Text="Os Poza Rica" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckPueblaSur" runat="server" Text="Os Puebla Sur" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckTejeria" runat="server" Text="Os Tejeria" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckTeziutlan" runat="server" Text="Os Teziutlan" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckTlaxcala" runat="server" Text="Os Tlaxcala" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="CheckTuxpan" runat="server" Text="Os Tuxpan" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckVeracruz" runat="server" Text="Os Veracruz" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckXalapa" runat="server" Text="Os Xalapa" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckZacatelco" runat="server" Text="Os Zacatelco" />
                                        </td>

                                    </tr>
                                </table>
                            </div>
                            <div id="divEspecificarSala" runat="server">
                                <table>
                                    <tr>
                                        <td class="auto-style3">Especificar Sala
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="dropListSala" InitialValue="0" Font-Bold="true" ForeColor="Red" />

                                        </td>
                                        <td>
                                            <asp:DropDownList ID="dropListSala" runat="server" AutoPostBack="True" CssClass="combobox" Width="201">
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
                                    <table class="auto-style21">
                                        <tr>
                                            <td class="auto-style3">Tipo de Acomodo
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="dropListAcomodo" InitialValue="0" Font-Bold="true" ForeColor="Red" />
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="dropListAcomodo" runat="server" CssClass="combobox" Width="201">
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
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <br />

                <fieldset>
                    <legend>Datos Específicos</legend>

                    <div id="divDatosEspcecificos">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <Triggers>
                                <asp:PostBackTrigger ControlID="BtnAdd" />
                            </Triggers>
                            <ContentTemplate>
                                
                                <table>
                                    <tr>
                                        <td class="auto-style8">¿Existe procedimiento o política?</td>
                                        <td>
                                            <asp:RadioButtonList ID="rblPoliticas" runat="server" RepeatDirection="Horizontal" onclick="EnableDisable(this)">
                                                <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="No" Value="2" Selected="true"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style8">Adjuntar documentos del evento<br />
                                            (solo se permiten archivos PDF y PowerPoint)</td>
                                        <td>
                                            <asp:FileUpload ID="fileUploadPoliticas" runat="server" disabled="disabled" Width="285px" />
                                            <br />
                                            <asp:RegularExpressionValidator
                                                ID="RegularExpressionValidator1"
                                                runat="server" ForeColor="Red"
                                                ErrorMessage="Archivo no permitido"
                                                ValidationExpression="^.+(.ppt|.PPT|.pptx|.PPTX|.pdf|.PDF)$"
                                                ControlToValidate="fileUploadPoliticas" Font-Bold="true" /><br />
                                            <asp:ListBox ID="ListFile" runat="server" Width="215px" CssClass="listitem" Height="50px" /><br />
                                            <asp:Button ID="BtnAdd" runat="server" Text="Agregar" OnClick="AgregarFile" CausesValidation="false" />
                                            <asp:Button ID="BtnQuit" runat="server" Text="Quitar" Style="margin-left: 15px" Width="67px" OnClick="QuitarFile" CausesValidation="false" />

                                        </td>
                                    </tr>

                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <table>

                                    <tr>
                                        <td class="auto-style9">Participantes
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*" ControlToValidate="dropListParticipantes" InitialValue="0" Font-Bold="true" ForeColor="Red" />

                                        </td>
                                        <td class="auto-style10">
                                            <asp:DropDownList runat="server" ID="dropListParticipantes" CssClass="combobox" AutoPostBack="true">
                                                <asp:ListItem Text="-Seleccione Participantes-" Value="0" Selected="True" />
                                                <asp:ListItem Text="Comercial" Value="1" />
                                                <asp:ListItem Text="Staff" Value="2" />
                                                <asp:ListItem Text="Clientes" Value="3" />
                                            </asp:DropDownList>

                                        </td>
                                    </tr>
                                    <tr id="trPersonalOficina" runat="server">
                                        <td class="auto-style7">Seleccione Personal
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                            ErrorMessage="*" ControlToValidate="dropPersonalComercial" InitialValue="0"
                                            ForeColor="Red" Font-Bold="true" />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="dropPersonalComercial" runat="server" CssClass="combobox" Width="220px">
                                                <asp:ListItem Text="-Seleccione Personal-" Value="0" />
                                                <asp:ListItem Text="Toda la Oficina" />
                                                <asp:ListItem Text="Solo Administrador" />
                                                <asp:ListItem Text="Solo Gerente" />
                                                <asp:ListItem Text="Administrador y Gerente" />
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr id="trStaff" runat="server">
                                        <td class="auto-style7">Indique areas del staff
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                        ErrorMessage="*" ControlToValidate="txtAreasStaff"
                                        ForeColor="Red" Font-Bold="true" />

                                        </td>

                                        <td>
                                            <asp:TextBox ID="txtAreasStaff" runat="server"
                                                TextMode="MultiLine" Height="50px" Style="resize: none;"
                                                CssClass="texto" Width="215px" />
                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="auto-style7">Especificar si se requiere material de apoyo<br />
                                            especial (bocinas, camara web, etc...)</td>
                                        <td>
                                            <asp:RadioButtonList ID="rblMaterial" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                                                <asp:ListItem Text="Si" Value="1" />
                                                <asp:ListItem Text="No" Selected="true" Value="2" />
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr id="trMaterialExtra" runat="server">
                                        <td class="auto-style7">Especifique Material
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                            ErrorMessage="*" ControlToValidate="txtMaterialExtral"
                                            ForeColor="Red" Font-Bold="true" />

                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" TextMode="MultiLine" CssClass="texto" ID="txtMaterialExtral" Style="resize: none;" Width="197px" Height="50px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style7">Coffe Break</td>
                                        <td>
                                            <asp:RadioButtonList ID="rblCoffe" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Text="Si" />
                                                <asp:ListItem Text="No" Selected="True" />
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>

                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <table>
                            <tr>
                                <td class="auto-style7">¿Requiere evaluación?</td>
                                <td>
                                    <asp:RadioButtonList ID="rblEvaluacion" runat="server" RepeatDirection="Horizontal" onclick="EnableDisable2(this)">
                                        <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="2" Selected="True"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">Adjuntar archivo</td>
                                <td>
                                    <asp:FileUpload ID="fileUploadEvaluacion" runat="server" disabled="disabled" Width="285px" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
                <br />
                <br />
                <div id="boton" runat="server">
                    <asp:Button ID="EnviarSolicitud" runat="server" Text="Enviar Solicitud" CssClass="botonformulario"
                        OnClick="enviarSolicitud_Click" Style="margin-left: 300px" />
                    <br />
                    <br />
                </div>
            </div>
        </form>
    </div>
    <div id="pie">
        <img src="imagenes/inferior.png" width="1024" height="100" />
    </div>
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

        function toggleCheckBoxes(elem) {

            var div = document.getElementById('<% = divOficinas.ClientID %>');

            var chk = div.getElementsByTagName('input');
            var len = chk.length;

            for (var i = 0; i < len; i++) {
                if (chk[i].type === 'checkbox') {
                    chk[i].checked = elem.checked;
                }
            }
        }


    </script>
    <script>

        $('#form1').on('submit', function (e) {
            var div = document.getElementById('<% = divOficinas.ClientID %>');
            if (div.style.display != "none") {
                if ($("input[type=checkbox]:checked").length === 0) {
                    e.preventDefault();
                    alert('Seleccione al menos una oficina.');
                    return false;
                }
            }
        });
    </script>
    <script type="text/javascript">
        function DisableButton() {
            document.getElementById("<%=EnviarSolicitud.ClientID %>").disabled = true;
        }
        window.onbeforeunload = DisableButton;
    </script>

</body>
</html>
