using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class urunliste : System.Web.UI.Page
{
    urunislemleri urunsil = new urunislemleri();
    protected void Page_Load(object sender, EventArgs e)
    {
        int silurun = Convert.ToInt16(Request.QueryString["urunsil"]);
        urunsil.urunsil(silurun);
        if (!IsPostBack)
        {
            
       
        Tumurunpanel.Visible = true; 
        
        }
    }
 
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        Tumurunpanel.Visible = false;
        Anakatpanel.Visible = true;
        Altkatpanel.Visible = false;
        Markapanel.Visible = false;
        Kampanyapanel.Visible = false;
    }
    protected void DropDownList2_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Tumurunpanel.Visible = false;
        Anakatpanel.Visible = false;
        Altkatpanel.Visible = true;
        Markapanel.Visible = false;
        Kampanyapanel.Visible = false;
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Tumurunpanel.Visible = false;
        Anakatpanel.Visible = false;
        Altkatpanel.Visible = false;
        Markapanel.Visible = true;
        Kampanyapanel.Visible = false;
    }
    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        Tumurunpanel.Visible = false;
        Anakatpanel.Visible = false;
        Altkatpanel.Visible = false;
        Markapanel.Visible = false;
        Kampanyapanel.Visible = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Tumurunpanel.Visible = true;
        Anakatpanel.Visible = false;
        Altkatpanel.Visible = false;
        Markapanel.Visible = false;
        Kampanyapanel.Visible = false;
    }
}