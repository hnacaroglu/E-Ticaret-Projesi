using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_slidderekle : System.Web.UI.Page
{
    sliderislemleri yeni = new sliderislemleri();
    protected void Page_Load(object sender, EventArgs e)
    {
        int slidersil = Convert.ToInt16(Request.QueryString["slidersil"]);
        yeni.slidersil(slidersil);

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sliderresmi;

        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("../sliderresim/") + FileUpload1.FileName);
            sliderresmi =FileUpload1.FileName;
        }
        else
        {
            sliderresmi = "../sliderresim/" +"resimsizslidder.jpg";
        }

        yeni.sliderekleme(TextBox1.Text, sliderresmi);

        Response.Write("<script>alert('Slider ekleme işi başarıyla gerçekleştmiştir. Tüm sliderları aşağıda görüntüleyebilirsiniz.')</script>");
        TextBox1.Text =" ";

    }
}