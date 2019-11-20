using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for kategoriislem
/// </summary>
public class kategoriislem
{
    anavt kat = new anavt();
	public kategoriislem()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataTable anakatlist()
    {
        DataTable analist = new DataTable();
        kat.ac();
        SqlCommand listanakat = new SqlCommand("select * from tbl_anakategori",kat.baglanti);
        SqlDataAdapter listanakategori = new SqlDataAdapter(listanakat);
        listanakategori.Fill(analist);
        kat.kapat();
        return analist;   
    
    }

    public void anakatguncel(int ganano, string anaadi)
    {
        kat.ac();
        SqlCommand anaguncelle = new SqlCommand("update tbl_anakategori set anakatadi=@a where anakatid=@b",kat.baglanti);
        anaguncelle.Parameters.AddWithValue("@a", anaadi);
        anaguncelle.Parameters.AddWithValue("@b", ganano);
        anaguncelle.ExecuteNonQuery();
        kat.kapat();
    
    
    }
    public void anakatbul(int ganakatno)
    {
        DataTable anakt = new DataTable();
        kat.ac();
      
        SqlCommand listanakat = new SqlCommand("select anakatadi from tbl_anakategori where anaktid=@", kat.baglanti);
        listanakat.Parameters.AddWithValue("@a",ganakatno);
        SqlDataAdapter listanakategori = new SqlDataAdapter(listanakat);
        listanakategori.Fill(anakt);
        kat.kapat();
    
    }

    public void anakatsil(int gno)
    {
        kat.ac();
        SqlCommand anakatsil = new SqlCommand("delete from tbl_anakategori where anakatid=@a",kat.baglanti);
        anakatsil.Parameters.AddWithValue("@a", gno);
        anakatsil.ExecuteNonQuery();
        kat.kapat();



    }
    public DataTable altkatlist()
    {
        DataTable altlist = new DataTable();
        kat.ac();
        SqlCommand listaltkat = new SqlCommand("select * from tbl_altkategori", kat.baglanti);
        SqlDataAdapter listanakategori = new SqlDataAdapter(listaltkat);
        listanakategori.Fill(altlist);
        kat.kapat();
        return altlist;

    }
    public DataTable altkatbul(int gltkatno)
    {
        DataTable altkt = new DataTable();
        kat.ac();

        SqlCommand listaltkat = new SqlCommand("select * from tbl_altkategori where altkategoriid=@a", kat.baglanti);
        listaltkat.Parameters.AddWithValue("@a", gltkatno);
        SqlDataAdapter listanakategori = new SqlDataAdapter(listaltkat);
        listanakategori.Fill(altkt);
        kat.kapat();
        return altkt;
    }

    public DataTable altkatcek(int anaid)
    {
        DataTable altkat = new DataTable();
        kat.ac();
        SqlCommand listelealtkat = new SqlCommand("select * from tbl_altkategori where anakatno=@a",kat.baglanti);
        listelealtkat.Parameters.AddWithValue("@a", anaid);
        SqlDataAdapter liste = new SqlDataAdapter(listelealtkat);
        liste.Fill(altkat);
        kat.kapat();
        return altkat;
    
    }

    public void altkatsil(int silno)
    {
        kat.ac();
        SqlCommand altkatsil = new SqlCommand("delete from tbl_altkategori where altkategoriid=@a", kat.baglanti);
        altkatsil.Parameters.AddWithValue("@a", silno);
        altkatsil.ExecuteNonQuery();
        kat.kapat();


    }

    public void altkatguncell(int galtnosu, string gadi)
    {
        kat.ac();
        SqlCommand aguncel = new SqlCommand("update tbl_altkategori set altkategoriadi=@a where altkategoriid=@b",kat.baglanti);
        aguncel.Parameters.AddWithValue("@a", gadi);
        aguncel.Parameters.AddWithValue("@b",galtnosu);
        aguncel.ExecuteNonQuery();
        kat.kapat();


    }

    public DataTable anakatbulma(int ganakatno)
    {
        DataTable anakt = new DataTable();
        kat.ac();

        SqlCommand listanakat = new SqlCommand("select *     from tbl_anakategori where anakatid=@a", kat.baglanti);
        listanakat.Parameters.AddWithValue("@a", ganakatno);
        SqlDataAdapter listanakategori = new SqlDataAdapter(listanakat);
        listanakategori.Fill(anakt);
        kat.kapat();
        return anakt;

    }
}