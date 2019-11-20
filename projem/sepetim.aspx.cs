using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sepetim : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     
        System.Data.DataTable sepetin = new System.Data.DataTable();
        sepetislemleri sepettekiler = new sepetislemleri();
        sepetin = sepettekiler.sepetici(Session["kuladi"].ToString());
        if (Session["uye"] == null)
        {
            Response.Redirect("Default.aspx");
        }

        sepettekiler.sepetsil(Convert.ToInt16(Request.QueryString["sil"]));
         if (!IsPostBack)
	{


        Response.Write("<script>alert('Seçtiğiniz ürünler listeleniyor. Lütfen bekleyiniz...')</script>");
}
        
    }
    }
   