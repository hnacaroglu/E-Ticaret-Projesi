using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


/// <summary>
/// Summary description for kategoriler
/// </summary>
public class kategoriler
{
    anavt katadi = new anavt();
	public kategoriler()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void anakat(string kat)
    {
        katadi.ac();
        SqlCommand ana = new SqlCommand("insert into tbl_anakategori (anakatadi) values (@a)",katadi.baglanti);
        ana.Parameters.AddWithValue("@a",kat);
        ana.ExecuteNonQuery();
        katadi.kapat();
    }

    public void altkat(string akat,int anano)
    {

        katadi.ac();
        SqlCommand alt = new SqlCommand("insert into tbl_altkategori (altkategoriadi,anakatno) values (@a,@b)", katadi.baglanti);
        alt.Parameters.AddWithValue("@a", akat);
        alt.Parameters.AddWithValue("@b",anano);
        alt.ExecuteNonQuery();
        katadi.kapat();
    }

    public DataTable menucek()
    {
        DataTable menual = new DataTable();
        katadi.ac();
        SqlCommand menu = new SqlCommand("select * from tbl_anakategori",katadi.baglanti);
   
        SqlDataAdapter mn = new SqlDataAdapter(menu);
        mn.Fill(menual);
        katadi.kapat();
        return menual;
    
    
    }

    public DataTable altmenucek(int anamenu)
    {
        DataTable menual = new DataTable();
        katadi.ac();
        SqlCommand menu = new SqlCommand("select * from tbl_altkategori where anakatno=@a", katadi.baglanti);
        menu.Parameters.AddWithValue("@a",anamenu);
        SqlDataAdapter mn = new SqlDataAdapter(menu);
        mn.Fill(menual);
        katadi.kapat();
        return menual;


    }
}