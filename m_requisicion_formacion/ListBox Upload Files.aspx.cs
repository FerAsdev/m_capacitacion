using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace m_requisicion_formacion
{
    public partial class ListBox_Upload_Files : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            
        }
   

        protected void AgregarFile(object sender, EventArgs e)
        {
            //crear un archivo de tipo Fileupload desde el control del formulario
            FileUpload f = Fichero;
            //Crear un objeto tipo "Lista de objetos"
            ListItem item = new ListItem();
            //Asignamos los valores al objeto de la lista desde las propiedades del fichero
            //obtenido del fileupload
            item.Value = f.FileName;
            item.Text = f.FileName;
            //Guardamos el archivo en el servidor (de manera temporal)
            f.SaveAs(Server.MapPath("~/Data/" + item.Value));
            //Agregamos el archivo al ListBox en el formulario.
            ListFile.Items.Add(item);
        }

        protected void QuitarFile(object sender, EventArgs e)
        {
            ListBox lb = ListFile;
            //Comprobar que se selecciono algun elemento de la lista.
            if (lb.SelectedItem == null)
                return;
            //Eliminamos el  elemento seleccionado del listbox
            string filename = lb.SelectedItem.Value;
            File.Delete(Server.MapPath("~/Data/"+filename));
            //Eliminamod de la lista el elemento seleccionado.
            lb.Items.Remove(lb.Items.FindByValue(filename));
        }

    }




        

}
