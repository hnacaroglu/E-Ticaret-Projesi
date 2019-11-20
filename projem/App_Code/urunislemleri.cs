using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for urunislemleri
/// </summary>
public class urunislemleri
{
    anavt islem = new anavt();
	public urunislemleri()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    
    public void urunkayit(urun yurun)
    {
        islem.ac();
        SqlCommand urunkaydet = new SqlCommand("insert into tbl_urunler (urnkategori,urnaltkategori,urnmarka,urndurum,urnadi,urnozellik,urnfiyati,urnstok,urnresim,urnresim2,urnresim3,urnresim4,urnbilgi) values (@a,@b,@c,@d,@e,@f,@g,@h,@i,@j,@k,@l,@m)", islem.baglanti);
        urunkaydet.Parameters.AddWithValue("@a", yurun.Ukat);
        urunkaydet.Parameters.AddWithValue("@b", yurun.Ualtkat);
        urunkaydet.Parameters.AddWithValue("@c", yurun.Umarka);
        urunkaydet.Parameters.AddWithValue("@d", yurun.Udurum);
        urunkaydet.Parameters.AddWithValue("@e", yurun.Uadi);
        urunkaydet.Parameters.AddWithValue("@f", yurun.Uozellik);
        urunkaydet.Parameters.AddWithValue("@g", yurun.Ufiyat);
        urunkaydet.Parameters.AddWithValue("@h", yurun.Ustok);
        urunkaydet.Parameters.AddWithValue("@i", yurun.Uresim);
        urunkaydet.Parameters.AddWithValue("@j",yurun.Uresim2);
        urunkaydet.Parameters.AddWithValue("@k", yurun.Uresim3);
        urunkaydet.Parameters.AddWithValue("@l", yurun.Uresim4);
        urunkaydet.Parameters.AddWithValue("@m", yurun.Ubilgi);
        urunkaydet.ExecuteNonQuery();


        islem.kapat();
    
    
    
    }

    public DataTable urunlistele()
    {
        DataTable listeleurun = new DataTable();
        islem.ac();
        SqlCommand urun = new SqlCommand("select * from tbl_urunler",islem.baglanti);
        SqlDataAdapter urn = new SqlDataAdapter(urun);
        urn.Fill(listeleurun);
       islem.kapat();
        return listeleurun;

    }

    public DataTable anakatlist(int gkatno)
    {

        DataTable anakat = new DataTable();
        islem.ac();
        SqlCommand ana = new SqlCommand("select * from tbl_urunler where urnkategori=@a",islem.baglanti);
        ana.Parameters.AddWithValue("@a", gkatno);
        ana.ExecuteNonQuery();
        SqlDataAdapter akat = new SqlDataAdapter(ana);
        akat.Fill(anakat);
        islem.kapat();
        return anakat;
    
    }
    public DataTable altkatlist(int galtkatno)
    {

        DataTable anakat = new DataTable();
        islem.ac();
        SqlCommand ana = new SqlCommand("select * from tbl_urunler where urnaltkategori=@a", islem.baglanti);
        ana.Parameters.AddWithValue("@a", galtkatno);
        ana.ExecuteNonQuery();
        SqlDataAdapter akat = new SqlDataAdapter(ana);
        akat.Fill(anakat);
        islem.kapat();
        return anakat;

    }

    public DataTable markalist(int markano)
    {

        DataTable anakat = new DataTable();
        islem.ac();
        SqlCommand ana = new SqlCommand("select * from tbl_urunler where urnmarka=@a", islem.baglanti);
        ana.Parameters.AddWithValue("@a", markano);
        ana.ExecuteNonQuery();
        SqlDataAdapter akat = new SqlDataAdapter(ana);
        akat.Fill(anakat);
        islem.kapat();
        return anakat;

    }

