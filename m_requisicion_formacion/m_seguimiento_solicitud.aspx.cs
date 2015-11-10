using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;
using System.IO;

namespace m_requisicion_formacion
{
    public partial class m_seguimiento_solicitud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            divInterna.Visible = false;
            divExterna.Visible = false;
            divAuditoria.Visible = false;
            BindGrid();
            //Categoria Interna
            if (dropListCatergoria.SelectedValue == "1")
            {
                divPrincipal.Visible = false;
                divInterna.Visible = true;
                BindDataInterna();
            }
            //Categoria Externa
            if (dropListCatergoria.SelectedValue == "2")
            {
                //TODO CODE HERE
                divPrincipal.Visible = false;
                divExterna.Visible = true;
                BindDataExterna();
            }
            //Categoria Auditoria
            if (dropListCatergoria.SelectedValue == "3")
            {
                //TODO CODE HERE
                divPrincipal.Visible = false;
                divAuditoria.Visible = true;
                BindDataAuditoria();
            }
        }

        private void BindDataAuditoria()
        {
            return;
        }

        private void BindDataExterna()
        {
            return;
        }

        private void BindDataInterna()
        {
            string query = @"SELECT
                            dbo.datos_generales.id,
                            dbo.datos_generales.tipo_capacitacion,
                            dbo.datos_generales.prioridad,
                            dbo.datos_generales.modalidad,
                            dbo.datos_generales.nombre,
                            dbo.datos_generales.fecha_inicio,
                            dbo.datos_generales.hora_inicio,
                            dbo.datos_generales.solicitante,
                            dbo.capacitacion_interna.duracion_horas,
                            dbo.capacitacion_interna.numero_participantes,
                            dbo.capacitacion_interna.lugar,
                            dbo.capacitacion_interna.sala,
                            dbo.capacitacion_interna.acomodo,
                            dbo.capacitacion_interna.politicas,
                            dbo.capacitacion_interna.participantes,
                            dbo.capacitacion_interna.material_extra,
                            dbo.capacitacion_interna.coffe_break,
                            dbo.capacitacion_interna.evaluacion

                            FROM
                            dbo.datos_generales
                            INNER JOIN dbo.capacitacion_interna ON dbo.capacitacion_interna.id_datos_generales = dbo.datos_generales.id
                            ";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionBD"].ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = conn;
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            conn.Close();

        }

        //Llena la tabla de los datos generales.
        private void BindGrid()
        {
            string query = @"SELECT
                            dbo.datos_generales.id,
                            dbo.datos_generales.tipo_capacitacion,
                            dbo.datos_generales.prioridad,
                            dbo.datos_generales.modalidad,
                            dbo.datos_generales.nombre,
                            dbo.datos_generales.fecha_inicio,
                            dbo.datos_generales.fecha_final,
                            dbo.datos_generales.hora_inicio,
                            dbo.datos_generales.solicitante  
                            FROM
                            dbo.datos_generales ORDER BY id DESC";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionBD"].ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = conn;
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();
           
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            conn.Close();

        }

        //Metodo del paginado.
        protected void grdData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        //Metodo buscar por folio devuelve datos generales.
        protected void BuscarFolio(object sender, EventArgs e)
        {
            divInterna.Visible = false;
            divExterna.Visible = false;
            divAuditoria.Visible = false;
            divPrincipal.Visible = true;
            if (buscar_folio.Text == "")
            {
                return;
            }
            else
            { 
            int folio = Convert.ToInt32(buscar_folio.Text.Trim());
            
            string queryBuscarFolio = @"SELECT 
                            dbo.datos_generales.id,
                            dbo.datos_generales.tipo_capacitacion,
                            dbo.datos_generales.prioridad,
                            dbo.datos_generales.modalidad,
                            dbo.datos_generales.nombre,
                            dbo.datos_generales.fecha_inicio,
                            dbo.datos_generales.fecha_final,
                            dbo.datos_generales.hora_inicio,
                            dbo.datos_generales.solicitante  
                            FROM
                            dbo.datos_generales
                            WHERE dbo.datos_generales.id = " + folio;
            
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionBD"].ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand(queryBuscarFolio, conn);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = conn;
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();
            sda.Fill(dt);
            dt.Columns.Add("Oficinas", typeof(String));
            GridView1.DataSource = dt;
            GridView1.DataBind();
            conn.Close();
            }
        }

        //Metodo para exportar el gridView a excel.
        protected void ExportarToExcel(object sender, ImageClickEventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                GridView1.AllowPaging = false;
                this.BindGrid();

                GridView1.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in GridView1.HeaderRow.Cells)
                {
                    cell.BackColor = GridView1.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in GridView1.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = GridView1.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                GridView1.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }
        
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }





       
    }
}

