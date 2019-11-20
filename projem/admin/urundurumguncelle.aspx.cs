using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class urundurumguncelle : System.Web.UI.Page
{
    urundurum kampanya = new urundurum();
    System.Data.DataTable kampadi = new System.Data.DataTable();
    
    protected void Page_Load(object sender, EventArgs e)
    {
         int gelen = Convert.ToInt16(Request.QueryString["kampgncl"]);
         kampadi = kampanya.kampanyabul(gelen);
         if (!IsPostBack)
         {
             
         
         TextBox1.Text = kampadi.Rows[0]["urndurumadi"].ToString();
         }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int mno= Convert.ToInt16(Request.QueryString["kampgncl"]);
        kampanya.durumguncelle(mno, TextBox1.Text);
        Response.Write("<script>alert('Güncelleme işlemi başarıyla gerçekleşmiştir.')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("urundurumekle.aspx");
    }
}