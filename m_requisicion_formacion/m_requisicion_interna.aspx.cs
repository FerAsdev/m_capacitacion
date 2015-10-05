﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.IO;

namespace m_requisicion_formacion
{
    public partial class m_requisicion_interna : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            divDatosPresencial.Visible = false;
            divEspecificarOficina.Visible = false;
            divEspecificarSala.Visible = false;
            divTipoAcomodo.Visible = false;
            divLugar.Visible = false;
            fecha.Attributes.Add("readonly", "readonly");

            if (dropListModalidad.SelectedValue == "1")
            {
                divDatosPresencial.Visible = true;
                divLugar.Visible = true;
                dropListLugar.Visible = true;

                divEspecificarOficina.Visible = false;

                if (dropListLugar.SelectedValue == "1" || dropListLugar.SelectedValue == "3")
                {
                    divEspecificarOficina.Visible = true;
                }
                if (dropListLugar.SelectedValue == "2")
                {
                    divEspecificarSala.Visible = true;
                    if (dropListSala.SelectedValue == "1")
                    {
                        divTipoAcomodo.Visible = true;
                    }

                }
            }
            if (dropListModalidad.SelectedValue == "2")
            {
                divDatosPresencial.Visible = true;
                divEspecificarOficina.Visible = true;

                divLugar.Visible = false;
                divEspecificarSala.Visible = false;
                divTipoAcomodo.Visible = false;
                dropListLugar.Visible = false;

            }
        }

        protected void GuardarAdjunto()
        {
            if (fileUploadPoliticas.HasFile)
            {
                try
                {
                    string nombreArchivo1 = Path.GetFileName(fileUploadPoliticas.FileName);
                    fileUploadPoliticas.SaveAs(Server.MapPath("~/Data/") + nombreArchivo1);

                }
                catch (Exception ex)
                {
                    string error = "Problema en la subida";
                    error += ex.Message;
                    throw new Exception(error);
                }


            }
            if (fileUploadEvaluacion.HasFile)
            {
                try
                {
                    string nombreArchivo2 = Path.GetFileName(fileUploadEvaluacion.FileName);
                    fileUploadEvaluacion.SaveAs(Server.MapPath("~/Data/") + nombreArchivo2);

                }
                catch (Exception ex)
                {
                    string error = "Problema en la subida";
                    error += ex.Message;
                    throw new Exception(error);
                }


            }
        }

        protected void EnviarCorreo()
        {
            Correos Cr = new Correos();
            MailMessage mnsj = new MailMessage();
            string file1 = Server.MapPath("~/Data/") + Path.GetFileName(fileUploadPoliticas.FileName);
            string file2 = Server.MapPath("~/Data/") + Path.GetFileName(fileUploadEvaluacion.FileName);
            try
            {
                mnsj.Subject = "Nueva requisición de capacitación";
                mnsj.To.Add(new MailAddress("fernando.aguilar@si-microcreditos.com"));
                mnsj.From = new MailAddress("robot@si-microcreditos.com", "Requisicion Capacitacion");
                mnsj.Body = "Se a recibido una nueva requisición de capacitación en la intranet de tipo Interna";
                /* Si deseamos Adjuntar algún archivo*/
                if (File.Exists(file1)) {
                    mnsj.Body = "Se recibio uno o varios archivos adjuntos.";
                    mnsj.Attachments.Add(new Attachment(file1));
                    
                }
                if (File.Exists(file2)) { mnsj.Attachments.Add(new Attachment(file2)); }
                /* Enviar */
                Cr.MandarCorreo(mnsj);
                mnsj.Dispose();
            }
            catch (Exception ex)
            {
                Response.Write("Una exepcion a ocurrido " + ex);
            }
            finally
            {
                //Eliminando archivos subidos al servidor.
                if (File.Exists(file1)) { File.Delete(file1); }
                if (File.Exists(file2)) { File.Delete(file2); }
            }
        }

        protected void enviarSolicitud_Click(object sender, EventArgs e)
        {
            //Declaracion de variables para uso en consultas de base datos.
            string var_prioridad = dropListPrioridad.SelectedItem.Text.Trim();
            string var_modalidad = dropListModalidad.SelectedItem.Text.Trim();
            string var_fecha = fecha.Text.Trim();
            string var_hora_inicio = (horas.Text + ":" + minutos.Text + meridiano.Text).Trim();
            string var_duracion = duracion_horas.Text.Trim();
            string var_numParticipantes = numParticipantes.Text.Trim();
            string var_lugar;
            string var_sala;
            string var_acomodo;
            if (dropListLugar.SelectedValue != "2")
            {
                var_lugar = textEspecificar.Text.Trim();
                var_sala = "No aplica";
                var_acomodo = "No aplica";
            }
            else
            {
                var_lugar = dropListLugar.SelectedItem.Text.Trim();
                var_sala = dropListSala.SelectedItem.Text.Trim();
                var_acomodo = dropListAcomodo.SelectedItem.Text.Trim();
            }
            string var_politicas = rblPoliticas.SelectedItem.Text.Trim();
            string var_participantes = dropListParticipantes.SelectedItem.Text.Trim();
            string var_material = rblMaterial.SelectedItem.Text.Trim();
            string var_coffe = rblCoffe.SelectedItem.Text.Trim();
            string var_evaluacion = rblEvaluacion.SelectedItem.Text.Trim();


            string queryInsert1 = "INSERT INTO DATOS_REQUISICION  VALUES(@PRIORIDAD, @MODALIDAD, @FECHA, @HORA_INICIO, @DURACION, @NUM_PARTICIPANTES, @LUGAR, @SALA, @ACOMODO, @POLITICAS, @PARTICIPANTES, @MATERIAL, @COFFE, @EVALUACION)";

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PRUEBAS"].ToString());
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(queryInsert1, conn);
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@PRIORIDAD", var_prioridad);
                cmd.Parameters.AddWithValue("@MODALIDAD", var_modalidad);
                cmd.Parameters.AddWithValue("@FECHA", var_fecha);
                cmd.Parameters.AddWithValue("@HORA_INICIO", var_hora_inicio);
                cmd.Parameters.AddWithValue("@DURACION", var_duracion);
                cmd.Parameters.AddWithValue("@NUM_PARTICIPANTES", var_numParticipantes);
                cmd.Parameters.AddWithValue("@LUGAR", var_lugar);
                cmd.Parameters.AddWithValue("@SALA", var_sala);
                cmd.Parameters.AddWithValue("@ACOMODO", var_acomodo);
                cmd.Parameters.AddWithValue("@POLITICAS", var_politicas);
                cmd.Parameters.AddWithValue("@PARTICIPANTES", var_participantes);
                cmd.Parameters.AddWithValue("@MATERIAL", var_material);
                cmd.Parameters.AddWithValue("@COFFE", var_coffe);
                cmd.Parameters.AddWithValue("@EVALUACION", var_evaluacion);
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
                GuardarAdjunto();
                EnviarCorreo();

                Response.Redirect("/Exito.aspx");
            }
        }
    }
}