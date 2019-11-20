using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
       

        urunislemleri islem = new urunislemleri();

        int bulunduğumuzsayfa; // hangi sayfadayız


        if (Convert.ToInt16(Request.QueryString["sayno"]) == 0)
        {
            bulunduğumuzsayfa = 1;
        }

        else
        {
            bulunduğumuzsayfa = Convert.ToInt16(Request.QueryString["sayno"]); //a href ile hangi sayfa yüklensin
        }

        int usay = islem.urunsayisi();
        //sayfano.InnerHtml += usay.ToString();
        int tsay = 0;
        if (usay % 4 == 0)
        {
            tsay = usay / 4;
        }
        else
        {
            tsay = (usay / 4) + 1;
        }

       // sayfano.InnerHtml +=  tsay.ToString();

        for (int i = 1; i <= tsay; i++)
        {

            if (i == bulunduğumuzsayfa)
            {
                sayfano.InnerHtml += "<li><span>" + i + "</span></li>";
            }

            else
            {
                sayfano.InnerHtml += "<li class='arrow'><a href='Default.aspx?sayno=" + i + " '>" + i + " </a></li>";
            }


            if (i != tsay)
            {
               // sayfano.InnerHtml += "";
            }
        }
        sayfano.InnerHtml += " <li ><a href='#'><i  class='next'> </i></a></li>";
        Session["sno"] = bulunduğumuzsayfa;
 }
    }
}