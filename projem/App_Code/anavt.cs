using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for anavt
/// </summary>
public class anavt
{
	public anavt()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public SqlConnection baglanti = new SqlConnection(ConfigurationManager.ConnectionStrings["sitebaglantiyolu"].ConnectionString);

    public void ac() 
    {

        baglanti.Open();
    
    
    }

    public void kapat()
    {

        baglanti.Close();   

    }

}