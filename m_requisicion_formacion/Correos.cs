using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace m_requisicion_formacion
{
    public class Correos
    {
        SmtpClient server = new SmtpClient("smtp.gmail.com", 587);
        public Correos()
        {
            server.Credentials = new System.Net.NetworkCredential("robot@si-microcreditos.com", "robot1520");
            server.EnableSsl = true;
        }

        public void MandarCorreo(MailMessage mensaje)
        {
            server.Send(mensaje);
        }
    }
}