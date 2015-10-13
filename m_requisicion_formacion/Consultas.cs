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
        public void insertar1(Int32 id_requi, Int32 id_oficina)
        {
            string queryInsertar = "INSERT INTO requi_oficinas (id_requi, id_oficina) VALUES(@ID_REQUI, @ID_OFICINA)";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PRUEBAS"].ToString());
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(queryInsertar, conn);
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@ID_REQUI", id_requi);
                cmd.Parameters.AddWithValue("@ID_OFICINA", id_oficina);
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        }

        public void insertarOfiAud(Int32 id_requi, Int32 id_oficina)
        {
            string query = "INSERT INTO AUDITORIA_OFICINAS(ID_REQ_AUDITORIA, ID_OFICINA) VALUES(@ID_REQ_AUDITORIA, @ID_OFICINA) ";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PRUEBAS"].ToString());
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@ID_REQ_AUDITORIA", id_requi);
                cmd.Parameters.AddWithValue("@ID_OFICINA", id_oficina);
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        
        }
    }
}