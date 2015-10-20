using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;
using System.Net.Mail;
using System.IO;

namespace m_requisicion_formacion
{
    public partial class m_requisicion_auditoria : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EnviarCorreo()
        {
            Consultas consulta = new Consultas();
            string folio = consulta.ConsultaFolio(3);
            //Usuario es obtenido de la cookie (Estatico por ahora).
            string usuario = "Fernando";
            string tipo = "Auditoria";
            //Se abre una plantilla en formato HTML para ser enviada por correo.
            StringBuilder emailHtml = new StringBuilder(File.ReadAllText(Server.MapPath("~/plantilla/plantillaCorreo.html")));
            //Remplazamos las variables de la plantilla.
            emailHtml.Replace("{tipo}", tipo);
            emailHtml.Replace("{folio}", folio);
            emailHtml.Replace("{usuario}", usuario);

            Correos Cr = new Correos();
            MailMessage mensaje = new MailMessage();
            mensaje.Subject = "Solicitud de capacitación";
            mensaje.To.Add(new MailAddress("fernando.aguilar@si-microcreditos.com"));
            mensaje.From = new MailAddress("robot@si-microcreditos.com", "Formación");
            mensaje.Body = emailHtml.ToString();
            //Se indica que el contenido del mensaje es formato HTML
            mensaje.IsBodyHtml = true;

            foreach (ListItem li in ListFile.Items)
            {
                string fichero = Server.MapPath("~/Data/" + li.Value);
                mensaje.Attachments.Add(new System.Net.Mail.Attachment(fichero));

            }
            try
            {
                Cr.MandarCorreo(mensaje);
                mensaje.Dispose();
            }
            catch (Exception ex)
            {
                Response.Write("Una exepcion a ocurrido " + ex);
            }
            while (ListFile.Items.Count > 0)
            {
                BorrarArchivo(ListFile.Items[0].Value);
            }

        }

        protected void InsertarDatos()
        {
            //INSERT DESDE PROCEDIMIENTO ALMACENADO EN BASE DE DATOS.
            string sp_Insert = "INSERTAR_CAPACITACION_AUDITORIA";
            int id_requi;
            Consultas insertar = new Consultas();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionBD"].ToString());

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sp_Insert, conn);
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                //El Solicitante sera asigando desde el usuraio de la cookie.
                cmd.Parameters.AddWithValue("@solicitante", "Fernando");
                cmd.Parameters.AddWithValue("@mes", DropListMeses.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@descripcion", TextDescripcion.Text.Trim());
                cmd.ExecuteNonQuery();
                conn.Close();

                SqlCommand cmd2 = new SqlCommand("SELECT IDENT_CURRENT ('capacitacion_auditoria')", conn);
                cmd2.Connection = conn;
                conn.Open();
                id_requi = Convert.ToInt32(cmd2.ExecuteScalar());
                //Inserta en la tabla auxiliar verifiacando si cada casilla esta marcada.
                //esto desde un metodo en la clase de Consultas.cs donde recive dos parametros
                //El ID del insert y el ID de la oficina.
                if (CheckAlamo.Checked) { insertar.insertarOfiAud(id_requi, 15); }
                if (CheckApizaco.Checked) { insertar.insertarOfiAud(id_requi, 11); }
                if (CheckCatemaco.Checked) { insertar.insertarOfiAud(id_requi, 18); }
                if (CheckCoatza.Checked) { insertar.insertarOfiAud(id_requi, 28); }
                if (CheckCordoba.Checked) { insertar.insertarOfiAud(id_requi, 4); }
                if (CheckFortin.Checked) { insertar.insertarOfiAud(id_requi, 16); }
                if (CheckHuamantla.Checked) { insertar.insertarOfiAud(id_requi, 20); }
                if (CheckJuanPablo.Checked) { insertar.insertarOfiAud(id_requi, 27); }
                if (CheckMartinez.Checked) { insertar.insertarOfiAud(id_requi, 13); }
                if (CheckOrizaba.Checked) { insertar.insertarOfiAud(id_requi, 7); }
                if (CheckPoza.Checked) { insertar.insertarOfiAud(id_requi, 5); }
                if (CheckPueblaSur.Checked) { insertar.insertarOfiAud(id_requi, 22); }
                if (CheckTejeria.Checked) { insertar.insertarOfiAud(id_requi, 17); }
                if (CheckTeziutlan.Checked) { insertar.insertarOfiAud(id_requi, 12); }
                if (CheckTlaxcala.Checked) { insertar.insertarOfiAud(id_requi, 10); }
                if (CheckTuxpan.Checked) { insertar.insertarOfiAud(id_requi, 6); }
                if (CheckVeracruz.Checked) { insertar.insertarOfiAud(id_requi, 9); }
                if (CheckXalapa.Checked) { insertar.insertarOfiAud(id_requi, 8); }
                if (CheckZacatelco.Checked) { insertar.insertarOfiAud(id_requi, 21); }
                conn.Close();

            }
            catch (Exception ex)
            {

                throw ex;
            }


        }

        protected void AgregarFile(object sender, EventArgs e)
        {
            //crear un archivo de tipo Fileupload desde el control del formulario
            FileUpload f = FileReprote;
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

        protected void EnviarSolicitud(object sender, EventArgs e)
        {
            try
            {
                InsertarDatos();
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