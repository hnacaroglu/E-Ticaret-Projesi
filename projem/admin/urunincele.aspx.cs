using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_urunincele : System.Web.UI.Page
{
    urunislemleri guncelurun = new urunislemleri();
    urun yeni = new urun();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            string gelen = Request.QueryString["gncl"];
            yeni = guncelurun.urunbul(Convert.ToInt16(gelen));

            DropDownList1.Text = yeni.Ukat.ToString();
            DropDownList2.Text = yeni.Ualtkat.ToString();
            DropDownList3.Text = yeni.Umarka.ToString();
            DropDownList4.Text = yeni.Udurum.ToString();
            TextBox5.Text = yeni.Uadi.ToString();
            TextBox6.Text = yeni.Uozellik.ToString();
            TextBox7.Text = yeni.Ufiyat.ToString();
            TextBox8.Text = yeni.Ustok.ToString();
            Image1.ImageUrl = "../urunresmi/"+yeni.Uresim.ToString();
            Image2.ImageUrl = "../urunresmi/"+ yeni.Uresim2.ToString();
            Image3.ImageUrl = "../urunresmi/"+ yeni.Uresim3.ToString();
            Image4.ImageUrl = "../urunresmi/"+ yeni.Uresim4.ToString();
            TextBox4.Text = yeni.Ubilgi.ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        yeni.Ukat = Convert.ToInt16(DropDownList1.SelectedValue);
        yeni.Ualtkat = Convert.ToInt16(DropDownList2.SelectedValue);
        yeni.Umarka = Convert.ToInt16(DropDownList3.SelectedValue);
        yeni.Udurum = Convert.ToInt16(DropDownList4.SelectedValue);
        yeni.Uadi = TextBox5.Text;
        yeni.Uozellik = TextBox6.Text;
        yeni.Ufiyat = Convert.ToInt16(TextBox7.Text);
        yeni.Ustok = Convert.ToInt16(TextBox8.Text);
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("../urunresmi/") + FileUpload1.FileName);
            yeni.Uresim = FileUpload1.FileName;
            Image1.ImageUrl = "../urunresmi/" + FileUpload1.FileName; 
        }
        else
        {
            yeni.Uresim = Image1.ImageUrl;
        }
        if (FileUpload2.HasFile)
        {
            FileUpload2.SaveAs(Server.MapPath("../urunresmi/") + FileUpload2.FileName);
            yeni.Uresim2 = FileUpload2.FileName;
            Image2.ImageUrl = "../urunresmi/" + FileUpload2.FileName; 
        }
        else
        {
            yeni.Uresim2 = Image2.ImageUrl;
        }
        if (FileUpload3.HasFile)
        {
            FileUpload3.SaveAs(Server.MapPath("../urunresmi/") + FileUpload3.FileName);
            yeni.Uresim3 = FileUpload3.FileName;
            Image3.ImageUrl = "../urunresmi/" + FileUpload3.FileName; 
        }
        else
        {
            yeni.Uresim3 = Image3.ImageUrl;
        }
        if (FileUpload4.HasFile)
        {
            FileUpload4.SaveAs(Server.MapPath("../urunresmi/") + FileUpload4.FileName);
            yeni.Uresim4 = FileUpload4.FileName;
            Image4.ImageUrl = "../urunresmi/" + FileUpload4.FileName; 
        }
        else
        {

            yeni.Uresim4 = Image4.ImageUrl;
        }
        yeni.Ubilgi = TextBox4.Text;
        guncelurun.urunguncelle(yeni, Convert.ToInt16(Request.QueryString["gncl"]));
        Response.Write("<script>alert('Ürün bilgileri başarıyla güncellenmiştir.')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("urunliste.aspx");
    }
}