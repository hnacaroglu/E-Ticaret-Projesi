using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class ankethazirla : System.Web.UI.Page
{
    anavt anket = new anavt();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        anket.ac();
        System.Data.SqlClient.SqlCommand anketlerim = new System.Data.SqlClient.SqlCommand("delete from tbl_anket where sirano=@a", anket.baglanti);
        anketlerim.Parameters.AddWithValue("@a", Convert.ToInt16(Request.QueryString["anketsil"]));
        anketlerim.ExecuteNonQuery();
        anket.kapat();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        anket.ac();
        SqlCommand ekle = new SqlCommand("insert into tbl_anket (soru,a,b,c,d,durum) values(@a,@b,@c,@d,@e,@f)", anket.baglanti);
        ekle.Parameters.AddWithValue("@a", TextBox1.Text);
        ekle.Parameters.AddWithValue("@b", TextBox2.Text);
        ekle.Parameters.AddWithValue("@c", TextBox3.Text);
        ekle.Parameters.AddWithValue("@d", TextBox4.Text);
        ekle.Parameters.AddWithValue("@e", TextBox5.Text);
        ekle.Parameters.AddWithValue("@f", 0);
        ekle.ExecuteNonQuery();
      

        SqlCommand eklecevap = new SqlCommand("insert into tbl_anket_cvp (a,b,c,d) values(@a,@b,@c,@d)", anket.baglanti);

        eklecevap.Parameters.AddWithValue("@a", 0);
        eklecevap.Parameters.AddWithValue("@b", 0);
        eklecevap.Parameters.AddWithValue("@c", 0);
        eklecevap.Parameters.AddWithValue("@d", 0);
        eklecevap.ExecuteNonQuery();
        //
        anket.kapat();


        Response.Write("<script>alert('Yeni anket başarıyla oluşturulmuştur. Bu anketi yayınlamak için - Anket Yayınla-  sayfasını ziyaret edebilirsiniz.')</script>");
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
    }
}