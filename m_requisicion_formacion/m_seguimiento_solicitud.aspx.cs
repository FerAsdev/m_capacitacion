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
    public partial class m_seguimiento_solicitud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
            fechaDesde.Attributes.Add("readonly", "readonly");
            fechaHasta.Attributes.Add("readonly", "readonly");

        }

        protected void btnBuscarInterna_Click(object sender, EventArgs e)
        
        {
            BindGrid();

        }

        private void BindGrid()
        {
            string datos = "";
            if (checkbox1.Checked) { datos += ",prioridad"; }
            if (checkbox2.Checked) { datos += ",modalidad"; }
            if (checkbox3.Checked) { datos += ",tema"; }
            if (checkbox4.Checked) { datos += ",fecha"; }
            if (checkbox5.Checked) { datos += ",hora_inicio"; }
            
            if (checkbox6.Checked) { datos += ",duracion_horas"; }
            if (checkbox7.Checked) { datos += ",numero_participantes"; }
            if (checkbox8.Checked) { datos += ",lugar"; }
            if (checkbox9.Checked) { datos += ",sala"; }
            if (checkbox10.Checked) { datos += ",acomodo"; }
            
            if (checkbox11.Checked) { datos += ",politicas"; }
            if (checkbox12.Checked) { datos += ",participantes"; }
            if (checkbox13.Checked) { datos += ",material_extra"; }
            if (checkbox14.Checked) { datos += ",coffe_break"; }
            if (checkbox15.Checked) { datos += ",evaluacion"; }

            string query = @"select id"+datos+" from REQUI_INTERNA ORDER BY ID DESC ";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PRUEBAS"].ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = conn;
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            conn.Close();

        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
    }
}

