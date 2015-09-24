<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_requisicion_interna.aspx.cs" Inherits="m_requisicion_formacion.m_requisicion_interna" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <div id="encabezado">
        <div id="logo"></div>
        <div id="relleno"></div>
    </div>
    <br />
    <br />
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <fieldset id="fieldSetdatosGenerales">
                        <legend>Datos Generales</legend>
                        <table>
                            <tr>
                                <td>Prioridad</td>
                                <td>
                                    <asp:DropDownList ID="prioridad" runat="server">
                                        <asp:ListItem Text="Programada" />
                                        <asp:ListItem Text="Urgente" />
                                        <asp:ListItem Text="Extra Urgente" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Modalidad</td>
                                <td>
                                    <asp:DropDownList ID="modalidad" runat="server" AutoPostBack="true">
                                        <asp:ListItem Text="-Seleccione modalidad-" Value="0" Selected="True" />
                                        <asp:ListItem Text="Presencial" Value="1" />
                                        <asp:ListItem Text="En Linea" Value="2" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <!-- Div Activa al seleccionar modalidad Presencial -->
                        <div id="presencial" runat="server">
                            <h2>Presencial</h2>
                            <table>
                                <tr>
                                    <td>Numero Participantes</td>
                                    <td>
                                        <asp:TextBox ID="pNumeroParticipantes" runat="server" TextMode="Number" />
                                    </td>
                                    <td>Fecha</td>
                                    <td>
                                        <asp:TextBox runat="server" ID="TextBox1" />
                                    </td>
                                    <td>Hora</td>
                                    <td>
                                        <asp:TextBox runat="server" ID="TextBox2" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Lugar</td>
                                    <td>
                                        <asp:DropDownList ID="dropLugar" runat="server" AutoPostBack="true">
                                            <asp:ListItem Text="-Seleccione Lugar-" Selected="True" />
                                            <asp:ListItem Text="Oficina de servicio" Value="1" />
                                            <asp:ListItem Text="Corporativo" Value="2" />
                                            <asp:ListItem Text="Otro" Value="3" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>

                        </div>
                        <!-- Div Activa al seleccionar modalidad En Linea -->
                        <div id="enLinea" runat="server">
                            <h2>En Linea</h2>

                        </div>
                        <!-- Div Activa al seleccionar lugar Oficina de servicio -->
                        <div id="divOficinaServicio" runat="server">
                            <table>
                                <tr>
                                    <td>Especificar</td>
                                    <td>
                                        <asp:TextBox runat="server" />
                                    </td>
                                </tr>
                            </table>

                        </div>
                        <!-- Div Activa al seleccionar lugar Corporativo -->
                        <div id="divCorporativo" runat="server">
                            <table>
                                <tr>
                                    <td>Especificar Sala</td>
                                    <td>
                                        <asp:DropDownList ID="dropSala" runat="server" AutoPostBack="true">
                                            <asp:ListItem Text="-Selecione Sala-" Value="0" Selected="True" />
                                            <asp:ListItem Text="Auditorio" Value="1" />
                                            <asp:ListItem Text="Pecera" Value="2" />
                                            <asp:ListItem Text="Sala De Juntas" Value="3" />
                                            <asp:ListItem Text="Sala De Capacitación" Value="4" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                            <div id="divAuditorio" runat="server">
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
                </fieldset>
                <!--Field Set Datos Especificos -->
                <fieldset id="fieldSetDatosEspecificos">
                    <legend>Datos Especificos</legend>

                </fieldset>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>
