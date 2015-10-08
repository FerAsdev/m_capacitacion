using System;
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
            divOficinas.Visible = false;
            trStaff.Visible = false;
            trPersonalOficina.Visible = false;
            trMaterialExtra.Visible = false;
            fecha.Attributes.Add("readonly", "readonly");

            if (dropListModalidad.SelectedValue == "1")
            {
                divDatosPresencial.Visible = true;
                divLugar.Visible = true;
                dropListLugar.Visible = true;
                divEspecificarOficina.Visible = false;

                if (dropListLugar.SelectedValue == "1") { divOficinas.Visible = true; }
                if (dropListLugar.SelectedValue == "3") { divEspecificarOficina.Visible = true; }
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
            if (dropListParticipantes.SelectedValue == "1") { trPersonalOficina.Visible = true; }
            if (dropListParticipantes.SelectedValue == "2") { trStaff.Visible = true; }
            if (rblMaterial.SelectedValue == "1") { trMaterialExtra.Visible = true; }

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
                if (File.Exists(file1))
                {
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

        protected void InsertarDatos()
        {
            string var_hora_inicio = (horas.Text + ":" + minutos.Text + meridiano.Text).Trim();
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
            string queryInsert;
            if (dropListLugar.SelectedValue == "1") 
            {
                queryInsert = "INSERTAR_REQUI_INTERNA_OFICINAS"; 
            } 
            else 
            {
                queryInsert = "INSERTAR_REQUI_INTERNA"; 
                
            }




            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PRUEBAS"].ToString());
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(queryInsert, conn);
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                if (dropListLugar.SelectedValue == "1")
                {
                    //Datos de la tabla estado oficinas.
                    cmd.Parameters.AddWithValue("@ALAMO", CheckBox1.Checked);
                    cmd.Parameters.AddWithValue("@APIZACO", CheckBox2.Checked);
                    cmd.Parameters.AddWithValue("@CATEMACO", CheckBox3.Checked);
                    cmd.Parameters.AddWithValue("@COATZACOALCOS", CheckBox4.Checked);
                    cmd.Parameters.AddWithValue("@CORDOBA", CheckBox5.Checked);
                    cmd.Parameters.AddWithValue("@FORTIN", CheckBox6.Checked);
                    cmd.Parameters.AddWithValue("@HUAMANTLA", CheckBox7.Checked);
                    cmd.Parameters.AddWithValue("@JUAN_PABLO", CheckBox8.Checked);
                    cmd.Parameters.AddWithValue("@MARTINEZ", CheckBox9.Checked);
                    cmd.Parameters.AddWithValue("@ORIZABA", CheckBox10.Checked);
                    cmd.Parameters.AddWithValue("@POZA_RICA", CheckBox11.Checked);
                    cmd.Parameters.AddWithValue("@PUEBLA_SUR", CheckBox12.Checked);
                    cmd.Parameters.AddWithValue("@TEJERIA", CheckBox13.Checked);
                    cmd.Parameters.AddWithValue("@TEZIUTLAN", CheckBox14.Checked);
                    cmd.Parameters.AddWithValue("@TLAXCALA", CheckBox15.Checked);
                    cmd.Parameters.AddWithValue("@TUXPAN", CheckBox16.Checked);
                    cmd.Parameters.AddWithValue("@VERACRUZ", CheckBox17.Checked);
                    cmd.Parameters.AddWithValue("@XALAPA", CheckBox18.Checked);
                    cmd.Parameters.AddWithValue("@ZACATELCO", CheckBox19.Checked);
                }
                //Datos de la tabla Requi Interna
                cmd.Parameters.AddWithValue("@PRIORIDAD", dropListPrioridad.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@MODALIDAD", dropListModalidad.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@TEMA", txtTema.Text.Trim());
                cmd.Parameters.AddWithValue("@FECHA", fecha.Text.Trim());
                cmd.Parameters.AddWithValue("@HORA_INICIO", var_hora_inicio);
                cmd.Parameters.AddWithValue("@DURACION", duracion_horas.Text.Trim());
                cmd.Parameters.AddWithValue("@NUMERO_PARTICIPANTES", numParticipantes.Text.Trim());
                cmd.Parameters.AddWithValue("@LUGAR", var_lugar);
                cmd.Parameters.AddWithValue("@SALA", var_sala);
                cmd.Parameters.AddWithValue("@ACOMODO", var_acomodo);
                cmd.Parameters.AddWithValue("@POLITICAS", rblPoliticas.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@PARTICIPANTES", dropListParticipantes.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@MATERIAL", rblMaterial.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@COFFE", rblCoffe.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@EVALUACION", rblEvaluacion.SelectedItem.Text.Trim());

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
                GuardarAdjunto();
                EnviarCorreo();
                Response.Redirect("/Exito.aspx");
            }
            catch (Exception ex)
            {
                
                throw ex;
            }

           

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {

        }

    }
}