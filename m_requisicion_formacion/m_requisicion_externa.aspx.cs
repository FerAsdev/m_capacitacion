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

namespace m_requisicion_formacion
{
    public partial class m_requisicion_externa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            fecha.Attributes.Add("readonly", "readonly");
            divNumPartic.Visible = false;
            divEspecificarLugar.Visible = false;
            if (dropListModalidad.SelectedValue == "1")
            {
                divNumPartic.Visible = true;
                divEspecificarLugar.Visible = true;
            }
        }

        protected void EnviarCorreo()
        {
            Correos Cr = new Correos();
            MailMessage mnsj = new MailMessage();
            
            try
            {
                mnsj.Subject = "Nueva requisición de capacitación";
                mnsj.To.Add(new MailAddress("fernando.aguilar@si-microcreditos.com"));
                mnsj.From = new MailAddress("robot@si-microcreditos.com", "Requisicion Capacitacion");
                mnsj.Body = "Se a recibido una nueva requisición de capacitación de tipo Externa en la intranet.";

                /* Enviar */
                Cr.MandarCorreo(mnsj);


            }

            catch (Exception ex)
            {
                Response.Write("Una exepcion a ocurrido " + ex);
            }
            


        }

        protected void enviarSolicitud_Click(object sender, EventArgs e)
        {
            string var_numParticipantes;
            string var_lugar;
            if (dropListModalidad.SelectedValue != "1")
            {
                var_lugar = "No aplica";
                var_numParticipantes = "No Especificado";
            }
            else
            {
                var_lugar = textEspecificar.Text.Trim();
                var_numParticipantes = numParticipantes.Text.Trim();
            }
            //Conexion a la BD
            string query_insert = "INSERT INTO REQUI_EXTERNA (PRIORIDAD, MODALIDAD, FECHA, HORA_INICIO, DURACION_HORAS, NUM_PARTICIPANTES, LUGAR, PROVEEDOR, VIATICOS, COSTO_APROX) VALUES (@PRIORIDAD, @MODALIDAD, @FECHA, @HORA_INICIO, @DURACION_HORAS, @NUM_PARTICIPANTES, @LUGAR, @PROVEEDOR, @VIATICOS, @COSTO_APROX)";

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PRUEBAS"].ToString());
            
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query_insert, conn);
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@PRIORIDAD", dropListPrioridad.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@MODALIDAD", dropListModalidad.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@FECHA", fecha.Text.Trim());
                cmd.Parameters.AddWithValue("@HORA_INICIO", hora_inicio.Text.Trim());
                cmd.Parameters.AddWithValue("@DURACION_HORAS", duracion_horas.Text.Trim());
                cmd.Parameters.AddWithValue("@NUM_PARTICIPANTES", var_numParticipantes);
                cmd.Parameters.AddWithValue("@LUGAR", var_lugar);
                cmd.Parameters.AddWithValue("@PROVEEDOR", rbProveedor.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@VIATICOS", rbViaticos.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@COSTO_APROX", txtCosto.Text.Trim());
                cmd.ExecuteNonQuery();

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Fetch Error: ";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                conn.Close();
                EnviarCorreo();
                Response.Redirect("Exito.aspx");
            }

        }

    }
}