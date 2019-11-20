using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for uyekayitislemleri
/// </summary>
public class uyekayitislemleri
{
    anavt uyeislm = new anavt();
	public uyekayitislemleri()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void uyekyt(uye yeniuye)
    {
        uyeislm.ac();
        SqlCommand uyekaydet = new SqlCommand("insert into tbl_uye (ad,soyad,kuladi,parola,parola2,email,resim,telefon,onay) values(@a,@b,@c,@d,@e,@f,@g,@h,@k)", uyeislm.baglanti);
        uyekaydet.Parameters.AddWithValue("@a", yeniuye.Ad);
        uyekaydet.Parameters.AddWithValue("@b", yeniuye.Soyad);
        uyekaydet.Parameters.AddWithValue("@c", yeniuye.Kuladi);
        uyekaydet.Parameters.AddWithValue("@d", yeniuye.Parola);
        uyekaydet.Parameters.AddWithValue("@e", yeniuye.Parola2);
        uyekaydet.Parameters.AddWithValue("@f", yeniuye.Email);
        uyekaydet.Parameters.AddWithValue("@g", yeniuye.Resim);
        uyekaydet.Parameters.AddWithValue("@h", yeniuye.Telefon);
        uyekaydet.Parameters.AddWithValue("k", yeniuye.Onay);
        uyekaydet.ExecuteNonQuery();



        uyeislm.kapat();

    }

    public DataTable uyelistele()
    {
        DataTable uyesonuc = new DataTable();
        uyeislm.ac();
        SqlCommand uyekomut = new SqlCommand("select * from tbl_uye", uyeislm.baglanti);
        SqlDataAdapter uyeadp = new SqlDataAdapter(uyekomut);
        uyeadp.Fill(uyesonuc);
        uyeislm.kapat();
        return uyesonuc;
    }

    public uye uyebul(int gno)
    {
        DataTable uyecek = new DataTable(); 
        uye bulunanuye = new uye();
        uyeislm.ac();

        SqlCommand uyecagir = new SqlCommand("select *from tbl_uye where sno=@a", uyeislm.baglanti);
        uyecagir.Parameters.AddWithValue("@a", gno);
        SqlDataAdapter uy = new SqlDataAdapter(uyecagir);
        uy.Fill(uyecek);
        bulunanuye.Ad = uyecek.Rows[0][1].ToString();
        bulunanuye.Soyad = uyecek.Rows[0][2].ToString();
        bulunanuye.Kuladi = uyecek.Rows[0][3].ToString();
        bulunanuye.Parola = uyecek.Rows[0][4].ToString();
        bulunanuye.Parola2 = uyecek.Rows[0][5].ToString();
        bulunanuye.Email = uyecek.Rows[0][6].ToString();
        bulunanuye.Resim = uyecek.Rows[0][7].ToString();
        bulunanuye.Telefon = uyecek.Rows[0][8].ToString();
        bulunanuye.Onay = Convert.ToInt16(uyecek.Rows[0][9]);
        uyeislm.kapat();
        return bulunanuye;

    }

    public int uyekontrol(string gkulad, string guysifre)
    {
        int uyesonuc = 0;
        uyeislm.ac();
        SqlCommand kontrol = new SqlCommand("select * from tbl_uye where kuladi=@a and parola=@b and onay=1", uyeislm.baglanti);
        kontrol.Parameters.AddWithValue("@a", gkulad);
        kontrol.Parameters.AddWithValue("@b", guysifre);
        SqlDataReader uyeoku = kontrol.ExecuteReader();

        if (uyeoku.Read())
        {
            uyesonuc = 1;
        }

        uyeoku.Close();

        uyeislm.kapat();
        return uyesonuc;


    }


    public DataTable uyekontrolu(string gkulad, string guysifre)
    {
        DataTable uyresim = new DataTable();
       
        uyeislm.ac();
        SqlCommand kontrol = new SqlCommand("select * from tbl_uye where kuladi=@a and parola=@b and onay=1", uyeislm.baglanti);
        kontrol.Parameters.AddWithValue("@a", gkulad);
        kontrol.Parameters.AddWithValue("@b", guysifre);
        SqlDataAdapter resmi = new SqlDataAdapter(kontrol);
        resmi.Fill(uyresim);
        uyeislm.kapat();
        return uyresim;

       


    }
    public void uyesil(int uyeno)
    {
        uyeislm.ac();

        SqlCommand uyesilme = new SqlCommand("delete from tbl_uye where sno=@a", uyeislm.baglanti);
        uyesilme.Parameters.AddWithValue("@a", uyeno);
        uyesilme.ExecuteNonQuery();

        uyeislm.kapat();

    }

    public void uyeguncelle(int guyeno, uye guye)
    {
        uyeislm.ac();
        SqlCommand uyeguncelle = new SqlCommand("update tbl_uye set ad=@a, soyad=@b, kuladi=@c, email=@e, resim=@f, telefon=@i, onay=@g where sno=@h",uyeislm.baglanti);
        uyeguncelle.Parameters.AddWithValue("@a",guye.Ad);
        uyeguncelle.Parameters.AddWithValue("@b",guye.Soyad);
        uyeguncelle.Parameters.AddWithValue("@c", guye.Kuladi);
        uyeguncelle.Parameters.AddWithValue("@e", guye.Email);
        uyeguncelle.Parameters.AddWithValue("@f",guye.Resim);
        uyeguncelle.Parameters.AddWithValue("@i",guye.Telefon);
        uyeguncelle.Parameters.AddWithValue("@g", guye.Onay);
        uyeguncelle.Parameters.AddWithValue("@h",guyeno);
        uyeguncelle.ExecuteNonQuery();
        uyeislm.kapat();
    }

