using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class giris : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

      

       
       
            
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {



        if ((TextBox1.Text=="admin") && (TextBox2.Text=="1234"))
        {
            
           Session["admin"] = "evet";

           if (Session["admin"] == "evet")
           {

               Response.Redirect("index.aspx");
           }
    }
        

        
    
        else
        {
            Response.Write("<script>alert('Kullanıcı Adı / Şifre Hatalı.')</script>");
        }
    }
}