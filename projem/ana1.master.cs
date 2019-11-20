using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class ana1 : System.Web.UI.MasterPage
{
    uyekayitislemleri newuye = new uyekayitislemleri();
    anavt anket = new anavt();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Panelgrafik.Visible = false;

        if (Session["uye"] == "evet")
        {

            KullaniciGiris.Visible = false;
            KullaniciBilgi.Visible = true; 
            Label6.Text=Session["kuladi"].ToString();
            Panelsoru.Visible = true;
        }
          
       
       
        else
        {
            KullaniciGiris.Visible = true;
            KullaniciBilgi.Visible = false;
        }
        
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    { 

            Session["kuladi"] = TextBox1.Text;
        
        
        if (newuye.uyekontrol(TextBox1.Text, TextBox2.Text) == 1)
        {
          

       Session["uye"] = "evet";
            
	
            
            Response.Redirect("Default.aspx");
          
          
        }
        else if ((TextBox1.Text=="admin")&&(TextBox2.Text==""))
        {
          Response.Redirect("admin/Default.aspx");
        }

        else
        {
            Response.Write("<script>alert('Onaylanmayan Üye,Hatalı Kullanıcı Adı Yada Şifre')</script>");
         

        }



       /* if ((TextBox1.Text=="butgem") && (TextBox2.Text=="1234"))
        {
            KullaniciGiris.Visible=false;
            KullaniciBilgi.Visible = true;
        }
        else
        {
            KullaniciGiris.Visible =true;
        }*/
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Abandon();
        Response.Redirect("Default.aspx");
        Image1.ImageUrl = "";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("uyeform.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        anket.ac();
        DataTable oysayisi = new DataTable();
        SqlCommand anketdeger = new SqlCommand("select * from tbl_anket_cvp where sirano=@a", anket.baglanti);
        anketdeger.Parameters.AddWithValue("@a", Session["yayinanket"]);
        SqlDataAdapter adp = new SqlDataAdapter(anketdeger);
        adp.Fill(oysayisi);
        int sayi = Convert.ToInt16(oysayisi.Rows[0][Request.Form["sec"]]);
        sayi++;
        SqlCommand anketcevapla = new SqlCommand("update tbl_anket_cvp set " + Request.Form["sec"] + "=@a where sirano=@b", anket.baglanti);
        anketcevapla.Parameters.AddWithValue("@a", sayi);
        anketcevapla.Parameters.AddWithValue("@b", Session["yayinanket"]);
        anketcevapla.ExecuteNonQuery();
        Panelsoru.Visible = false;
        Panelgrafik.Visible = true;
        //Response.Write("Seçilen şık : "+Request.Form["sec"]);
        // anketgoster.InnerHtml = "Seçilen şık......:" + Request.Form["sec"];
        anket.kapat();
    }
   
}

