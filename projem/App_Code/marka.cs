using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
/// <summary>
/// Summary description for Class1
/// </summary>
public class marka
{
    anavt mark = new anavt();
	public marka()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void markaekle(string gmarka ,string gmresim)
    {
        mark.ac();
        SqlCommand yenimarka = new SqlCommand("insert into tbl_marka (markaadi,markaresim) values (@a,@b)",mark.baglanti);
        yenimarka.Parameters.AddWithValue("@a",gmarka);
        yenimarka.Parameters.AddWithValue("@b",gmresim);
        yenimarka.ExecuteNonQuery();
        mark.kapat();
    
    }
}