using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class sliddergoster : System.Web.UI.Page
{
    sliderislemleri yeni = new sliderislemleri();
    anavt slider = new anavt();
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Data.DataTable slidergetir = new System.Data.DataTable();
        sliderislemleri slidder = new sliderislemleri();        
        slidergetir = slidder.tekslider(Convert.ToInt16(Request.QueryString["slid"]));
       
         if (!IsPostBack)
        {    
        
        TextBox1.Text = slidergetir.Rows[0][1].ToString();
        Image1.ImageUrl = "../sliderresim/" + slidergetir.Rows[0][2].ToString();
    }}
    protected void Button1_Click(object sender, EventArgs e)
    {
        int guncelno=Convert.ToInt16(Request.QueryString["slid"]);
        string guncelresim;
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("../sliderresim/") + FileUpload1.FileName);
            guncelresim = FileUpload1.FileName;
            Image1.ImageUrl = "../sliderresim/" + FileUpload1.FileName;
        }
        else
        {
            guncelresim = Image1.ImageUrl;
        }
        yeni.sliderguncel(guncelno,TextBox1.Text,guncelresim);
        Response.Write("<script>alert('Slider bilgileri başarıyla güncellenmiştir.')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("slidderekle.aspx");
    }
}