<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_requisicion_auditoria.aspx.cs" Inherits="m_requisicion_formacion.m_requisicion_auditoria" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Requisición</title>
    <link href="CSS/intranet_estilo.css" rel="stylesheet" />
        <script type="text/javascript">
            function alerta() {
                alert('La solicitud se a procesado con exito!');
                window.location="/m_requisicion_auditoria.aspx"
            }
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
                <h1>Requisicion de auditoria</h1>
                <div id="DivPrincipal">
                    <fieldset>
                        <legend>Datos de requisicion</legend>
                        <table style="margin-left:14.438px">
                            <tr>
                                <td style="width:176px;"><strong>Mes de incidencia</strong></td>
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="DropListMeses" ForeColor="Red" Font-Bold="true" InitialValue="0" />
                                </td>
                            </tr>
                        </table>
                        <div id="DivOficinas" runat="server" style="margin-left:2%" >
                            <h3>Oficinas de Servicio</h3>
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
                        <div id="DivInsidencias" style="margin-left:2%">
                            <h3>Insidencias Mensuales</h3>                           
                               <strong>Descripcion de incidencia:</strong>
                            <br />
                            <asp:TextBox ID="TextDescripcion" runat="server" 
                            TextMode="MultiLine" Rows="3" 
                            style="resize:none;" 
                            Width="690px" Height="67px"/>                   
                            <br />
                            <br />
                            <strong>Adjuntar archivo</strong>
                            <br />
                            <asp:FileUpload ID="FileReprote" runat="server" Width="300px" />
                            <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            runat="server" ForeColor="Red"
                            ErrorMessage="Archivo no permitido"
                            ValidationExpression="^.+(.xls|.XLS|.xlsx|.XLSX)$"
                            ControlToValidate="FileReprote" Font-Bold="true" />                    
                            <br />
                            <br />                    
                        </div>
                    </fieldset>      
                </div>
                 <br />
                 <asp:Button ID="Button1" Text="Enviar Solicitud" runat="server" 
                     CssClass="botonformulario" OnClick="EnviarSolicitud" 
                     Style="margin-left: 300px" />
                <br />
                <br />
            </div>
        </form>
    </div>
    <div id="pie">
        <img src="imagenes/inferior.png" width="1024" height="100" />
    </div>
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
</body>
</html>
