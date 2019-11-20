<%@ Page Title="" Language="C#" MasterPageFile="~/ana1.master" AutoEventWireup="true" CodeFile="tumurun.aspx.cs" Inherits="tumurun" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
			<div class="products">
                  
                     <% 
                         urunislemleri urunislem = new urunislemleri();
                         System.Data.DataTable uruntablo = new System.Data.DataTable();
                         
                         
                         int urunno = Convert.ToInt16(Request.QueryString["anaurun"]);

                       /*  if (Convert.ToInt16(Session["sno"])>0)
                         {
                             urunno = Convert.ToInt16(Session["sno"]);
                         }*/
                       
                         int alturunno = Convert.ToInt16(Request.QueryString["alturun"]);
                        
                         
                         
                            int adet = (Convert.ToInt16(Session["sno"]) - 1) * 8;
                         uruntablo = urunislem.tumkatlist(Convert.ToInt16(DropDownList1.SelectedValue),urunno,alturunno);
                        
                
                    %>
                   
                      
        
             
             
					<h2 class=" products-in">ÜRÜNLER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="789">Sıralama Seçiniz...</asp:ListItem>
                        <asp:ListItem Value="0">Fiyatı Artana Göre</asp:ListItem>
                        <asp:ListItem Value="1">Fiyatı Azalana Göre</asp:ListItem>
                        </asp:DropDownList></h2>
					<div class=" top-products">
                       
                        <%for (int i = 0; i < uruntablo.Rows.Count; i++)
                          {%>
                              
                        
						<div class="col-md-3 md-col" style="margin:10px 0px 10px 0">
							<div class="col-md" style="width:auto; height:300px" >
								<a href="urunbilgi.aspx?bilgi=<%=uruntablo.Rows[i][0]%>" class="compare-in"><img  src="urunresmi/<%=uruntablo.Rows[i]["urnresim"].ToString()%>" alt="" />
								<div class="compare">
									
								</div>
								</a>	
								<div class="top-content">
									<h5><a href="#"><%=uruntablo.Rows[i]["urnadi"].ToString()%></a></h5>
									<div class="white">
										   <%if (Session["uye"]!=null)
                                          {%>
                                              <a  href="Default.aspx?sepet=<%=uruntablo.Rows[i][0].ToString()%>" class="btn btn-warning" onclick="return window.confirm('Bu ürünü sepete eklemek istediğinize emin misiniz?');">Sepete Ekle</a>
                                         <%} %>
 
                                        <%else
                                          {%>
                                             <a  href="#" class="btn btn-warning" onclick="return window.confirm('Bu işlemi gerçekleştirebilmek için üye olmanız gerekmektedir.');">Sepete Ekle</a>
                                         <% } %>
										
										<p class="dollar"><span class="in-dollar"></span><span><%=uruntablo.Rows[i]["urnfiyati"].ToString()%></span>TL</p>
										<div class="clearfix"></div>
									</div>
								</div>							
							</div>
						</div><%  } %>
						
					<div class="clearfix"></div>
					</div>
			</div> 
       

            </div>
		
    
		<!---->
</asp:Content>

