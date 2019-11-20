using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_altkatekle : System.Web.UI.Page
{
    kategoriler altkatkyt = new kategoriler();
    kategoriislem altkat = new kategoriislem();
    protected void Page_Load(object sender, EventArgs e)
    {
        int silno = Convert.ToInt16(Request.QueryString["altkatsil"]);
        altkat.altkatsil(silno);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        altkatkyt.altkat(TextBox1.Text,Convert.ToInt16( DropDownList1.SelectedValue));
        Response.Write("<script>alert('Alt Kategori başarıyla eklenmiştir. Mevcut kategorileri aşağıda görebilirsiniz.')</script>");

        TextBox1.Text = "";

    }
}