    public DataTable kampanyalist(int kampno)
    {

        DataTable anakat = new DataTable();
        islem.ac();
        SqlCommand ana = new SqlCommand("select * from tbl_urunler where urndurum=@a", islem.baglanti);
        ana.Parameters.AddWithValue("@a", kampno);
        ana.ExecuteNonQuery();
        SqlDataAdapter akat = new SqlDataAdapter(ana);
        akat.Fill(anakat);
        islem.kapat();
        return anakat;

    }

    
    public void urunguncelle(urun guncellenecekurun, int urunno)
    {

        islem.ac();
        SqlCommand urungncl = new SqlCommand("update tbl_urunler set urnkategori=@a,urnaltkategori=@b,urnmarka=@c,urndurum=@d,urnadi=@e,urnozellik=@f,urnfiyati=@g,urnstok=@h,urnresim=@i,urnresim2=@k,urnresim3=@l,urnresim4=@m, urnbilgi=@n where urnid=@j", islem.baglanti);
        urungncl.Parameters.AddWithValue("@j",urunno);
        urungncl.Parameters.AddWithValue("@a",guncellenecekurun.Ukat);
        urungncl.Parameters.AddWithValue("@b",guncellenecekurun.Ualtkat);
        urungncl.Parameters.AddWithValue("@c",guncellenecekurun.Umarka);
        urungncl.Parameters.AddWithValue("@d",guncellenecekurun.Udurum);
        urungncl.Parameters.AddWithValue("@e",guncellenecekurun.Uadi);
        urungncl.Parameters.AddWithValue("@f",guncellenecekurun.Uozellik);
        urungncl.Parameters.AddWithValue("@g",guncellenecekurun.Ufiyat);
        urungncl.Parameters.AddWithValue("@h",guncellenecekurun.Ustok);
        urungncl.Parameters.AddWithValue("@i",guncellenecekurun.Uresim);
        urungncl.Parameters.AddWithValue("@k", guncellenecekurun.Uresim2);
        urungncl.Parameters.AddWithValue("@l", guncellenecekurun.Uresim3);
        urungncl.Parameters.AddWithValue("@m", guncellenecekurun.Uresim4);
        urungncl.Parameters.AddWithValue("@n", guncellenecekurun.Ubilgi);
        urungncl.ExecuteNonQuery();
        islem.kapat();

    }
    public urun urunbul(int gurunno)
    {
        DataTable yurun = new DataTable();
        urun bulurun = new urun();
        islem.ac();
        SqlCommand uyeler = new SqlCommand("select * from tbl_urunler where urnid=@a",islem.baglanti);
        uyeler.Parameters.AddWithValue("@a",gurunno);
        SqlDataAdapter urn = new SqlDataAdapter(uyeler);
        urn.Fill(yurun);
        bulurun.Ukat = Convert.ToInt16(yurun.Rows[0][1]);
        bulurun.Ualtkat = Convert.ToInt16(yurun.Rows[0][2]);
        bulurun.Umarka = Convert.ToInt16(yurun.Rows[0][3]);
        bulurun.Udurum = Convert.ToInt16(yurun.Rows[0][4]);
        bulurun.Uadi = yurun.Rows[0][5].ToString();
        bulurun.Uozellik = yurun.Rows[0][6].ToString();
        bulurun.Ufiyat =Convert.ToInt16(yurun.Rows[0][7]);
        bulurun.Ustok= Convert.ToInt16(yurun.Rows[0][8]);
        bulurun.Uresim =yurun.Rows[0][9].ToString();
        bulurun.Uresim2 = yurun.Rows[0][10].ToString();
        bulurun.Uresim3 = yurun.Rows[0][11].ToString();
        bulurun.Uresim4= yurun.Rows[0][12].ToString();
        bulurun.Ubilgi=yurun.Rows[0][13].ToString();
         islem.kapat();
         return bulurun;


    }

    public void urunsil(int siluno)
    {
        islem.ac();
        SqlCommand usilme = new SqlCommand("delete from tbl_urunler where urnid=@a",islem.baglanti);
        usilme.Parameters.AddWithValue("@a",siluno);
        usilme.ExecuteNonQuery();
        islem.kapat();
            }
    public DataTable son4()
    {

        DataTable son4urun = new DataTable();
        islem.ac();
        SqlCommand uruncek = new SqlCommand("select top 4 * from tbl_urunler", islem.baglanti);
        SqlDataAdapter cek = new SqlDataAdapter(uruncek);
        cek.Fill(son4urun);
      islem.kapat();
        return son4urun;

    }

