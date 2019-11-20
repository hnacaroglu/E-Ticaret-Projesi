using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_markaekle : System.Web.UI.Page
{
    marka yeniekle = new marka();
    markaislem markagoster = new markaislem();

    protected void Page_Load(object sender, EventArgs e)
    {

        int markasilno = Convert.ToInt16(Request.QueryString["markasil"]);
        markagoster.markasil(markasilno);
           
     
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string markaresmi;

        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("../markaresim/") + FileUpload1.FileName);
           markaresmi = FileUpload1.FileName;
        }
        else
        {
            markaresmi = "../markaresim/" + "resimsizslidder.jpg";
        }
        yeniekle.markaekle(TextBox1.Text, markaresmi);

        Response.Write("<script>alert('Marka bilgileri başarıyla eklenmiştir. Mevcut markaları aşağıda görebilirsiniz.')</script>");
        TextBox1.Text = "";

    }

  
}
