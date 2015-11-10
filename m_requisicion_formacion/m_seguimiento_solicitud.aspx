<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_seguimiento_solicitud.aspx.cs" Inherits="m_requisicion_formacion.m_seguimiento_solicitud" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Seguimiento Solicitudes</title>
    <link href="CSS/intranet_estilo.css" rel="stylesheet" />
    <link href="CSS/estilo_calendario.css" rel="stylesheet" />

    <style type="text/css">

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
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <div id="busqueda" runat="server">

                    <fieldset>
                        <legend>Busqueda</legend>
                        <strong>Buscar por Folio:</strong>
                        <asp:TextBox ID="buscar_folio" runat="server" TextMode="Number" CssClass="texto" Style="margin-left: 36px" Min="1" />
                        <asp:Button Text="Buscar" runat="server" ID="btn_buscarFolio" OnClick="BuscarFolio" CssClass="botonformulario"/>
                        <br />
                        <br />
                        <strong>Buscar por Tipo:</strong>
                        <asp:DropDownList ID="dropListCatergoria" runat="server" CssClass="combobox" Style="margin-left: 40px" AutoPostBack="true">
                            <asp:ListItem Text="-Seleccione Categoria-" Value="0" />
                            <asp:ListItem Text="Capacitacion Interna" Value="1" />
                            <asp:ListItem Text="Capacitacion Externa" Value="2" />
                            <asp:ListItem Text="Capacitacion Auditoria" Value="3" />
                        </asp:DropDownList><br />
                        <br />
                        <br />
                        <br />
                        
                        <div id="divPrincipal" runat="server">
                            <h3>Seguimiento solicitud capacitaciones.</h3>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="442px">
                                       
                                         <asp:GridView ID="GridView1" runat="server"
                                            AutoGenerateColumns="false"
                                            AllowPaging="true" CellPadding="3"
                                            OnPageIndexChanging="grdData_PageIndexChanging" PagerSettings-Position="Top"
                                            PagerStyle-ForeColor="Orange"
                                            PageSize="10">
                                            
                                             
                                             <Columns>
                                                <asp:BoundField DataField="id" HeaderText="Folio" />
                                                <asp:BoundField DataField="tipo_capacitacion" HeaderText="Tipo Capacitación" />
                                                <asp:BoundField DataField="prioridad" HeaderText="Prioridad" />
                                                <asp:BoundField DataField="modalidad" HeaderText="Modalidad" />
                                                <asp:BoundField DataField="nombre" HeaderText="Nombre Capacitación" />
                                                <asp:BoundField DataField="fecha_inicio" HeaderText="Fecha Inicio" DataFormatString="{0:dd/MM/yyyy}" />
                                                <asp:BoundField DataField="fecha_final" HeaderText="Fecha Final" DataFormatString="{0:dd/MM/yyyy}" />
                                                <asp:BoundField DataField="hora_inicio" HeaderText="Hora de inicio" />
                                                <asp:BoundField DataField="solicitante" HeaderText="Solicitante" />
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Button ID="Detalles" runat="server" CausesValidation="false" 
                                                            OnClientClick='<%# Eval("id", "Javascript:window.open(\"Detalles.aspx?id={0}\")") %>' 
                                                            Text="Detalles" CssClass="botonformulario"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerSettings Position="Top" />
                                            <PagerStyle BackColor="#00B000" Font-Bold="True" ForeColor="Orange" />
                                        </asp:GridView>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <center><strong>Exportar a Excel<br />
                                </strong><br />
                            <asp:ImageButton ImageUrl="CSS/Imagenes/document_microsoft_excel_01.png" runat="server" OnClick="ExportarToExcel"
                            Height="43px" Width="50px" ToolTip="Exportar tabla a excel." CausesValidation="false" />
                        </center>
                                </div>

                        <div id="divInterna" runat="server">
                            <h3>Seguimiento solicitud capacitaciones Internas</h3>
                            
                            <!-- Gridview de muestra de datos de capacitacion interna -->
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto" Height="330px" Width="758px">
                                        <asp:GridView ID="GridView2" runat="server"
                                            AutoGenerateColumns="false"
                                            AllowPaging="true" CellPadding="3"
                                            OnPageIndexChanging="grdData_PageIndexChanging" PagerSettings-Position="Top"
                                            PagerStyle-ForeColor="Orange" DataKeyNames="id"
                                            PageSize="10">
                                            <Columns>
                                                <asp:BoundField DataField="id" HeaderText="Folio" />
                                                <asp:BoundField DataField="tipo_capacitacion" HeaderText="Tipo Capacitacion" />
                                                <asp:BoundField DataField="prioridad" HeaderText="Prioridad" />
                                                <asp:BoundField DataField="modalidad" HeaderText="Modalidad" />
                                                <asp:BoundField DataField="nombre" HeaderText="Nombre Capacitacion" />
                                                <asp:BoundField DataField="fecha_inicio" HeaderText="Fecha Inicio" DataFormatString="{0:dd/MM/yyyy}" />
                                                
                                                <asp:BoundField DataField="hora_inicio" HeaderText="Hora de inicio" />
                                                <asp:BoundField DataField="solicitante" HeaderText="Solicitante" />
                                                <asp:BoundField DataField="duracion_horas" HeaderText="Duracion Horas" />
                                                <asp:BoundField DataField="numero_participantes" HeaderText="Numero Participantes" />
                                                <asp:BoundField DataField="lugar" HeaderText="Lugar" />
                                                <asp:BoundField DataField="sala" HeaderText="Sala" />
                                                <asp:BoundField DataField="acomodo" HeaderText="Acomodo" />
                                                <asp:BoundField DataField="politicas" HeaderText="Politicas" />
                                                <asp:BoundField DataField="participantes" HeaderText="Participantes" />
                                                <asp:BoundField DataField="material_extra" HeaderText="Material Extra" />
                                                <asp:BoundField DataField="coffe_break" HeaderText="Coffe Break" />
                                                <asp:BoundField DataField="evaluacion" HeaderText="Evalucion" />
                                                
                                            </Columns>
                                            <PagerSettings Position="Top" />
                                            <PagerStyle BackColor="#009900" Font-Bold="True" ForeColor="Orange" />
                                        </asp:GridView>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>

                        <div id="divExterna" runat="server">
                            <h3>Seguimiento solicitud capacitaciones Externas.</h3>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel3" runat="server" ScrollBars="Auto" Height="330px">
                                        <asp:GridView ID="GridView3" runat="server"
                                            AutoGenerateColumns="false"
                                            AllowPaging="true" CellPadding="3"
                                            OnPageIndexChanging="grdData_PageIndexChanging" PagerSettings-Position="Top"
                                            PagerStyle-ForeColor="Orange"
                                            PageSize="10">
                                            <Columns>
                                                <asp:BoundField DataField="id" HeaderText="Folio" />
                                                <asp:BoundField DataField="tipo_capacitacion" HeaderText="Tipo Capacitacion" />
                                                <asp:BoundField DataField="prioridad" HeaderText="Prioridad" />
                                                <asp:BoundField DataField="modalidad" HeaderText="Modalidad" />
                                                <asp:BoundField DataField="nombre" HeaderText="Nombre Capacitacion" />
                                                <asp:BoundField DataField="fecha_inicio" HeaderText="Fecha Inicio" DataFormatString="{0:dd/MM/yyyy}" />
                                                <asp:BoundField DataField="fecha_final" HeaderText="Fecha Final" DataFormatString="{0:dd/MM/yyyy}" />
                                                <asp:BoundField DataField="hora_inicio" HeaderText="Hora de inicio" />
                                                <asp:BoundField DataField="solicitante" HeaderText="Solicitante" />
                                            </Columns>
                                            <PagerSettings Position="Top" />
                                            <PagerStyle BackColor="#009900" Font-Bold="True" ForeColor="Orange" />
                                        </asp:GridView>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>

                        <div id="divAuditoria" runat="server">
                            <h3>Seguimiento solicitud de Auditoria.</h3>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel4" runat="server" ScrollBars="Auto" Height="330px">
                                        <asp:GridView ID="GridView4" runat="server"
                                            AutoGenerateColumns="false"
                                            AllowPaging="true" CellPadding="3"
                                            OnPageIndexChanging="grdData_PageIndexChanging" PagerSettings-Position="Top"
                                            PagerStyle-ForeColor="Orange"
                                            PageSize="10">
                                            <Columns>
                                                <asp:BoundField DataField="id" HeaderText="Folio" />
                                                <asp:BoundField DataField="tipo_capacitacion" HeaderText="Tipo Capacitacion" />
                                                <asp:BoundField DataField="prioridad" HeaderText="Prioridad" />
                                                <asp:BoundField DataField="modalidad" HeaderText="Modalidad" />
                                                <asp:BoundField DataField="nombre" HeaderText="Nombre Capacitacion" />
                                                <asp:BoundField DataField="fecha_inicio" HeaderText="Fecha Inicio" DataFormatString="{0:dd/MM/yyyy}" />
                                                <asp:BoundField DataField="fecha_final" HeaderText="Fecha Final" DataFormatString="{0:dd/MM/yyyy}" />
                                                <asp:BoundField DataField="hora_inicio" HeaderText="Hora de inicio" />
                                                <asp:BoundField DataField="solicitante" HeaderText="Solicitante" />
                                            </Columns>
                                            <PagerSettings Position="Top" />
                                            <PagerStyle BackColor="#009900" Font-Bold="True" ForeColor="Orange" />
                                        </asp:GridView>
                                        <br />
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </fieldset>
                    <br />
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
