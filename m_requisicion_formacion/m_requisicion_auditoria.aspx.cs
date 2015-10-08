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

        protected void SelecAll(object sender, EventArgs e)
        {
           

        }

        protected void SelectNone(object sender, EventArgs e)
        {
           

        }

        protected void InsertarDatos()
        {
            //INSERT DESDE PROCEDIMIENTO ALMACENADO EN BASE DE DATOS.
            string queryInsert1 = "INSERTAR_REQUI_AUDITORIA";

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PRUEBAS"].ToString());

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(queryInsert1, conn);
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
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
                cmd.Parameters.AddWithValue("@MES", DropListMeses.SelectedItem.Text.Trim());
                cmd.Parameters.AddWithValue("@DESCRIPCION", TextDescripcion.Text.Trim());
                cmd.ExecuteNonQuery();
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

        }
    }
}