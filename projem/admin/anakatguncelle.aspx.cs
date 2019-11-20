using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class admin_anakatguncelle : System.Web.UI.Page
{
    kategoriislem newana = new kategoriislem();
  
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
       
       System.Data.DataTable anakatlar= new System.Data.DataTable();
        kategoriislem ana=new kategoriislem();

        anakatlar=ana.anakatbulma(Convert.ToInt16(Request.QueryString["anakatgncl"]));
        
       TextBox1.Text=anakatlar.Rows[0][1].ToString();
 }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      
        int gno=Convert.ToInt16(Request.QueryString["anakatgncl"]);
        newana.anakatguncel(gno, TextBox1.Text);
        Response.Write("<script>alert('Kategori ismi başarıyla güncellenmiştir.')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("anakatekle.aspx");
    }
}