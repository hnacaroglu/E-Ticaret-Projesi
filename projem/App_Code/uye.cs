using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for uye
/// </summary>
public class uye
{
	public uye()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    string ad, soyad, kuladi, parola, parola2, email, resim, telefon;

    public string Telefon
    {
        get { return telefon; }
        set { telefon = value; }
    }

    public string Resim
    {
        get { return resim; }
        set { resim = value; }
    }

    public string Email
    {
        get { return email; }
        set { email = value; }
    }

    public string Parola2
    {
        get { return parola2; }
        set { parola2 = value; }
    }



    public string Parola
    {
        get { return parola; }
        set { parola = value; }
    }

    public string Kuladi
    {
        get { return kuladi; }
        set { kuladi = value; }
    }

    public string Soyad
    {
        get { return soyad; }
        set { soyad = value; }
    }

    public string Ad
    {
        get { return ad; }
        set { ad = value; }
    }
    int onay;

    public int Onay
    {
        get { return onay; }
        set { onay = value; }
    }
}