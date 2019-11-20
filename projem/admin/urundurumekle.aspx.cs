using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_urundurumekle : System.Web.UI.Page
{
    urundurum durumu = new urundurum();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        int kampsilno = Convert.ToInt16(Request.QueryString["kampsil"]);
        durumu.durumsil(kampsilno);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        durumu.urundurumekle(TextBox1.Text);

        Response.Write("<script>alert('Ürün durum bilgisi başarıyla eklenmiştir.')</script>");
        TextBox1.Text = "";
    }
}