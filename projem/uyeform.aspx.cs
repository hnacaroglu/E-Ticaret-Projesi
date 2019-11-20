using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uyeform : System.Web.UI.Page
{
    yol1 uye = new yol1();
    uye yenikytuye = new uye();
    uyekayitislemleri uyekaydet = new uyekayitislemleri();
    emailclass yeniuyemail = new emailclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] harf = { "a", "b", "e", "d" };

        string kelime = "";





     
       

        if (!IsPostBack)
        {


            Image1.ImageUrl = uye.yol(1, 6);
            char istenen = Image1.ImageUrl[7];
            kelime += istenen;

            Image2.ImageUrl = uye.yol(1, 8);
            istenen = Image2.ImageUrl[7];
            kelime += istenen;



            Image3.ImageUrl = "~/img1/" + harf[uye.harfturet(0, 4)] + ".gif";
            istenen = Image3.ImageUrl[7];
            kelime += istenen;

            Image4.ImageUrl = "~/img1/" + harf[uye.harfturet(1, 4)] + ".gif";
            istenen = Image4.ImageUrl[7];
            kelime += istenen;
            Label12.Text = kelime;
            
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
   
        yenikytuye.Ad = TextBox3.Text;
        yenikytuye.Soyad = TextBox4.Text;
        yenikytuye.Kuladi = TextBox5.Text;
        yenikytuye.Parola = TextBox6.Text;
        yenikytuye.Parola2 = TextBox7.Text;
        yenikytuye.Email = TextBox8.Text;
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("/uyeresim/") + FileUpload1.FileName);
            yenikytuye.Resim = FileUpload1.FileName;
        }
        else
        {
            yenikytuye.Resim = "resimsizuye.jpg";
        }
        yenikytuye.Telefon = TextBox9.Text;
        // yenikytuye.Onay = Convert.ToInt32(TextBox10.Text);


        uyekayitislemleri kulkontrol = new uyekayitislemleri();


        if (kulkontrol.kullanicikontrol(TextBox5.Text) == 1)
        {

            Response.Write("<script>alert('Seçmiş olduğunuz kullanıcı adı ile mevcut kayıt bulunmaktadır. Lütfen kullanıcı adını değiştirerek tekrar deneyiniz.')</script>");
         
                       TextBox5.Text = "";
        }
        else
        {

     
      
        
            if (Label12.Text==TextBox10.Text)
        {
            
      
        uyekaydet.uyekyt(yenikytuye);
 string mailmsj="Sayın, " + TextBox3.Text + " " + TextBox4.Text + " ; " + " sitemize üyeliğiniz alınmıştır. Giriş yapabilmek için üyeliğinizin onaylanması gerekmektedir.' Üyeliğiniz onaylandı ' mailini aldıktan sonra alışverişinize başlayabilirsiniz. İyi günler dileriz...  ";

            yeniuyemail.gonder("NacarShop", mailmsj, TextBox8.Text);
       /* Response.Write("<script>alert('Kaydınız başarıyla yapılmıştır.Üyeliğiniz onaylandıktan sonra giriş yapabilirsiniz...')</script>");*/

        ModalPopupExtender1.Show();
           
           
         }
        else
        {
            Response.Write("<script>confirm('Doğrulama Kodu Hatalı...')</script>");
            
        
        }
   }
        /*  string uyersm;
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("/images/") + FileUpload1.FileName);
            uyersm = "/images/" + FileUpload1.FileName;   
        }
        else
        {
            uyersm = "/images/resimsizuye.jpg";
        }*/
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
        ModalPopupExtender1.Hide();
    }
}