using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class altkatguncel : System.Web.UI.Page
{
    kategoriislem galtkat = new kategoriislem();
    DataTable altbilgi = new DataTable();
 
    protected void Page_Load(object sender, EventArgs e)
    {

        altbilgi = galtkat.altkatbul(Convert.ToInt16(Request.QueryString["altkatgncl"]));

        if (!IsPostBack)
        {
            
       TextBox1.Text = altbilgi.Rows[0][1].ToString();
        
         }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         int galtno = Convert.ToInt16(Request.QueryString["altkatgncl"]);
        galtkat.altkatguncell(galtno, TextBox1.Text);
        Response.Write("<script>alert('Alt kategori ismi başarıyla güncellenmiştir. .')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("altkatekle.aspx");

    }
}