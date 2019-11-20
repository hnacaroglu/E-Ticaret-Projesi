using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


/// <summary>
/// Summary description for urundurum
/// </summary>
public class urundurum
{
    anavt durum = new anavt();
	public urundurum()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void urundurumekle(string gdrm)
    {
        durum.ac();
        SqlCommand ekle = new SqlCommand("insert into tbl_urundurum (urndurumadi) values (@a)",durum.baglanti);
        ekle.Parameters.AddWithValue("@a",gdrm);
        ekle.ExecuteNonQuery();
        durum.kapat();


    }

    public DataTable kampanyalist()
    {
        DataTable kdurum = new DataTable();
        durum.ac();
        SqlCommand durumcek = new SqlCommand("select * from tbl_urundurum",durum.baglanti);
        SqlDataAdapter kmp = new SqlDataAdapter(durumcek);
        kmp.Fill(kdurum);
        durum.kapat();
        return kdurum;

    }

    public void durumguncelle(int mno, string durumadi)
    {
        durum.ac();
        SqlCommand durumguncel = new SqlCommand("update tbl_urundurum set urndurumadi=@a where urndurumid=@b",durum.baglanti);
        durumguncel.Parameters.AddWithValue("@a" ,durumadi);
        durumguncel.Parameters.AddWithValue("@b", mno);
        durumguncel.ExecuteNonQuery();
        durum.kapat();

     }

    public void durumsil(int mno)
    {
        durum.ac();
        SqlCommand durumsil = new SqlCommand("delete from tbl_urundurum where urndurumid=@a",durum.baglanti);
        durumsil.Parameters.AddWithValue("@a", mno);
        durumsil.ExecuteNonQuery();
        durum.kapat();


    }

    public DataTable kampanyabul(int gno)
    {
        DataTable kdurum = new DataTable();
        durum.ac();
        SqlCommand durumal = new SqlCommand("select * from tbl_urundurum where urndurumid=@a", durum.baglanti);
        durumal.Parameters.AddWithValue("@a",gno);
        SqlDataAdapter kmp = new SqlDataAdapter(durumal);
        kmp.Fill(kdurum);
        durum.kapat();
        return kdurum;

    }
}