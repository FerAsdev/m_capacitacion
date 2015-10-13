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
            string var_lugar = "";
            string var_sala = "";
            string var_acomodo = "";
            string var_personal = "";

            if (dropListParticipantes.SelectedValue == "1") { var_personal = dropPersonalComercial.SelectedItem.Text.Trim(); }
            if (dropListParticipantes.SelectedValue == "2") { var_personal = "Staff: " + txtAreasStaff.Text.Trim(); }
            if (dropListParticipantes.SelectedValue == "3") { var_personal = dropListParticipantes.SelectedItem.Text.Trim(); }

            string var_materialExtra = "No Especificado";

            if (rblMaterial.SelectedValue == "1") { var_materialExtra = txtMaterialExtral.Text.Trim(); }

            if (dropListLugar.SelectedValue == "1")
            {
                var_lugar = "Oficina de Servicio";
                var_sala = "No aplica";
                var_acomodo = "No aplica";
            }
            if (dropListLugar.SelectedValue == "2")
            {
                var_lugar = dropListLugar.SelectedItem.Text.Trim();
                var_sala = dropListSala.SelectedItem.Text.Trim();
                if (dropListSala.SelectedValue != "1")
                {
                    var_acomodo = "No aplica";
                }
                else
                {
                    var_acomodo = dropListAcomodo.SelectedItem.Text.Trim();
                }

            }
            if (dropListLugar.SelectedValue == "3")
            {
                var_lugar = textEspecificar.Text.Trim();
                var_sala = "No aplica";
                var_acomodo = "No aplica";
            }

            if (dropListModalidad.SelectedValue == "2")
            {
                var_lugar = textEspecificar.Text.Trim();
                var_sala = "No aplica";
                var_acomodo = "No aplica";
            }

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PRUEBAS"].ToString());
            int id_requi;
            string queryInsert = "INSERTAR_REQUI_INTERNA";
            Consultas consultas1 = new Consultas();
            try
            {
                SqlCommand cmd = new SqlCommand(queryInsert, conn);
                conn.Open();
                cmd.CommandType = CommandType.StoredProcedure;

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
                cmd.Parameters.AddWithValue("@PARTICIPANTES", var_personal);
                cmd.Parameters.AddWithValue("@MATERIAL", var_materialExtra);
                cmd.Parameters.AddWithValue("@COFFE", rblCoffe.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@EVALUACION", rblEvaluacion.SelectedItem.Text.Trim());
                cmd.ExecuteNonQuery();
                conn.Close();
                if (dropListLugar.SelectedValue == "1")
                {
                    SqlCommand cmd2 = new SqlCommand("select IDENT_CURRENT ('requi_interna')", conn);
                    cmd2.Connection = conn;
                    conn.Open();
                    id_requi = Convert.ToInt32(cmd2.ExecuteScalar());
                    //Insertar si casilla marcada individualmente.
                    if (CheckAlamo.Checked) { consultas1.insertar1(id_requi, 15); }
                    if (CheckApizaco.Checked) { consultas1.insertar1(id_requi, 11); }
                    if (CheckCatemaco.Checked) { consultas1.insertar1(id_requi, 18); }
                    if (CheckCoatza.Checked) { consultas1.insertar1(id_requi, 28); }
                    if (CheckCordoba.Checked) { consultas1.insertar1(id_requi, 4); }
                    if (CheckFortin.Checked) { consultas1.insertar1(id_requi, 16); }
                    if (CheckHuamantla.Checked) { consultas1.insertar1(id_requi, 20); }
                    if (CheckJuanPablo.Checked) { consultas1.insertar1(id_requi, 27); }
                    if (CheckMartinez.Checked) { consultas1.insertar1(id_requi, 13); }
                    if (CheckOrizaba.Checked) { consultas1.insertar1(id_requi, 7); }
                    if (CheckPoza.Checked) { consultas1.insertar1(id_requi, 5); }
                    if (CheckPueblaSur.Checked) { consultas1.insertar1(id_requi, 22); }
                    if (CheckTejeria.Checked) { consultas1.insertar1(id_requi, 17); }
                    if (CheckTeziutlan.Checked) { consultas1.insertar1(id_requi, 12); }
                    if (CheckTlaxcala.Checked) { consultas1.insertar1(id_requi, 10); }
                    if (CheckTuxpan.Checked) { consultas1.insertar1(id_requi, 6); }
                    if (CheckVeracruz.Checked) { consultas1.insertar1(id_requi, 9); }
                    if (CheckXalapa.Checked) { consultas1.insertar1(id_requi, 8); }
                    if (CheckZacatelco.Checked) { consultas1.insertar1(id_requi, 21); }
                    conn.Close();
                }

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
                EnviarSolicitud.Enabled = false;
                InsertarDatos();
                GuardarAdjunto();
                EnviarCorreo();
                
                ClientScript.RegisterStartupScript(this.GetType(), "showMsj", "alerta()", true); 
               
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}