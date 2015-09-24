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
            divDatosPresencial.Visible = false;
            divDatosPresencial.Visible = false;
            divEspecificarOficina.Visible = false;
            divEspecificarSala.Visible = false;
            divTipoAcomodo.Visible = false;

            if (dropListModalidad.SelectedValue == "1")
            {
                divDatosPresencial.Visible = true;

                if (dropListLugar.SelectedValue == "1" || dropListLugar.SelectedValue == "3") { divEspecificarOficina.Visible = true; }
                if (dropListLugar.SelectedValue == "2") 
                {
                    divEspecificarSala.Visible = true;
                    if (dropListSala.SelectedValue == "1")
                    {
                        divTipoAcomodo.Visible = true;
                    }
                    
                };
            }

        }
    }
}
