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
    public partial class m_requisicion_auditoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertarDatos()
        {
            //INSERT DESDE PROCEDIMIENTO ALMACENADO EN BASE DE DATOS.
            string queryInsert1 = "INSERTAR_REQUI_AUDITORIA";
            int id_requi;
            Consultas insertar = new Consultas();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PRUEBAS"].ToString());

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(queryInsert1, conn);
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MES", DropListMeses.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@DESCRIPCION", TextDescripcion.Text.Trim());
                cmd.ExecuteNonQuery();
                conn.Close();
                SqlCommand cmd2 = new SqlCommand("select IDENT_CURRENT ('REQUI_AUDITORIA')", conn);
                cmd2.Connection = conn;
                conn.Open();
                id_requi = Convert.ToInt32(cmd2.ExecuteScalar());
                //Insert de los check list.
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

        protected void EnviarSolicitud(object sender, EventArgs e)
        {
            InsertarDatos();            
            ClientScript.RegisterStartupScript(this.GetType(), "showMsj", "alerta()", true);        
            

        }
    }
}