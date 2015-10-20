<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_seguimiento_solicitud.aspx.cs" Inherits="m_requisicion_formacion.m_seguimiento_solicitud" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Seguimiento Solicitudes</title>
    <link href="CSS/intranet_estilo.css" rel="stylesheet" />
    <link href="CSS/estilo_calendario.css" rel="stylesheet" />
    <script type="text/javascript">
        function alerta() {
            alert('¡La solicitud se ha enviado con éxito!');
            window.location = "/m_requisicion_interna.aspx"
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
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
                <h1>Solicitudes Capacitacion</h1>
                <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
                    EnableScriptLocalization="true" ID="ToolkitScriptManager1" CombineScripts="false" />
                <div id="busqueda" runat="server">
                    <fieldset>
                        <legend>Busqueda</legend>
                        Tipo de capacitacion:
                        <asp:DropDownList runat="server" CssClass="combobox" ID="DropListBusqueda">
                            <asp:ListItem Text="-Seleccione Tipo de capacitación-" />
                            <asp:ListItem Text="Interna" Value="1" />
                            <asp:ListItem Text="Externa" Value="2" />
                            <asp:ListItem Text="Auditoria" Value="3" />
                        </asp:DropDownList>
                        <br />
                        <br />
                        <table>
                            <tr>
                                <td>Desde</td>
                                <td>
                                    <asp:TextBox runat="server" ID="fechaDesde" Width="75" CssClass="texto" />
                                    <ajaxToolkit:CalendarExtender ID="fechaDesde_CalendarExtender" runat="server"
                                        Enabled="True" TargetControlID="fechaDesde" CssClass="calendario" />

                                </td>
                                <td>Hasta</td>
                                <td>
                                    <asp:TextBox runat="server" ID="fechaHasta" Width="75" CssClass="texto" />
                                    <ajaxToolkit:CalendarExtender ID="fechaHasta_CalendarExtender" runat="server"
                                        Enabled="True" TargetControlID="fechaHasta" CssClass="calendario" />
                                </td>
                                <td>
                                    <asp:Button ID="btnBuscarInterna" runat="server" Text="Buscar" OnClick="btnBuscarInterna_Click"
                                        CssClass="botonformulario" Style="margin-left: 49px" Width="100px" />
                                </td>
                            </tr>
                        </table>

                        <table class="auto-style1">
                            <tr>

                                <td>
                                    <asp:CheckBox Text="Prioridad" runat="server" ID="checkbox1" Checked="true" /></td>
                                <td>
                                    <asp:CheckBox Text="Modalidad" runat="server" ID="checkbox2" Checked="true" /></td>
                                <td>
                                    <asp:CheckBox Text="Nombre" runat="server" ID="checkbox3" Checked="true" /></td>
                                <td>
                                    <asp:CheckBox Text="Fecha" runat="server" ID="checkbox4" /></td>
                                <td>
                                    <asp:CheckBox Text="Hora de inicio." runat="server" ID="checkbox5" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox Text="Duración Horas" runat="server" ID="checkbox6" /></td>
                                <td>
                                    <asp:CheckBox Text="Número participantes" runat="server" ID="checkbox7" /></td>
                                <td>
                                    <asp:CheckBox Text="Lugar" runat="server" ID="checkbox8" /><br />
                                </td>
                                <td>
                                    <asp:CheckBox Text="Sala" runat="server" ID="checkbox9" /></td>
                                <td>
                                    <asp:CheckBox Text="Acomodo" runat="server" ID="checkbox10" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox Text="Politicas" runat="server" ID="checkbox11" /></td>
                                <td>
                                    <asp:CheckBox Text="Participantes" runat="server" ID="checkbox12" /></td>
                                <td>
                                    <asp:CheckBox Text="Material Extra" runat="server" ID="checkbox13" /></td>
                                <td>
                                    <asp:CheckBox Text="Coffe Break" runat="server" ID="checkbox14" /></td>
                                <td>
                                    <asp:CheckBox Text="Evaluacion" runat="server" ID="checkbox15" /></td>
                            </tr>
                        </table>



                        <br />
                        <br />
                        <h3>Seguimiento solicitud capacitaciones.</h3>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal" Width="700px">
                                    <asp:GridView ID="GridView1" runat="server"

                                        PagerStyle-BackColor="#336600"
                                        AutoGenerateColumns="true"
                                        AllowPaging="true"
                                        PageSize="10"
                                        OnPageIndexChanging="OnPaging">
                                    </asp:GridView>
                                </asp:Panel>

                            </ContentTemplate>
                        </asp:UpdatePanel>



                    </fieldset>
                    <div id="divInterna" runat="server"></div>
                    <div id="divExterna" runat="server"></div>
                    <div id="divAuditoria" runat="server"></div>


                    <br />
                    <br />


                </div>
            </div>
        </form>
    </div>
    <div id="pie">
        <img src="imagenes/inferior.png" width="1024" height="100" />
    </div>

</body>
</html>
