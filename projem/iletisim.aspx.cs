using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class iletisim : System.Web.UI.Page
{
    emailclass yenimail = new emailclass();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
  
    protected void Button1_Click1(object sender, EventArgs e)
    {
        string uyemsji = "Değerli ziyaretçimiz, mesajınız alınmıştır. Sizinle en kısa sürede iletişime geçeceğiz. Teşekkür eder, iyi günler dileriz...";

        yenimail.gonder("NacarShopp Mesaj", uyemsji, TextBox2.Text);
        Response.Write("<script>alert('Mesajınız gönderilmiştir.Lütfen E-Mailinizi kontrol ediniz.')</script>");
    }
}