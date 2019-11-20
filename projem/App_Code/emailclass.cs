using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

/// <summary>
/// Summary description for emailclass
/// </summary>
public class emailclass
{
	public emailclass()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public bool gonder(string konu, string icerik, string adres)
    {

        MailMessage eposta = new MailMessage();
        eposta.From = new MailAddress("nacarshopp@gmail.com");
        eposta.To.Add(adres);
        eposta.Subject = konu;
        eposta.Body = icerik;
        SmtpClient smtp = new SmtpClient();
        smtp.Credentials = new System.Net.NetworkCredential("nacarshopp@gmail.com", "2819320130");
        smtp.Port = 587 ;
        smtp.Host = "smtp.gmail.com";
        smtp.EnableSsl = true;
        bool kontrol = true;
        try
        {
            smtp.Send(eposta);
        }
        catch (SmtpException ex)
        {

            kontrol = false;
        }

        return kontrol;
    }
}