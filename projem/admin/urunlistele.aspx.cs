using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_urunlistele : System.Web.UI.Page
{
    urunislemleri urunsil = new urunislemleri();
    protected void Page_Load(object sender, EventArgs e)
    {
        int silurun = Convert.ToInt16(Request.QueryString["urunsil"]);
        urunsil.urunsil(silurun);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        tumurunler.Visible = true;
        anakat.Visible = false;
        altkat.Visible = false;
        markakat.Visible = false;
        kmpny.Visible = false;
    }

 protected void Button2_Click1(object sender, EventArgs e)
    {
        anakat.Visible = true;
        tumurunler.Visible = false;
        altkat.Visible = false;
        markakat.Visible = false;
        kmpny.Visible = false;
    }

 
    protected void Button3_Click(object sender, EventArgs e)
    {
        tumurunler.Visible = false;
        anakat.Visible = false;
        altkat.Visible = true;
        markakat.Visible = false;
        kmpny.Visible = false;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        tumurunler.Visible = false;
        anakat.Visible = false;
        altkat.Visible = false;
        markakat.Visible = true;
        kmpny.Visible = false;

    }
 

    protected void Button5_Click1(object sender, EventArgs e)
    {
        tumurunler.Visible = false;
        anakat.Visible = false;
        altkat.Visible = false;
        markakat.Visible = false;
        kmpny.Visible = true;
    }
}