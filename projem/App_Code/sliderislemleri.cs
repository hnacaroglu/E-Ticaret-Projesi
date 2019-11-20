using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for sliderislemleri
/// </summary>
public class sliderislemleri
{
    anavt slider = new anavt();
	public sliderislemleri()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void sliderekleme(string gresimaciklama, string gresim)
    {
        slider.ac();

        SqlCommand sliderekle = new SqlCommand("insert into tbl_slidder (saciklama,sresim) values (@a,@b)",slider.baglanti);
        sliderekle.Parameters.AddWithValue("@a", gresimaciklama);
        sliderekle.Parameters.AddWithValue("@b", gresim);
        sliderekle.ExecuteNonQuery();
        slider.kapat();
    
    
    }

    public DataTable slidercek()
    {
        DataTable yenigoster = new DataTable();
        slider.ac();

        SqlCommand resimgetir = new SqlCommand("select * from tbl_slidder",slider.baglanti);
        SqlDataAdapter rsm = new SqlDataAdapter(resimgetir);
        rsm.Fill(yenigoster);
        slider.kapat();
        return yenigoster;


    }

    public void sliderguncel(int gsno, string gacik, string gresim)
    {
        slider.ac();
        SqlCommand slideral = new SqlCommand("update tbl_slidder set saciklama=@a, sresim=@b where sliderid=@c",slider.baglanti);
        slideral.Parameters.AddWithValue("@a",gacik);
        slideral.Parameters.AddWithValue("@b",gresim);
        slideral.Parameters.AddWithValue("@c", gsno);
        slideral.ExecuteNonQuery();
        slider.kapat();


    }

    public DataTable tekslider(int sno)
    {
        DataTable yenigoster = new DataTable();
        slider.ac();

        SqlCommand resimgetir = new SqlCommand("select * from tbl_slidder where sliderid=@a", slider.baglanti);
        resimgetir.Parameters.AddWithValue("@a",sno);
        SqlDataAdapter rsm = new SqlDataAdapter(resimgetir);
        rsm.Fill(yenigoster);
        slider.kapat();
        return yenigoster;


    }

    public DataTable teksliderisim(int sno)
    {
        DataTable yenigoster = new DataTable();
        slider.ac();

        SqlCommand resimgetir = new SqlCommand("select sresim from tbl_slidder where sliderid=@a", slider.baglanti);
        resimgetir.Parameters.AddWithValue("@a", sno);
        SqlDataAdapter rsm = new SqlDataAdapter(resimgetir);
        rsm.Fill(yenigoster);
        slider.kapat();
        return yenigoster;


    }
    public DataTable tekslideaciklama(int sno)
    {
        DataTable yenigoster = new DataTable();
        slider.ac();

        SqlCommand resimgetir = new SqlCommand("select saciklama from tbl_slidder where sliderid=@a", slider.baglanti);
        resimgetir.Parameters.AddWithValue("@a", sno);
        SqlDataAdapter rsm = new SqlDataAdapter(resimgetir);
        rsm.Fill(yenigoster);
        slider.kapat();
        return yenigoster;


    }
    
    public void slidersil(int gno)
    {
        slider.ac();
        SqlCommand silme = new SqlCommand("delete from tbl_slidder where sliderid=@a",slider.baglanti);
        silme.Parameters.AddWithValue("@a", gno);
        silme.ExecuteNonQuery();
        slider.kapat();

    }
    
}