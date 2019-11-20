using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for sepetislemleri
/// </summary>
public class sepetislemleri
{
    anavt sepet = new anavt();
	public sepetislemleri()
	{
		//
		// TODO: Add constructor logic here
		//
	}



    public void sepetekle( string guye, int gurun , int gurunadet)
    {
        
        sepet.ac();
        SqlCommand urun = new SqlCommand("insert into tbl_sepet (secenuye,secilenurun,surun_adet) values(@a,@b,@c)",sepet.baglanti);
        urun.Parameters.AddWithValue("@a", guye);
        urun.Parameters.AddWithValue("@b",gurun);
        urun.Parameters.AddWithValue("@c",gurunadet);
        urun.ExecuteNonQuery();
        sepet.kapat();

    
    }

    public DataTable sepetici(string uyeadi)
    {
        DataTable sepetim= new DataTable();
        sepet.ac();

        SqlCommand sepetteki = new SqlCommand("select * from tbl_sepet where secenuye=@a",sepet.baglanti);
        sepetteki.Parameters.AddWithValue("@a",uyeadi);
        SqlDataAdapter spt = new SqlDataAdapter(sepetteki);
        spt.Fill(sepetim);

        sepet.kapat();
        return sepetim;
    
    }

    public void sepetarti(int sptid)
    {
        sepet.ac();
        SqlCommand gsepet = new SqlCommand("update tbl_sepet set surun_adet=surun_adet+1 where alisverissepetiid=@b",sepet.baglanti);
       
        gsepet.Parameters.AddWithValue("@b",sptid);
        gsepet.ExecuteNonQuery();
        sepet.kapat();
        
    
    }


    public void sepeteksi(int sptid)
    {
        sepet.ac();
        SqlCommand gsepet = new SqlCommand("update tbl_sepet set surun_adet=surun_adet-1 where alisverissepetiid=@b", sepet.baglanti);

        gsepet.Parameters.AddWithValue("@b", sptid);
        gsepet.ExecuteNonQuery();
        sepet.kapat();


    }


    public void sepetartir(int arttir)
    {
        DataTable sepetartirma = new DataTable();
        sepet.ac();
        SqlCommand asepet = new SqlCommand("select * from tbl_sepet where alisverissepetiid=@a",sepet.baglanti);
        asepet.Parameters.AddWithValue("@a",arttir);
        SqlDataAdapter spt = new SqlDataAdapter(asepet);
        spt.Fill(sepetartirma);


        sepet.kapat();
    
    }

    public void sepetsil(int sill)
    {
        sepet.ac();
        SqlCommand silme = new SqlCommand("delete from tbl_sepet where alisverissepetiid=@a",sepet.baglanti);
        silme.Parameters.AddWithValue("@a" ,sill);
        silme.ExecuteNonQuery();
        sepet.kapat();


    }
}