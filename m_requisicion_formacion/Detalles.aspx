<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="m_requisicion_formacion.Detalles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detalles solicitud</title>

    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 13px;
            margin-left: 3%;
        }


        .auto-style5 {
            width: 229px;
        }


        .auto-style6 {
            width: 100%;
        }

        .auto-style7 {
            width: 250px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <img src="CSS/Imagenes/Banner%20header%202.PNG" style="display: block; margin-left: auto; margin-right: auto" />
        <h1 style="text-align: center">Detalles de Solicitud de Capacitación.</h1>
        <h2 style="text-align: center">Detalles Generales.</h2>
        <!--Detalles generales de solicitud.-->
        <div>
            <table>
                <tr>
                    <td class="auto-style7">
                        <strong>Folio:</strong>
                        <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <strong>Solicitante: </strong>
                        <asp:Label ID="Label9" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <strong>Nombre de Capacitación: </strong>

                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="Label5" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <strong>Modalidad: </strong>
                        <asp:Label ID="Label4" runat="server" Text=" "></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <strong>Prioridad: </strong>
                        <asp:Label ID="Label3" runat="server" Text=" "></asp:Label>
                    </td>
                    <td>
                        <strong>Tipo de Capacitación:</strong>
                        <asp:Label ID="Label2" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <strong>Fecha de Inicio: </strong>
                        <asp:Label ID="Label6" runat="server" Text=" "></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <strong>Fecha Final: </strong>
                        <asp:Label ID="Label7" runat="server" Text=" "></asp:Label>
                    </td>
                    <td>
                        <strong>Hora de inicio: </strong>
                        <asp:Label ID="Label8" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>

            </table>
        </div>
        <h2 style="text-align: center">Detalles Especificos.</h2>
        <!--Datos especificos solicitud Internos-->
        <div id="divDetallesInternos" runat="server">
            <table class="auto-style6">
                <tr>
                    <td class="auto-style7">
                        <strong>Número de participantes:</strong>
                    </td>
                    <td>
                        <asp:Label ID="LabelInterna1" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <strong>Duración en horas:</strong>
                    </td>
                    <td>
                        <asp:Label ID="LabelInterna2" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <strong>Lugar:</strong>
                    </td>
                    <td>
                        <asp:Label ID="LabelInterna3" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <strong>Sala:</strong>
                    </td>
                    <td>
                        <asp:Label ID="LabelInterna4" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <strong>Acomodo:</strong>
                    </td>
                    <td>
                        <asp:Label ID="LabelInterna5" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <strong>Personal a participar: </strong>
                    </td>
                    <td>
                        <asp:Label ID="LabelInterna7" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <strong>¿Politicas Especiales?:</strong>
                    </td>
                    <td>
                        <asp:Label ID="LabelInterna6" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <strong>¿Se requiere material extra?</strong>

                    </td>
                    <td>
                        <asp:Label ID="LabelInterna8" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <strong>¿Se requiere Coffe Break? </strong>

                    </td>
                    <td>
                        <asp:Label ID="LabelInterna9" runat="server" Text=" "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <strong>¿Se requiere Evaluacion? </strong>
                    </td>
                    <td>
                        <asp:Label ID="LabelInterna10" runat="server" Text=" "></asp:Label>
                    </td>

                </tr>
            </table>
            <div id="divInternaOficinasServicio" runat="server">
                <h3>Oficinas de servicio participantes:</h3>
                <asp:DataList ID="dataListOficinas" runat="server" RepeatColumns="5"
                    RepeatDirection="Horizontal"
                    RepeatLayout="Table" CellPadding="3">
                    <ItemTemplate>

                        <table>
                            <tr>
                                <td><%#DataBinder.Eval(Container.DataItem, "oficina")%></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </div>

        </div>
        <!--Datos especificos solicitud Externos-->
        <div id="divDetallesExternos" runat="server">
            <table>
                <tr>
                    <td class="auto-style7"><strong>Duración en horas:</strong></td>
                    <td>
                        <asp:Label ID="LabelExternos1" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style7"><strong>Número de participantes:</strong></td>
                    <td>
                        <asp:Label ID="LabelExternos2" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style7"><strong>Lugar:</strong></td>
                    <td>
                        <asp:Label ID="LabelExternos3" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style7"><strong>Proveedor:</strong></td>
                    <td>
                        <asp:Label ID="LabelExternos4" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style7"><strong>¿Se requieren viaticos?</strong></td>
                    <td>
                        <asp:Label ID="LabelExternos5" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style7"><strong>Costo aproximado:</strong></td>
                    <td>
                        <asp:Label ID="LabelExternos6" runat="server" Text="Label"></asp:Label></td>
                </tr>


            </table>



        </div>
        <!--Datos especificos solicitud Auditoria-->
        <div id="divDetallesAuditoria" runat="server">
            <asp:Label Text="Mes de solicitud: " runat="server" Font-Bold="true" Font-Size="15px" />
            <asp:Label Text=" " runat="server" ID="LabelMesAuditoria" Font-Size="14px" />
            <h3>Oficinas de servicio. </h3>
            <asp:DataList ID="dataList" runat="server" RepeatColumns="5"
                RepeatDirection="Horizontal"
                RepeatLayout="Table" CellPadding="3">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td><strong><%#DataBinder.Eval(Container.DataItem, "oficina")%></strong></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <h3>Descripcion de la solicitud.</h3>
            <asp:Label ID="AuditoriaDescripcion" runat="server" Text=" "></asp:Label>
            <asp:Label ID="TextDescripcion" runat="server" Text=" " Width="690px"></asp:Label>

        </div>
        <br />
        <br />
        <asp:ImageButton ImageUrl="CSS/Imagenes/icono_imprimir_up.jpg" runat="server" OnClick="imprimir" />
        &nbsp;</form>
</body>
</html>
