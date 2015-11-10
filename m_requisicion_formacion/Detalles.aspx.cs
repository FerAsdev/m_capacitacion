using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace m_requisicion_formacion
{
    public partial class Detalles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DetallesBind();
            divDetallesAuditoria.Visible = false;
            divDetallesExternos.Visible = false;
            divDetallesInternos.Visible = false;
            divInternaOficinasServicio.Visible = false;
            if (Label2.Text == "Interna") 
            {
                divDetallesInternos.Visible = true;
                DetalleSolicitudInterna();
                if (LabelInterna3.Text == "Oficina de Servicio")
                {
                    divInternaOficinasServicio.Visible = true;
                    BindDatListOficina();
                }
            }
            if (Label2.Text == "Externa") 
            {
                divDetallesExternos.Visible = true;
                DetallesSolicitudExterna();
            }
            if (Label2.Text == "Auditoria") 
            {
                divDetallesAuditoria.Visible = true;
                DetallesAuditoria();
            }




        }

        private void DetallesSolicitudExterna()
        {
            Int32 id = Convert.ToInt32(Request.QueryString["id"]);
            string query = @"SELECT
                            dbo.capacitacion_externa.duracion_horas,
                            dbo.capacitacion_externa.numero_participantes,
                            dbo.capacitacion_externa.lugar,
                            dbo.capacitacion_externa.proveedor,
                            dbo.capacitacion_externa.viaticos,
                            dbo.capacitacion_externa.costo
                            FROM
                            dbo.capacitacion_externa 
                            WHERE id_datos_generales = " + id;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionBD"].ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Connection = conn;
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                LabelExternos1.Text = sdr["duracion_horas"].ToString();
                LabelExternos2.Text = sdr["numero_participantes"].ToString();
                LabelExternos3.Text = sdr["lugar"].ToString();
                LabelExternos4.Text = sdr["proveedor"].ToString();
                LabelExternos5.Text = sdr["viaticos"].ToString();
                LabelExternos6.Text = sdr["costo"].ToString();
            }
            sdr.Close();
        }

        private void BindDatListOficina()
        {
           
            Int32 id = Convert.ToInt32(Request.QueryString["id"]);
            string query = @"SELECT

                        dbo.siuc_oficinas.oficina

                        FROM
                        dbo.cap_interna_x_oficinas
                        INNER JOIN dbo.capacitacion_interna ON dbo.cap_interna_x_oficinas.id_capacitacion_interna = dbo.capacitacion_interna.id
                        INNER JOIN dbo.siuc_oficinas ON dbo.cap_interna_x_oficinas.id_oficina = dbo.siuc_oficinas.id_oficina
                        WHERE id_datos_generales =" + id;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionBD"].ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Connection = conn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataListOficinas.DataSource = dt;
            dataListOficinas.DataBind();
            conn.Close();
            
        }

        protected void DetallesBind()
        {
            Int32 id = Convert.ToInt32(Request.QueryString["id"]);
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
                            dbo.datos_generales WHERE ID = "+id;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionBD"].ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Connection = conn;
            SqlDataReader sdr = cmd.ExecuteReader();

            while (sdr.Read())
            {
                Label1.Text = sdr["id"].ToString();
                Label2.Text = sdr["tipo_capacitacion"].ToString();
                Label3.Text = sdr["prioridad"].ToString();
                Label4.Text = sdr["modalidad"].ToString();
                Label5.Text = sdr["nombre"].ToString();
                Label6.Text = sdr["fecha_inicio"].ToString();
                Label7.Text = sdr["fecha_final"].ToString();
                Label8.Text = sdr["hora_inicio"].ToString();
                Label9.Text = sdr["solicitante"].ToString();
            }
            sdr.Close();
            conn.Close();


        }

        protected void DetalleSolicitudInterna()
        {
            Int32 id = Convert.ToInt32(Request.QueryString["id"]);
            string query = @"SELECT
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
                            dbo.capacitacion_interna WHERE id_datos_generales ="+id;


            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionBD"].ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Connection = conn;
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                LabelInterna1.Text = sdr["numero_participantes"].ToString();
                LabelInterna2.Text = sdr["duracion_horas"].ToString();
                LabelInterna3.Text = sdr["lugar"].ToString();
                LabelInterna4.Text = sdr["sala"].ToString();
                LabelInterna5.Text = sdr["acomodo"].ToString();
                LabelInterna6.Text = sdr["politicas"].ToString();
                LabelInterna7.Text = sdr["participantes"].ToString();
                LabelInterna8.Text = sdr["material_extra"].ToString();
                LabelInterna9.Text = sdr["coffe_break"].ToString();
                LabelInterna10.Text = sdr["evaluacion"].ToString();

                }
            sdr.Close();
            conn.Close();

        }

        protected void DetallesAuditoria()
        {
            Int32 id = Convert.ToInt32(Request.QueryString["id"]);
            string query = @"SELECT
                            dbo.siuc_oficinas.oficina,
                            dbo.capacitacion_auditoria.descripcion,
                            dbo.capacitacion_auditoria.mes

                            FROM
                            dbo.siuc_oficinas
                            INNER JOIN dbo.cap_auditoria_x_oficinas ON dbo.cap_auditoria_x_oficinas.id_oficina = dbo.siuc_oficinas.id_oficina
                            INNER JOIN dbo.capacitacion_auditoria ON dbo.cap_auditoria_x_oficinas.id_capacitacion_auditoria = dbo.capacitacion_auditoria.id
                            AND id_datos_generales =" + id;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionBD"].ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Connection = conn;
            SqlDataReader sdr = cmd.ExecuteReader();
             while (sdr.Read())
             {
                 LabelMesAuditoria.Text = sdr["mes"].ToString();
                 AuditoriaDescripcion.Text = sdr["descripcion"].ToString();                
             }
             sdr.Close();
             SqlDataAdapter da = new SqlDataAdapter(cmd);
             DataTable dt = new DataTable();
             da.Fill(dt);
             dataList.DataSource = dt;
             dataList.DataBind();
             conn.Close();
        }

        protected void imprimir(object sender, EventArgs e)
        {
            Response.Write("<script>window.print()</script>");
        }




    }
}