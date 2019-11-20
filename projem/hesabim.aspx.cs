using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hesabim : System.Web.UI.Page
{
    uyekayitislemleri uyeislem = new uyekayitislemleri();
    uye uyemusteri = new uye();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uye"] == null)
        {
            Response.Redirect("Default.aspx");
        }

        if (!IsPostBack)
        {
             string gelenkullanıcibilgi = Request.QueryString["hesap"];
            uyemusteri = uyeislem.hesapbul(gelenkullanıcibilgi);
            TextBox1.Text = uyemusteri.Ad;
            TextBox2.Text = uyemusteri.Soyad;
            TextBox3.Text = uyemusteri.Kuladi;
            TextBox4.Text = uyemusteri.Email;
            TextBox5.Text = uyemusteri.Resim;
            TextBox6.Text = uyemusteri.Telefon;
            TextBox8.Text = uyemusteri.Parola;
            TextBox9.Text = uyemusteri.Parola2; 
          
        }
    }
   
       protected void Button1_Click(object sender, EventArgs e)
    {
        string gelenkullanıcibilgi = Request.QueryString["hesap"];
        uyemusteri.Ad = TextBox1.Text;
        uyemusteri.Soyad = TextBox2.Text;
        uyemusteri.Kuladi = TextBox3.Text;
        uyemusteri.Email = TextBox4.Text;
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("/uyeresim/") + FileUpload1.FileName);
            uyemusteri.Resim = FileUpload1.FileName;
            TextBox5.Text = FileUpload1.FileName;

        }
        else
        {
            uyemusteri.Resim = TextBox5.Text;
        }
        uyemusteri.Telefon = TextBox6.Text;
        uyemusteri.Parola = TextBox8.Text;
        uyemusteri.Parola2 = TextBox9.Text;

        uyeislem.uyekendiguncelle(gelenkullanıcibilgi, uyemusteri);

        Response.Write("<script>alert('Üyelik bilgileriniz başarıyla güncellenmiştir.')</script");
    }
   
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    
}