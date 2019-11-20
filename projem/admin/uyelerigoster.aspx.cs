using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uyelerigoster : System.Web.UI.Page
{
    uyekayitislemleri siluye = new uyekayitislemleri();
    protected void Page_Load(object sender, EventArgs e)
    {
        int silinecekuye = Convert.ToInt16(Request.QueryString["sil1"]);
        siluye.uyesil(silinecekuye);
        int onayliuye = Convert.ToInt16(Request.QueryString["onayla"]);
        siluye.tekuyeonay(onayliuye,1);
        int onaylama = Convert.ToInt16(Request.QueryString["onaylama"]);
        siluye.tekuyeonay(onaylama, 0);



    }
}