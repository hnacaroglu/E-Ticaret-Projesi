using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uyeincele : System.Web.UI.Page
{
    
    uyekayitislemleri uyeislem = new uyekayitislemleri();
    uye uyemusteri = new uye();

    protected void Page_Load(object sender, EventArgs e)
    { 
        
       
        if (!IsPostBack)
        {
            string gelenbilgi = Request.QueryString["prm1"];
            uyemusteri = uyeislem.uyebul(Convert.ToInt16(gelenbilgi));
            TextBox1.Text = uyemusteri.Ad;
            TextBox2.Text = uyemusteri.Soyad;
            TextBox3.Text = uyemusteri.Kuladi;
            TextBox4.Text = uyemusteri.Email;
            Image1.ImageUrl = uyemusteri.Resim;
            TextBox6.Text = uyemusteri.Telefon;
            TextBox7.Text = uyemusteri.Onay.ToString();
        }
    }
 protected void Button1_Click(object sender, EventArgs e)
    {
        uyemusteri.Ad = TextBox1.Text;
        uyemusteri.Soyad = TextBox2.Text;
        uyemusteri.Kuladi = TextBox3.Text;
        uyemusteri.Email = TextBox4.Text;
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("../uyeresim/") + FileUpload1.FileName);
            uyemusteri.Resim = FileUpload1.FileName;
            Image1.ImageUrl = "../uyeresim/" + FileUpload1.FileName;
        }
        else
        {
            uyemusteri.Resim = Image1.ImageUrl;
        }
        uyemusteri.Telefon = TextBox6.Text;
        uyemusteri.Onay = Convert.ToInt16(TextBox7.Text);
     
     uyeislem.uyeguncelle(Convert.ToInt16(Request.QueryString["prm1"]),uyemusteri);

     Response.Write("<script>alert('Üye bilgileri başarıyla güncellenmiştir.')</script>");

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("uyelerigoster.aspx");
    }
   
}