using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace m_requisicion_formacion
{
    public class Conexiones
    {
        public Conexiones()
        {

        }
        public void InsertQuery()
        {
            string queryInsert1 = "INSERT INTO DATOS_REQUISICION (PRIORIDAD, MODALIDAD, FECHA, HORA_INICIO, DURACION_HORAS, NUMERO_PARTICIPANTES, LUGAR, SALA, ACOMODO, POLITICAS, PARTICIPANTES, MATERIAL_EXTRA, COFFE_BREAK, EVALUACION) VALUES(@PRIORIDAD, @MODALIDAD, @FECHA, @HORA_INICIO, @DURACION, @NUM_PARTICIPANTES, @LUGAR, @SALA, @ACOMODO, @POLITICAS, @PARTICIPANTES, @MATERIAL, @COFFE, @EVALUACION)";
        }
    }
}