using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_anketguncelle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
      
        anavt anketgor = new anavt();
        System.Data.DataTable anketler = new System.Data.DataTable();
        anketgor.ac();
        System.Data.SqlClient.SqlCommand anketlerim = new System.Data.SqlClient.SqlCommand("select * from tbl_anket where sirano=@a", anketgor.baglanti);
        anketlerim.Parameters.AddWithValue("@a", Convert.ToInt16(Request.QueryString["anket"]));
        System.Data.SqlClient.SqlDataAdapter anketdata = new System.Data.SqlClient.SqlDataAdapter(anketlerim);
        anketdata.Fill(anketler);
        anketgor.kapat();

        TextBox1.Text = anketler.Rows[0][1].ToString();
        TextBox2.Text = anketler.Rows[0][2].ToString();
        TextBox3.Text = anketler.Rows[0][3].ToString();
        TextBox4.Text = anketler.Rows[0][4].ToString();
        TextBox5.Text = anketler.Rows[0][5].ToString();
             }          
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        anavt anket = new anavt();
        System.Data.DataTable anketler = new System.Data.DataTable();
        anket.ac();
        System.Data.SqlClient.SqlCommand anketlerim = new System.Data.SqlClient.SqlCommand("update tbl_anket set soru=@s,a=@a,b=@b,c=@c,d=@d where sirano=@n", anket.baglanti);
        anketlerim.Parameters.AddWithValue("@s",TextBox1.Text);
        anketlerim.Parameters.AddWithValue("@a", TextBox2.Text);
        anketlerim.Parameters.AddWithValue("@b", TextBox3.Text);
        anketlerim.Parameters.AddWithValue("@c", TextBox4.Text);
        anketlerim.Parameters.AddWithValue("@d", TextBox5.Text);
        anketlerim.Parameters.AddWithValue("@n", Convert.ToInt16(Request.QueryString["anket"]));
        anketlerim.ExecuteNonQuery();
        anket.kapat();

        Response.Write("<script>alert('Anket bilgileri başarıyla güncellenmiştir.')</script>");
    }
}