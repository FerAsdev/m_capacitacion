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
using System.Text;

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
            Consultas consulta = new Consultas();
            string folio = consulta.ConsultaFolio();
            string usuario = "Fernando";
            string tipo = "Interna";

            StringBuilder emailHtml = new StringBuilder(File.ReadAllText(Server.MapPath("~/plantilla/plantillaCorreo.html")));
            emailHtml.Replace("{tipo}", tipo);
            emailHtml.Replace("{folio}", folio);
            emailHtml.Replace("{usuario}", usuario);

            Correos Cr = new Correos();
            MailMessage mnsj = new MailMessage();
            string file1 = Server.MapPath("~/Data/") + Path.GetFileName(fileUploadPoliticas.FileName);
            string file2 = Server.MapPath("~/Data/") + Path.GetFileName(fileUploadEvaluacion.FileName);
            try
            {
                mnsj.Subject = "Solicitud de capacitación";
                mnsj.To.Add(new MailAddress("fernando.aguilar@si-microcreditos.com"));
                mnsj.From = new MailAddress("robot@si-microcreditos.com", "Formación");
                mnsj.Body = emailHtml.ToString();
                mnsj.IsBodyHtml = true;
                /* Si deseamos Adjuntar algún archivo*/
                if (File.Exists(file1)) {mnsj.Attachments.Add(new Attachment(file1)); }
                if (File.Exists(file2)) { mnsj.Attachments.Add(new Attachment(file2)); }

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

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionBD"].ToString());
            int id_requi;
            string sp_insert = "INSERTAR_CAPACITACION_INTERNA";
            Consultas consultas1 = new Consultas();
            try
            {
                SqlCommand cmd = new SqlCommand(sp_insert, conn);
                conn.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prioridad", dropListPrioridad.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@modalidad", dropListModalidad.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@nombre", txtTema.Text.Trim());
                cmd.Parameters.AddWithValue("@fecha_inicio", fecha.Text.Trim());
                cmd.Parameters.AddWithValue("@hora_inicio", var_hora_inicio);                  
                //Solicitante variable que se obtendra del cookie.
                cmd.Parameters.AddWithValue("@solicitante", "Fernando");
                
                //Datos especificos (Tabla solicitud_interna)
                cmd.Parameters.AddWithValue("@duracion_horas", Convert.ToInt32(duracion_horas.Text.Trim()));
                cmd.Parameters.AddWithValue("@numero_participantes",Convert.ToInt32(numParticipantes.Text.Trim()));
                cmd.Parameters.AddWithValue("@lugar", var_lugar);
                cmd.Parameters.AddWithValue("@sala", var_sala);
                cmd.Parameters.AddWithValue("@acomodo", var_acomodo);
                cmd.Parameters.AddWithValue("@politicas", rblPoliticas.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@participantes", var_personal);
                cmd.Parameters.AddWithValue("@material_extra", var_materialExtra);
                cmd.Parameters.AddWithValue("@coffe_break", rblCoffe.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@evaluacion", rblEvaluacion.SelectedItem.Text.Trim());
                cmd.ExecuteNonQuery();
                conn.Close();
                if (dropListLugar.SelectedValue == "1")
                {
                    SqlCommand cmd2 = new SqlCommand("select IDENT_CURRENT ('capacitacion_interna')", conn);
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

        protected void AgregarFile(object sender, EventArgs e)
        {
            //crear un archivo de tipo Fileupload desde el control del formulario
            FileUpload f = fileUploadPoliticas;
            //Si ino hay nada no se hace nada.
            if (!f.HasFile)
                return;
            //Crear un objeto tipo "Lista de objetos"
            ListItem item = new ListItem();
            //Asignamos los valores al objeto de la lista desde las propiedades del fichero
            //obtenido del fileupload
            item.Value = f.FileName;
            item.Text = f.FileName;
            //Guardamos el archivo en el servidor (de manera temporal)
            f.SaveAs(Server.MapPath("~/Data/" + item.Value));
            //Agregamos el archivo al ListBox en el formulario.
            ListFile.Items.Add(item);

        }

        protected void QuitarFile(object sender, EventArgs e)
        {
            ListBox lb = ListFile;
            //Comprobar que se selecciono algun elemento de la lista.
            if (lb.SelectedItem == null)
                return;
            BorrarArchivo(lb.SelectedItem.Value);

        }

        protected void BorrarArchivo(string fileName)
        {
            string fichero = Server.MapPath("~/Data/" + fileName);
            File.Delete(fichero);

            ListItem l = ListFile.Items.FindByValue(fileName);
            if (l != null)
            {
                ListFile.Items.Remove(l);
            }
        }

        protected void enviarSolicitud_Click(object sender, EventArgs e)
        {
            try
            {
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