using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace m_requisicion_formacion
{
    public partial class ListBox_Upload_Files : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            
        }
        protected void miFuncion(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "showMsj", "hola()", true);
        }

    }




        

}
