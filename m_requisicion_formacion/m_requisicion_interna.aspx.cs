using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace m_requisicion_formacion
{
    public partial class m_requisicion_interna : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            presencial.Visible = false;
            enLinea.Visible = false;
            divOficinaServicio.Visible = false;
            divCorporativo.Visible = false;
            divAuditorio.Visible = false;
            if (modalidad.SelectedValue == "1") { presencial.Visible = true;}
            if (modalidad.SelectedValue == "2") { enLinea.Visible = true; }
            if (dropLugar.SelectedValue == "1") { divOficinaServicio.Visible = true; }
            if (dropLugar.SelectedValue == "2") { divCorporativo.Visible = true; }
            if (dropSala.SelectedValue == "1") { divAuditorio.Visible = true; }


        }
    }
}