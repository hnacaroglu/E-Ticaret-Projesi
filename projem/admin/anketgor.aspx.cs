using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class anketgor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        anavt anket = new anavt();       
        anket.ac();
        System.Data.SqlClient.SqlCommand anketlerim = new System.Data.SqlClient.SqlCommand("delete from tbl_anket where sirano=@a", anket.baglanti);
        anketlerim.Parameters.AddWithValue("@a", Convert.ToInt16(Request.QueryString["anketsil"]));
        anketlerim.ExecuteNonQuery();
        anket.kapat();
    }
}