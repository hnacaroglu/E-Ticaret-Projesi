using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class tamurun : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        urunislemleri islem = new urunislemleri();
        if (!IsPostBack)
        {
            
      

        int bulunduğumuzsayfa; // hangi sayfadayız


        if (Convert.ToInt16(Request.QueryString["tsayno"]) == 0)
        {
            bulunduğumuzsayfa = 1;
        }

        else
        {
            bulunduğumuzsayfa = Convert.ToInt16(Request.QueryString["tsayno"]); //a href ile hangi sayfa yüklensin
        }

        int usay = islem.urunsayisi();
       // sayfano.InnerHtml += usay.ToString();
        int tsay = 0;
        if (usay % 8 == 0)
        {
            tsay = usay / 8;
        }
        else
        {
            tsay = (usay / 8) + 1;
        }

       // sayfano.InnerHtml += "sayfa sayısı" + tsay.ToString();

        for (int i = 1; i <= tsay; i++)
        {

            if (i == bulunduğumuzsayfa)
            {
                sayfano.InnerHtml += "<li><span>" + i + "</span></li>";
            }

            else
            {
                sayfano.InnerHtml += "<li class='arrow'><a href='tamurun.aspx?tsayno=" + i + " '>" + i + " </a></li>";
            }


            if (i != tsay)
            {
               // sayfano.InnerHtml += "--";
            }
        } Session["tsno"] = bulunduğumuzsayfa;
    }  }
}