    public DataTable teklist(int uno)
    {
        DataTable listeleurun = new DataTable();
        islem.ac();
        SqlCommand urun = new SqlCommand("select*from tbl_urunler where urnid=@a", islem.baglanti);
        urun.Parameters.AddWithValue("@a", uno);
        SqlDataAdapter urn = new SqlDataAdapter(urun);
        urn.Fill(listeleurun);
        islem.kapat();
        return listeleurun;

    }
    public DataTable aynı3(int guno)
    {
        DataTable listeleurun = new DataTable();
        islem.ac();
        SqlCommand urun = new SqlCommand("select top 3 * from tbl_urunler where urnkategori=@a", islem.baglanti);
        urun.Parameters.AddWithValue("@a", guno);
        SqlDataAdapter urn = new SqlDataAdapter(urun);
        urn.Fill(listeleurun);
        islem.kapat();
        return listeleurun;

    }

    public DataTable tumkatlist(int sirala,int gkatno, int galtno)
    {
        string siralakomut = "select * from tbl_urunler where urnkategori=@a or urnaltkategori=@b";
        DataTable anakat = new DataTable();
        islem.ac();

        if (sirala==0)
        {
            siralakomut = "select * from tbl_urunler where urnkategori=@a or urnaltkategori=@b order by urnfiyati asc";
        }

        else if (sirala==1)
        {
             siralakomut = "select * from tbl_urunler where urnkategori=@a or urnaltkategori=@b order by urnfiyati desc";
        }
        SqlCommand ana = new SqlCommand(siralakomut, islem.baglanti);
        ana.Parameters.AddWithValue("@a", gkatno);
        ana.Parameters.AddWithValue("@b", galtno);
        ana.ExecuteNonQuery();
        SqlDataAdapter akat = new SqlDataAdapter(ana);
        akat.Fill(anakat);
        islem.kapat();
        return anakat;

    }

    public DataTable urunsiralama(int prm)
    {
        string gelenkomut = "select * from tbl_urunler ";
        DataTable sonuc = new DataTable();
       islem.ac();

        if (prm == 0)
        {
            gelenkomut = "select * from tbl_urunler order by fiyati asc";
        }

        else if (prm == 1)
        {
            gelenkomut = "select * from tbl_urunler order by fiyati desc";
        }

        else if (prm == 2)
        {
            gelenkomut = "select * from tbl_urunler order by markaadi desc";
        }

        else if (prm == 3)
        {
            gelenkomut = "select * from tbl_urunler order by urnadi asc";
        }

        SqlCommand sirala = new SqlCommand("gelenkomut", islem.baglanti);
        SqlDataAdapter sira = new SqlDataAdapter(sirala);
        sira.Fill(sonuc);
        islem.kapat();
        return sonuc;

    }

    public int urunsayisi()
    {

        int sayi;
        islem.ac();



        SqlCommand komut = new SqlCommand("select count(urnid) from tbl_urunler", islem.baglanti);
        sayi = Convert.ToInt16(komut.ExecuteScalar());
        islem.kapat();
        return sayi;

    }

    public DataTable urunsayfam(int bas, int adet, int prm)
    {
        string gelenkomut = "select * from tbl_urunler ";
        DataTable sayfa = new DataTable();
        islem.ac();

        if (prm == 0)
        {
            gelenkomut = "select * from tbl_urunler order by urnfiyati asc";
        }

        else if (prm == 1)
        {
            gelenkomut = "select * from tbl_urunler order by urnfiyati desc";
        }

       
        SqlCommand usayfasirala = new SqlCommand(gelenkomut,islem.baglanti);
        SqlDataAdapter urn = new SqlDataAdapter(usayfasirala);
        urn.Fill(bas, adet,sayfa);
        islem.kapat();
        return sayfa;

    }

    public DataTable urunsayfa(int bas, int adet)
    {
       
        DataTable sayfa = new DataTable();
        islem.ac();



        SqlCommand usayfasirala = new SqlCommand("select * from tbl_urunler ", islem.baglanti);
        SqlDataAdapter urn = new SqlDataAdapter(usayfasirala);
        urn.Fill(bas, adet, sayfa);
        islem.kapat();
        return sayfa;

    }




    public int urunstoksayisi()
    {

        int sayi;
        islem.ac();
        SqlCommand komut = new SqlCommand("select sum(urnstok) from tbl_urunler", islem.baglanti);
        sayi = Convert.ToInt32(komut.ExecuteScalar());
        islem.kapat();
        return sayi;

    }


    public int uruntopfiyati()
    {

        int sayi;
        islem.ac();
        SqlCommand komut = new SqlCommand("select sum(urnfiyati) from tbl_urunler", islem.baglanti);
        sayi = Convert.ToInt32(komut.ExecuteScalar());
        islem.kapat();
        return sayi;

    }

}