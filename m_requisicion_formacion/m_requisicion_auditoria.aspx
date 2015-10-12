<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_requisicion_auditoria.aspx.cs" Inherits="m_requisicion_formacion.m_requisicion_auditoria" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="CSS/intranet_estilo.css" rel="stylesheet" />



</head>
<body>
    <script>
        function toggleCheckBoxes(elem) {

            var div = document.getElementById('<% = DivOficinas.ClientID %>');

                    var chk = div.getElementsByTagName('input');
                    var len = chk.length;

                    for (var i = 0; i < len; i++) {
                        if (chk[i].type === 'checkbox') {
                            chk[i].checked = elem.checked;
                        }
                    }
                }
    </script>
    <div id="encabezado">
        <div id="logo"></div>
        <div id="relleno"></div>
    </div>
    <div id="contenedor">
        <form id="form1" runat="server">
            <div id="menu" style="width: 250px; height: 370px;"></div>
            <div id="modulo">
                <h1>Requisicion de auditoria</h1>
                <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
                    EnableScriptLocalization="true" ID="ToolkitScriptManager1" CombineScripts="false" />

                <div id="DivPrincipal">
                    <fieldset>
                        <legend>Datos de requisicion</legend>
                        <table>
                            <tr>
                                <td>Mes de incidencias</td>
                                <td>
                                    <asp:DropDownList runat="server" ID="DropListMeses" CssClass="combobox">
                                        <asp:ListItem Text="-Seleccione Mes-" Value="0" Selected="True" />
                                        <asp:ListItem Text="Enero" />
                                        <asp:ListItem Text="Febrero" />
                                        <asp:ListItem Text="Marzo" />
                                        <asp:ListItem Text="Abril" />
                                        <asp:ListItem Text="Mayo" />
                                        <asp:ListItem Text="Junio" />
                                        <asp:ListItem Text="Julio" />
                                        <asp:ListItem Text="Agosto" />
                                        <asp:ListItem Text="Septiembre" />
                                        <asp:ListItem Text="Octubre" />
                                        <asp:ListItem Text="Noviembre" />
                                        <asp:ListItem Text="Diciembre" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="DropListMeses" ForeColor="Red" Font-Bold="true" InitialValue="0"/>

                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div id="DivOficinas" runat="server" style="margin-left: 2%">
                                    <h3>Oficinas de Servicio</h3>
                                  <br />
                                    <br />
                                    <table>
                                        <tr>
                                            <td>
                                            <input type="checkbox" id="chkAll" onclick="toggleCheckBoxes(this)" />Seleccionar Todas
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="CheckBox1" runat="server" Text="Os Alamo" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox2" runat="server" Text="Os Apizaco" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox3" runat="server" Text="Os Catemaco" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox4" runat="server" Text="Os Coatzacoalcos" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox5" runat="server" Text="Os Cordoba" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="CheckBox6" runat="server" Text="Os Fortin" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox7" runat="server" Text="Os Huamantla" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox8" runat="server" Text="Os Juan Pablo" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox9" runat="server" Text="Os Martinez" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox10" runat="server" Text="Os Orizaba" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="CheckBox11" runat="server" Text="Os Poza Rica" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox12" runat="server" Text="Os Puebla Sur" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox13" runat="server" Text="Os Tejeria" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox14" runat="server" Text="Os Teziutlan" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox15" runat="server" Text="Os Tlaxcala" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="CheckBox16" runat="server" Text="Os Tuxpan" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox17" runat="server" Text="Os Veracruz" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox18" runat="server" Text="Os Xalapa" />
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CheckBox19" runat="server" Text="Os Zacatelco" />
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <div id="DivInsidencias">
                            <h3>Insidencias Mensuales</h3>
                            <table>
                                <tr>
                                    <td class="auto-style1">Descripcion</td>
                                    <td>
                                        <asp:TextBox ID="TextDescripcion" runat="server" TextMode="MultiLine" Rows="5" Width="45em" />
                                    </td>

                                </tr>
                                <tr>
                                    <td class="auto-style1">Adjuntar Reporte</td>
                                    <td>
                                        <asp:FileUpload ID="FileReprote" runat="server" Width="200px" />
                                        <asp:RegularExpressionValidator
                                            ID="RegularExpressionValidator1"
                                            runat="server" ForeColor="Red"
                                            ErrorMessage="Archivo no permitido"
                                            ValidationExpression="^.+(.xls|.XLS|.xlsx|.XLSX)$"
                                            ControlToValidate="FileReprote" Font-Bold="true" />
                                    </td>
                                </tr>
                            </table>


                        </div>

                    </fieldset>
                    <br />
                    <br />
                    <center>
                        <asp:Button Text="Enviar Solicitud" runat="server" CssClass="botonformulario" OnClick="EnviarSolicitud"/>
                            </center>
                </div>

            </div>
        </form>
    </div>
    <div id="pie">
        <img src="imagenes/inferior.png" width="1024" height="100" />
    </div>

</body>
</html>
