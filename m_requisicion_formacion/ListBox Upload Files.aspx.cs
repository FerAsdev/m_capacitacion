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
            var items = new System.Collections.ArrayList(ListBox1.Items);
            foreach(var item in items)
            {
                item.ToString();
                
            }

            
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
             if (FileUpload1.HasFile)
            {
                ListBox1.Items.Add(FileUpload1.FileName);
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ListBox1.Items.Remove(ListBox1.SelectedItem);
        }


    }
}