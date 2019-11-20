using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class anketyayinla : System.Web.UI.Page
{
    anavt anketislem = new anavt();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            DataTable sorular = new DataTable();

            anketislem.ac();
            SqlCommand cek = new SqlCommand("select * from tbl_anket", anketislem.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(cek);
            adp.Fill(sorular);
            for (int i = 0; i < sorular.Rows.Count; i++)
            {
                DropDownList1.Items.Add(sorular.Rows[i]["soru"].ToString());
                DropDownList1.Items[i].Value = sorular.Rows[i][0].ToString();
            }


            anketislem.kapat();
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        anketislem.ac();
        SqlCommand sifirla = new SqlCommand("update tbl_anket set durum=@a", anketislem.baglanti);
        sifirla.Parameters.AddWithValue("@a", 0);
        sifirla.ExecuteNonQuery();
        SqlCommand duzelt = new SqlCommand("update tbl_anket set durum=@a where sirano=@b", anketislem.baglanti);
        duzelt.Parameters.AddWithValue("@a", 1);
        duzelt.Parameters.AddWithValue("@b", DropDownList1.SelectedValue);
        duzelt.ExecuteNonQuery();
        anketislem.kapat();

        Response.Write("<script>alert('Seçtiğiniz anket başarılı bir şekilde yayına alınmıştır.')</>");
    }
}