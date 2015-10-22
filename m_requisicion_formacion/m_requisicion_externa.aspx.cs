using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.IO;
using System.Text;

namespace m_requisicion_formacion
{
    public partial class m_requisicion_externa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            trProveedor.Visible = false;
            fecha.Attributes.Add("readonly", "readonly");
            divNumPartic.Visible = false;
            divEspecificarLugar.Visible = false;
            if (dropListModalidad.SelectedValue == "1")
            {
                divNumPartic.Visible = true;
                divEspecificarLugar.Visible = true;
            }
            if (rbProveedor.SelectedValue == "1")
            {
                trProveedor.Visible = true;
            }
            if (horascheck.Checked)
            {
                horas.Enabled = false;
                minutos.Enabled = false;
                meridiano.Enabled = false;
            }
            else 
            {
                horas.Enabled = true;
                minutos.Enabled = true;
                meridiano.Enabled = true;
            
            }
        }

        protected void EnviarCorreo()
        {
            Consultas consulta = new Consultas();
            string folio = consulta.ConsultaFolio();
            string usuario = "Fernando";
            string tipo = "Externa";

            StringBuilder emailHtml = new StringBuilder(File.ReadAllText(Server.MapPath("~/plantilla/plantillaCorreo.html")));
            emailHtml.Replace("{tipo}", tipo);
            emailHtml.Replace("{folio}", folio);
            emailHtml.Replace("{usuario}", usuario);
            Correos Cr = new Correos();
            MailMessage mnsj = new MailMessage();
            try
            {
                mnsj.Subject = "Nueva requisición de capacitación";
                mnsj.To.Add(new MailAddress("fernando.aguilar@si-microcreditos.com"));
                mnsj.From = new MailAddress("robot@si-microcreditos.com", "Requisicion Capacitacion");
                mnsj.Body = emailHtml.ToString();
                mnsj.IsBodyHtml = true;
                /* Enviar */
                Cr.MandarCorreo(mnsj);
            }

            catch (Exception ex)
            {
                Response.Write("Una exepcion a ocurrido " + ex);
            }
            


        }

        protected void InsertarDatos()
        {
            int var_numParticipantes;
            string var_lugar;
            string var_proveedor ="No especificado";
            string var_hora_inicio = (horas.Text + ":" + minutos.Text + meridiano.Text).Trim();
            if (dropListModalidad.SelectedValue != "1")
            {
                var_lugar = "No aplica";
                var_numParticipantes = 0;
            }
            else
            {
                var_lugar = textEspecificar.Text.Trim();
                var_numParticipantes = Convert.ToInt32(numParticipantes.Text);
            }
            if (rbProveedor.SelectedValue == "1")
            {
                var_proveedor = txtProveedor.Text.Trim();
            }

            string sp_insert = "INSERTAR_CAPACITACION_EXTERNA";
            //Conexion a la BD
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionBD"].ToString());
            
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sp_insert, conn);
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prioridad", dropListPrioridad.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@modalidad", dropListModalidad.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@nombre", txtTema.Text.Trim());
                cmd.Parameters.AddWithValue("@fecha_inicio", fecha.Text.Trim());
                cmd.Parameters.AddWithValue("@fecha_final", fechaFinal.Text.Trim());
                if (horascheck.Checked)
                {
                    cmd.Parameters.AddWithValue("@hora_inicio", System.Data.SqlTypes.SqlDateTime.Null);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@hora_inicio", var_hora_inicio);
                }
                //Solicitante, debe ser obtenido deel cookie de sesion.
                cmd.Parameters.AddWithValue("@solicitante","Fernando");

                 //Valores a ser insertados en la tabla capacitacion_externa
                cmd.Parameters.AddWithValue("@duracion_horas", Convert.ToInt32(duracion_horas.Text.Trim()));
                cmd.Parameters.AddWithValue("@numero_participantes", var_numParticipantes);
                cmd.Parameters.AddWithValue("@lugar", var_lugar);
                cmd.Parameters.AddWithValue("@proveedor", var_proveedor);
                cmd.Parameters.AddWithValue("@viaticos", rbViaticos.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@costo", txtCosto.Text.Trim());
                cmd.ExecuteNonQuery();
                conn.Close();
              
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void enviarSolicitud_Click(object sender, EventArgs e)
        {
            try
            {
                InsertarDatos();
               // EnviarCorreo();
                ClientScript.RegisterStartupScript(this.GetType(), "showMsj", "alerta()", true); 
            }
            catch (Exception ex)
            {
                
                throw ex;
            }

            
        }
    }

}
