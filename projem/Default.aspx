<%@ Page Title="" Language="C#" MasterPageFile="~/ana1.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="index" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     
			
					

					<div class="clearfix"> </div>
			
			<div class="clearfix"></div>
	
	<div class="banner-mat">
		<div class="container">
			<div class="banner">
	
				<!-- Slideshow 4 -->
                <%  System.Data.DataTable sliderresimgetir = new System.Data.DataTable();
                  sliderislemleri sresim = new sliderislemleri();
                  sliderresimgetir = sresim.slidercek(); %><!--resim çekme ilk kısım sonu><-->
			   <div class="slider">
			<ul class="rslides" id="slider1">
                 <%for (int i = 0; i < sliderresimgetir.Rows.Count; i++)
                  {%>   
			  <li><img style="width:1050px; height:349px" src="../sliderresim/<%=sliderresimgetir.Rows[i][2].ToString()%>" alt="" />
			  </li><%}  %>
			 
			</ul>
                             
		</div>

				<div style="width:1050px; height:75px;" class="banner-bottom" >
					<div class="banner-matter">
						<p></p> 
						<a href="single.html"  "></a>
					</div>
					
					<div class="clearfix"></div>
				</div>
			</div>				  
			<!-- //slider-->
		</div>
	</div>
	
             <%System.Data.DataTable dorturunal= new System.Data.DataTable();
                  urunislemleri urunlerial=new urunislemleri();
                  dorturunal=urunlerial.son4();
                   %>
           

        <% if (Convert.ToInt16(Request.QueryString["sepet"])>0)
           {
               if (Session["kuladi"]!=null)
               {
                   
               
           
                  anavt sepet = new anavt();
                  sepet.ac();
                  urun sepeturun= new urun();
                  urunislemleri sepeticin = new urunislemleri();
                  sepeturun = sepeticin.urunbul(Convert.ToInt16(Request.QueryString["sepet"]));
                  System.Data.SqlClient.SqlCommand ekle = new System.Data.SqlClient.SqlCommand("insert into tbl_sepet (secenuye,secilenurun,surun_adet,fiyat,urunadi,sresim) values(@a,@b,@c,@d,@e,@f)",sepet.baglanti);
                  ekle.Parameters.AddWithValue("@a",Session["kuladi"]);
                  ekle.Parameters.AddWithValue("@b", Convert.ToInt16(Request.QueryString["sepet"]));
                  ekle.Parameters.AddWithValue("@c",1);
                  ekle.Parameters.AddWithValue("@d", sepeturun.Ufiyat);
                  ekle.Parameters.AddWithValue("@e",sepeturun.Uadi);
                  ekle.Parameters.AddWithValue("@f", sepeturun.Uresim);
                  ekle.ExecuteNonQuery();
                  sepet.kapat();
                  Response.Redirect("sepetim.aspx");
                   }  }                 
                 %>
  
	<div class="banner-mat">
		<div class="container">
			<div class="banner">
                <div class="container">
			<div class="content">
				<div class="content-top">
					<h3 class="future">KAMPANYALI</h3>
					<div class="content-top-in"><%for (int i = 0; i < dorturunal.Rows.Count; i++)
   {%>
						<div style="width:260px; height:300px" class="col-md-3 md-col">
							<div class="col-md">
                                
								<a href="urunbilgi.aspx?bilgi=<%=dorturunal.Rows[i][0].ToString()%>"><img style="width:210px; height:223px"   src="urunresmi/<%=dorturunal.Rows[i][9].ToString()%>" alt="" /></a>

                                
								<div class="top-content">
									<h5><a href="#"><%=dorturunal.Rows[i][5].ToString()%></a></h5>
									<div class="white">
                                       
             
										   <%if (Session["uye"]!=null)
                                          {%>
                                              <a style="float:left" href="Default.aspx?sepet=<%=dorturunal.Rows[i][0].ToString()%>" class="btn btn-warning" onclick="return window.confirm('Bu ürünü sepete eklemek istediğinize emin misiniz?');">Sepete Ekle</a>
                                         <%} %>

                                        <%else
                                          {%>
                                               <a style="float:left"  href="#" class="btn btn-warning" onclick="return window.confirm('Bu işlemi gerçekleştirebilmek için üye olmanız gerekmektedir.');">Sepete Ekle</a>
                                         <% } %>
										
										<p class="dollar"><span><%=dorturunal.Rows[i][7].ToString()%></span><span class="in-dollar">TL    </span></p>
										<div class="clearfix"></div>
									</div>

								</div>							
							</div><br />
						</div>	
                       
						<% } %>
						
                        
		
			
					<div class="clearfix"></div>
					</div>
				</div>
				<!---->
                <%System.Data.DataTable markatablo = new System.Data.DataTable();
                  markaislem markam = new markaislem();
                  markatablo = markam.markalist();                   
                    
                     %>



				<div class="content-middle">
					<h3 class="future">MARKALAR</h3>

					<div class="content-middle-in">
					<ul id="flexiselDemo1">		
                        <%for (int i = 0; i < markatablo.Rows.Count; i++)
                          {%>
                              
                       
                        <li><img style="width:140px; height:140px" src="../markaresim/<%=markatablo.Rows[i]["markaresim"]%>"/></li>
                          <%} %>
					</ul>
            		<script type="text/javascript">
		$(window).load(function() {
			$("#flexiselDemo1").flexisel({
				visibleItems: 4,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
		    	responsiveBreakpoints: { 
		    		portrait: { 
		    			changePoint:480,
		    			visibleItems: 1
		    		}, 
		    		landscape: { 
		    			changePoint:640,
		    			visibleItems: 2
		    		},
		    		tablet: { 
		    			changePoint:768,
		    			visibleItems: 3
		    		}
		    	}
		    });
		    
		});
	</script>
	<script type="text/javascript" src="js/jquery.flexisel.js"></script>

					</div>
				</div>
				<!---->
                  <%System.Data.DataTable urunal= new System.Data.DataTable();
                  urunislemleri urunlericek=new urunislemleri();
                  urunal = urunlericek.urunlistele();
                   %>

                   <% 
                           System.Data.DataTable urunsayfam = new System.Data.DataTable();
                           urunislemleri urunsayfala = new urunislemleri();
                           int urunadet = (Convert.ToInt16(Session["sno"]) - 1) * 4;
                           urunsayfam = urunsayfala.urunsayfa(urunadet, 4);
                           
                           %>
				<div class="content-bottom">
					<h3 class="future">ÜRÜNLER</h3>
					<div class="content-bottom-in">
					<ul id="flexiselDemo2">		
                        <%for (int i = 0; i < urunsayfam.Rows.Count; i++)
                          {%>
                              
                          
						<li><div class="col-md men" style="width:auto; height:280px" >
								<a href="urunbilgi.aspx?bilgi=<%=urunsayfam.Rows[i]["urnid"]%>" class="compare-in "><img  src="urunresmi/<%=urunsayfam.Rows[i]["urnresim"].ToString()%>" alt="" />
								<div class="compare in-compare" >
									
								</div></a>
								<div class="top-content bag" >
									<h5><a href="#"><%=urunsayfam.Rows[i]["urnadi"].ToString()%></a></h5>
									<div class="white">
                                        <%if (Session["uye"]!=null)
                                          {%>
                                              <a  href="Default.aspx?sepet=<%=urunsayfam.Rows[i][0].ToString()%>" class="btn btn-warning" onclick="return window.confirm('Bu ürünü sepete istediğinize emin misiniz?');">Sepete Ekle</a>
                                         <%} %>

                                        <%else
                                          {%>
                                               <a  href="#" class="btn btn-warning" onclick="return window.confirm('Bu işlemi gerçekleştirebilmek için üye olmanız gerekmektedir.');">Sepete Ekle</a>
                                         <% } %>
										
										<p class="dollar"><span><%=urunsayfam.Rows[i]["urnfiyati"].ToString()%></span><span class="in-dollar">TL</span></p>
										<div class="clearfix"></div>
									</div>
								</div>							
							</div></li><%} %>	
					
						
						
					</ul>
					<script type="text/javascript">
		$(window).load(function() {
			$("#flexiselDemo2").flexisel({
				visibleItems: 4,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
		    	responsiveBreakpoints: { 
		    		portrait: { 
		    			changePoint:480,
		    			visibleItems: 1
		    		}, 
		    		landscape: { 
		    			changePoint:640,
		    			visibleItems: 2
		    		},
		    		tablet: { 
		    			changePoint:768,
		    			visibleItems: 3
		    		}
		    	}
		    });
		    
		});
	</script>
					</div>
				</div>
            <div style="width:auto; height:25px;">    <ul id="sayfano" runat="server" class="start">
               <li ><a href="#"><i></i></a></li>

                    
                    
                   
            </ul></div>
				<!--<ul id="sayfanoo" class="start">
					<li ><a href="#"><i></i></a></li>
					<li><span>1</span></li>
					<li class="arrow"><a href="#">2</a></li>
					<li class="arrow"><a href="#">3</a></li>
					<li class="arrow"><a href="#">4</a></li>
					<li class="arrow"><a href="#">5</a></li>
					<li ><a href="#"><i  class="next"> </i></a></li>
				</ul>-->
			</div>
		</div>
		<!---->
                <!---->

</div>
                    </div>
                    </div>
</asp:Content>