    public void uyeonayla()
    {
        uyeislm.ac();
        SqlCommand onay = new SqlCommand("update tbl_uye set onay=1",uyeislm.baglanti);
        onay.ExecuteNonQuery();
        uyeislm.kapat();
    }

    public void tekuyeonay(int guye, int odurum)
    {
        uyeislm.ac();
        SqlCommand onay = new SqlCommand("update tbl_uye set onay=@a where sno=@b", uyeislm.baglanti);
        onay.Parameters.AddWithValue("@a", odurum);
        onay.Parameters.AddWithValue("@b", guye);
        onay.ExecuteNonQuery();
        uyeislm.kapat();
    }

    public  DataTable uyeresim(string uadi)
    {

        DataTable resim = new DataTable();
        uyeislm.ac();
        SqlCommand guye = new SqlCommand("select resim from tbl_uye where kuladi=@a",uyeislm.baglanti);
        guye.Parameters.AddWithValue("@a",uadi);
        SqlDataAdapter rsm = new SqlDataAdapter(guye);
        rsm.Fill(resim);        
        uyeislm.kapat();
        return resim;


    }

    public uye hesapbul(string kuladi)
    {
        DataTable uyecek = new DataTable();
        uye bulunanuye = new uye();
        uyeislm.ac();

        SqlCommand uyecagir = new SqlCommand("select * from tbl_uye where kuladi=@a", uyeislm.baglanti);
        uyecagir.Parameters.AddWithValue("@a", kuladi);
        SqlDataAdapter uy = new SqlDataAdapter(uyecagir);
        uy.Fill(uyecek);
        bulunanuye.Ad = uyecek.Rows[0][1].ToString();
        bulunanuye.Soyad = uyecek.Rows[0][2].ToString();
        bulunanuye.Kuladi = uyecek.Rows[0][3].ToString();
        bulunanuye.Parola = uyecek.Rows[0][4].ToString();
        bulunanuye.Parola2 = uyecek.Rows[0][5].ToString();
        bulunanuye.Email = uyecek.Rows[0][6].ToString();
        bulunanuye.Resim = uyecek.Rows[0][7].ToString();
        bulunanuye.Telefon = uyecek.Rows[0][8].ToString();
        bulunanuye.Onay = Convert.ToInt16(uyecek.Rows[0][9]);
        uyeislm.kapat();
        return bulunanuye;

    }

    public void uyekendiguncelle(string gkuladi, uye guye)
    {
        uyeislm.ac();
        SqlCommand uyeguncelle = new SqlCommand("update tbl_uye set ad=@a, soyad=@b, kuladi=@c, email=@e, resim=@f, telefon=@i, parola=@s, parola2=@s2 where kuladi=@h", uyeislm.baglanti);
        uyeguncelle.Parameters.AddWithValue("@a", guye.Ad);
        uyeguncelle.Parameters.AddWithValue("@b", guye.Soyad);
        uyeguncelle.Parameters.AddWithValue("@c", guye.Kuladi);
        uyeguncelle.Parameters.AddWithValue("@e", guye.Email);
        uyeguncelle.Parameters.AddWithValue("@f", guye.Resim);
        uyeguncelle.Parameters.AddWithValue("@i", guye.Telefon);
        uyeguncelle.Parameters.AddWithValue("@s", guye.Parola);
        uyeguncelle.Parameters.AddWithValue("@s2", guye.Parola2);
        uyeguncelle.Parameters.AddWithValue("@h", gkuladi);
        uyeguncelle.ExecuteNonQuery();
        uyeislm.kapat();
    }

    public DataTable kuladivarmi(string kullanici)
    {
        DataTable kulmu = new DataTable();
        uyeislm.ac();

        SqlCommand uyeadi = new SqlCommand("select * from tbl_uye where kuladi like '%@a%'",uyeislm.baglanti);
        uyeadi.Parameters.AddWithValue("@a", kullanici);
        SqlDataAdapter uyead = new SqlDataAdapter(uyeadi);
        uyead.Fill(kulmu);
        uyeislm.kapat();

        return kulmu;
    }

    public int kullanicikontrol(string gkulad)
    {
        int uyesonuc = 0;
        uyeislm.ac();
        SqlCommand kontrol = new SqlCommand("select * from tbl_uye where kuladi=@a", uyeislm.baglanti);
        kontrol.Parameters.AddWithValue("@a", gkulad);
        
        SqlDataReader uyeoku = kontrol.ExecuteReader();

        if (uyeoku.Read())
        {
            uyesonuc = 1;
        }

        uyeoku.Close();

        uyeislm.kapat();
        return uyesonuc;


    }

    public DataTable uyeguncelresim(int gsno)
    {
        DataTable tekuye = new DataTable();
        uyeislm.ac();

        SqlCommand uyecagir = new SqlCommand("select resim from tbl_uye where sno=@a", uyeislm.baglanti);
        uyecagir.Parameters.AddWithValue("@a", gsno);
        SqlDataAdapter uyem = new SqlDataAdapter(uyecagir);
        uyem.Fill(tekuye);

        uyeislm.kapat();
        return tekuye;

    }

}