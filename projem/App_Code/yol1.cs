using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for yol1
/// </summary>
public class yol1
{
	public yol1()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public string yol(int s1, int s2)
    {
        string yolum;
        Random rastgele = new Random();
        yolum = "~/img1/" + (rastgele.Next(s1, s2)).ToString() + ".gif";
        return yolum;

    }

    public int harfturet(int a, int b)
    {
        int sonuc;

        Random rastgele = new Random();
        sonuc = rastgele.Next(a, b);

        return sonuc;

    }
}