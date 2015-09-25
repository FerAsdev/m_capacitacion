using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace m_requisicion_formacion
{
    public partial class m_tipo_requisicion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (tipoRequisicion.SelectedValue == "Interna")
            {
                Response.Redirect("/m_requisicion_interna.aspx");
            }
            else
            {
                Response.Redirect("/m_requisicion_externa.aspx");
            }
        }
    }
}