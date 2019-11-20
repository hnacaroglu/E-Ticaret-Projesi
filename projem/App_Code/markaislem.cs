    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for markaislem
/// </summary>
public class markaislem
{
    anavt mrk = new anavt();
	public markaislem()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataTable markalist()
    {
        DataTable mark = new DataTable();
        mrk.ac();
        SqlCommand mliste = new SqlCommand("select * from tbl_marka",mrk.baglanti);
        SqlDataAdapter lmarka = new SqlDataAdapter(mliste);
        lmarka.Fill(mark);
        mrk.kapat();
        return mark;
    
    }

    public void markaguncel(int gmarno, string madi, string mresim)
    {
        mrk.ac();
        SqlCommand mguncelle = new SqlCommand("update tbl_marka set markaadi=@a, markaresim=@b where markaid=@c",mrk.baglanti);
        mguncelle.Parameters.AddWithValue("@a",madi);
        mguncelle.Parameters.AddWithValue("@b", mresim);
        mguncelle.Parameters.AddWithValue("@c",gmarno);
        mguncelle.ExecuteNonQuery();
        mrk.kapat();
    
    }
    public void markabul(int gmarkano)
    {
        
        DataTable ymarka = new DataTable();
        mrk.ac();
        SqlCommand markam = new SqlCommand("select markaadi from tbl_marka where markaid=@a",mrk.baglanti);
        markam.Parameters.AddWithValue("@a",gmarkano);
        SqlDataAdapter markagetir = new SqlDataAdapter(markam);
        markagetir.Fill(ymarka);
        mrk.kapat();
    
    }

    public void markasil(int mno)
    {

        mrk.ac();
        SqlCommand markasilme = new SqlCommand("delete from tbl_marka where markaid=@a",mrk.baglanti);
        markasilme.Parameters.AddWithValue("@a", mno);
        markasilme.ExecuteNonQuery();
        mrk.kapat();

    }

    public DataTable markayibul(int gmarkano)
    {

        DataTable ymarka = new DataTable();
        mrk.ac();
        SqlCommand markam = new SqlCommand("select * from tbl_marka where markaid=@a", mrk.baglanti);
        markam.Parameters.AddWithValue("@a", gmarkano);
        SqlDataAdapter markagetir = new SqlDataAdapter(markam);
        markagetir.Fill(ymarka);
        mrk.kapat();
        return ymarka;

    }
}