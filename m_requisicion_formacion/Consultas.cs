using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace m_requisicion_formacion
{
    public class Consultas
    {
        //Insert la relacion de muchos a muchos en la tabla auxiliar de
        //siuc_oficinas y capacitacion_interna
        public void insertar1(Int32 id_requi, Int32 id_oficina)
        {
            string queryInsertar = @"INSERT INTO cap_interna_x_oficinas (id_capacitacion_interna, id_oficina) 
                                    VALUES(@id_requi, @id_oficina)";

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionBD"].ToString());
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(queryInsertar, conn);
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@id_requi", id_requi);
                cmd.Parameters.AddWithValue("@id_oficina", id_oficina);
                cmd.ExecuteNonQuery();
                conn.Close();

            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        }
       
        //Insert la relacion de muchos a muchos en la tabla auxiliar de
        //siuc_oficinas y auditoria
        public void insertarOfiAud(Int32 id_requi, Int32 id_oficina)
        {
            string query = @"insert into cap_auditoria_x_oficinas(id_capacitacion_auditoria, id_oficina) 
                            values(@id_requi, @id_oficina) ";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionBD"].ToString());
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@id_requi", id_requi);
                cmd.Parameters.AddWithValue("@id_oficina", id_oficina);
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        
        }

        //Metodo que recibe el tipo de capacitacion y devueleve el
        //ultimo folio, para ser enviado por correo en la notificacion.
        //-20 de octubre, ahora solo devuelve el folio de datos generales.
        public string ConsultaFolio() {
            string folio;

            string query = "SELECT IDENT_CURRENT ('datos_generales')";
            /* string query2 = "SELECT IDENT_CURRENT ('capacitacion_externa')";
             string query3 = "SELECT IDENT_CURRENT ('capacitacion_auditoria')"; 

            if (tipo == 1) { query = query1; }
            if (tipo == 2) { query = query2; }
            if (tipo == 3) { query = query3; }   */
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionBD"].ToString());

            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Connection = conn;
            //Convertimos el valor obtenido a un String.
            folio = Convert.ToString(cmd.ExecuteScalar());
            conn.Close();

            return folio;
        }


        //Función pendiente de uso.... 
        public void ConsultaRequiInterna(string fechaDesde, string fechaHasta)
        {
            string query = @"SELECT ID, TEMA, PRIORIDAD, FECHA FROM REQUI_INTERNA WHERE FECHA BETWEEN "+fechaDesde+" AND "+fechaHasta+"ORDER BY ID ASC";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PRUEBAS"].ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Connection = conn;
        }
    }
}