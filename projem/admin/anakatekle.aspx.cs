using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class anakatekle : System.Web.UI.Page
{
    kategoriler katkyt = new kategoriler();
    kategoriislem anakatsil = new kategoriislem();
    protected void Page_Load(object sender, EventArgs e)
    {
        int silno = Convert.ToInt16(Request.QueryString["anakatsil"]);
        anakatsil.anakatsil(silno);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        katkyt.anakat(TextBox1.Text);
        
        Response.Write("<script>alert('Kategori başarıyla eklenmiştir. Mevcut kategorileri aşağıda görebilirsiniz.')</script>");

        TextBox1.Text = "";
        
       
    }
 
   
}