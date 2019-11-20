using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_urunekle : System.Web.UI.Page
{
    urun newurun = new urun();
    urunislemleri yeniurun = new urunislemleri();

    
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        newurun.Ukat = Convert.ToInt16(DropDownList1.SelectedValue);
        newurun.Ualtkat = Convert.ToInt16(DropDownList2.SelectedValue);
        newurun.Umarka = Convert.ToInt16(DropDownList3.SelectedValue);
        newurun.Udurum = Convert.ToInt16(DropDownList4.SelectedValue);
        newurun.Uadi = TextBox1.Text;
        newurun.Uozellik = TextBox2.Text;
        newurun.Ufiyat = Convert.ToInt16(TextBox3.Text);
        newurun.Ustok = Convert.ToInt16(TextBox4.Text);
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("../urunresmi/") + FileUpload1.FileName);
            newurun.Uresim = FileUpload1.FileName;
        }
        else
        {
            newurun.Uresim = "resimsizslidder.jpg";
        }
        if (FileUpload2.HasFile)
        {
            FileUpload2.SaveAs(Server.MapPath("../urunresmi/") + FileUpload2.FileName);
            newurun.Uresim2 = FileUpload2.FileName;
        }
        else
        {
            newurun.Uresim2 = "resimsizslidder.jpg";
        }
        if (FileUpload3.HasFile)
        {
            FileUpload3.SaveAs(Server.MapPath("../urunresmi/") + FileUpload3.FileName);
            newurun.Uresim3 = FileUpload3.FileName;
        }
        else
        {
            newurun.Uresim3 = "resimsizslidder.jpg";
        }
        if (FileUpload4.HasFile)
        {
            FileUpload4.SaveAs(Server.MapPath("../urunresmi/") + FileUpload4.FileName);
            newurun.Uresim4 = FileUpload4.FileName;
        }
        else
        {
            newurun.Uresim4 = "resimsizslidder.jpg";
        }
        newurun.Ubilgi = TextBox5.Text;

        yeniurun.urunkayit(newurun);

        Response.Write("<script>alert('Ürün bilgileri başarıyla eklenmiştir.')</script>");

        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";

    }
}