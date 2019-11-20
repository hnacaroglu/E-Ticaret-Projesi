using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_markaguncelle : System.Web.UI.Page
{ 
    DataTable markabilgisi = new DataTable();
    markaislem gmarka = new markaislem();
    marka yeni = new marka();
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        int gelenmark = Convert.ToInt16(Request.QueryString["markagncl"]);
        markabilgisi = gmarka.markayibul(gelenmark);

        if (!IsPostBack)
        {
            
       
        TextBox1.Text = markabilgisi.Rows[0]["markaadi"].ToString();
        Image1.ImageUrl = "../markaresim/" + markabilgisi.Rows[0]["markaresim"];
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int gelenmark = Convert.ToInt16(Request.QueryString["markagncl"]);

        string mresim;
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("../markaresim/") + FileUpload1.FileName);
            mresim = FileUpload1.FileName;
            Image1.ImageUrl = "../markaresim/" + FileUpload1.FileName;
        }
        else
        {
            mresim = Image1.ImageUrl;
        }

        gmarka.markaguncel(gelenmark, TextBox1.Text, mresim);

        Response.Write("<script>alert('Marka bilgileri başarıyla güncellenmiştir. .')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("markaekle.aspx");
    }
}