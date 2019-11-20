<%@ Page Title="" Language="C#" MasterPageFile="~/ana1.master" AutoEventWireup="true" CodeFile="urunbilgisi.aspx.cs" Inherits="urunbilgisi" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Bonfire a Ecommerce Category Flat Bootstarp Responsive Website Template | Single :: w3layouts</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Bonfire Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<link href='http://fonts.googleapis.com/css?family=Exo:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<!--//fonts-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
				<script type="text/javascript">
				    jQuery(document).ready(function ($) {
				        $(".scroll").click(function (event) {
				            event.preventDefault();
				            $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1000);
				        });
				    });
				</script>
<link rel="stylesheet" href="css/etalage.css">
<script src="js/jquery.etalage.min.js"></script>
		<script>
		    jQuery(document).ready(function ($) {

		        $('#etalage').etalage({
		            thumb_image_width: 300,
		            thumb_image_height: 400,
		            source_image_width: 900,
		            source_image_height: 1200,
		            show_hint: true,
		            click_callback: function (image_anchor, instance_id) {
		                alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
		            }
		        });

		    });
		</script>
<script>$(document).ready(function (c) {
    $('.alert-close').on('click', function (c) {
        $('.message').fadeOut('slow', function (c) {
            $('.message').remove();
        });
    });
});
</script>
<script>$(document).ready(function (c) {
    $('.alert-close1').on('click', function (c) {
        $('.message1').fadeOut('slow', function (c) {
            $('.message1').remove();
        });
    });
});
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <%  if (Convert.ToInt16(Request.QueryString["sepet"])>0)
           {
               if (Session["kuladi"]!=null)
               {
                   
               
           
                  anavt sepet = new anavt();
                  sepet.ac();
                  urun sepeturun= new urun();
                  urunislemleri sepeticin = new urunislemleri();
                  sepeturun = sepeticin.urunbul(Convert.ToInt16(Request.QueryString["sepet"]));
                  System.Data.SqlClient.SqlCommand ekle = new System.Data.SqlClient.SqlCommand("insert into tbl_sepet (secenuye,secilenurun,surun_adet,fiyat,urunadi) values(@a,@b,@c,@d,@e)",sepet.baglanti);
                  ekle.Parameters.AddWithValue("@a",Session["kuladi"]);
                  ekle.Parameters.AddWithValue("@b", Convert.ToInt16(Request.QueryString["sepet"]));
                  ekle.Parameters.AddWithValue("@c",1);
                  ekle.Parameters.AddWithValue("@d", sepeturun.Ufiyat);
                  ekle.Parameters.AddWithValue("@e",sepeturun.Uadi);
                  ekle.ExecuteNonQuery();
                  sepet.kapat();
                   }
               Response.Redirect("sepetim.aspx");
           }                 
                 %>
        
             <%System.Data.DataTable urunbilgidata= new System.Data.DataTable();
                  urunislemleri bilgial=new urunislemleri();
                  int bilgino=Convert.ToInt16(Request.QueryString["bilgi"]);
                  if (Convert.ToInt16(Request.QueryString["sepet"]) > 0)
                  {
                      bilgino = Convert.ToInt16(Request.QueryString["sepet"]);
                     
                          
                  }
                  urunbilgidata = bilgial.teklist(bilgino);
                  
                  
                      
                      
                     
                
                   %>


    <!--header-->
	<div class="header">
		<div class="header-top">
			<div class="container">	
			
			</div>
		</div>
		
		
	</div>
	<!---->
		<div class="container">
			<div class="single">
				<div class="col-md-9 top-in-single">
					<div class="col-md-5 single-top">	
						<ul id="etalage">
							<li>
								<a href="optionallink.html">
									<img class="etalage_thumb_image img-responsive" src="urunresmi/<%=urunbilgidata.Rows[0]["urnresim"].ToString()%>" alt="" />
									<img class="etalage_source_image img-responsive" src="urunresmi/<%=urunbilgidata.Rows[0]["urnresim"].ToString()%>" alt="" />
								</a>
							</li>
							<li>
								<img class="etalage_thumb_image img-responsive" src="urunresmi/<%=urunbilgidata.Rows[0]["urnresim2"].ToString()%>" alt="" />
								<img class="etalage_source_image img-responsive" src="urunresmi/<%=urunbilgidata.Rows[0]["urnresim2"].ToString()%>" alt="" />
							</li>
							<li>
								<img class="etalage_thumb_image img-responsive" src="urunresmi/<%=urunbilgidata.Rows[0]["urnresim3"].ToString()%>" alt=""  />
								<img class="etalage_source_image img-responsive" src="urunresmi/<%=urunbilgidata.Rows[0]["urnresim3"].ToString()%>" alt=""  />
							</li>
						    <li>
								<img class="etalage_thumb_image img-responsive" src="urunresmi/<%=urunbilgidata.Rows[0]["urnresim4"].ToString()%>"  alt="" />
								<img class="etalage_source_image img-responsive" src="urunresmi/<%=urunbilgidata.Rows[0]["urnresim4"].ToString()%>"  alt="" />
							</li>
						</ul>

                         <!---Sepete eklenmiştir pop up kodları-Başlangıç-->


                    <asp:Panel ID="sepetpop" runat="server">

                         <%System.Data.DataTable urunbilgidata= new System.Data.DataTable();
                  urunislemleri bilgial=new urunislemleri();
                  int bilgino=Convert.ToInt16(Request.QueryString["bilgi"]);
                  urunbilgidata = bilgial.teklist(bilgino);
                
                   %>

                       <div style="width:350px; height:150px; padding:12px; background-color:#f5f5f5; border:solid; border-color:orange; border-radius:7px">
                           <table>

                               <tr>
                                   <th style="color:orange"><h4>Merhaba...</h4></th>
                               </tr>

                          
                           <tr><td style="font-size:15px"> Bu ürünü sepetinize eklemek istiyor musunuz?
                               <br />
                               </td></tr>  <% string sepetic="sepet"; %> 
                           <tr> <td>
                                <%if (Session["uye"]!=null)
                                      {%>
                               
                              

                                              <a  href="urunbilgi.aspx?<%=sepetic%>=<%=bilgino %>"  class="btn btn-warning" >Sepete Ekle</a>
                                         <%} %>
                                
                                      
                                 <%else
                                          {%>
                                               <a  href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2" onclick="return window.confirm('Bu işlemi gerçekleştirebilmek için üye olmanız gerekmektedir.');">Sepete Ekle</a>
                                         <% } %>
                               <%  sepetic="bilgi"; %> 
                                 
                               
                               </td><td> <asp:Button ID="Button2" runat="server" Text="Vazgeç"  CssClass="btn btn-warning" />
                           <asp:Button ID="Button3" runat="server" Text="Button" Style="display:none" /> </td></tr>
                         	
                          </table>
                       </div>
                      </asp:Panel>
                        <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Button1" PopupControlID="sepetpop" CancelControlID="Button2"></asp:ModalPopupExtender>
                    
                     
                    



                <!--   Sepete eklenmiştir pop up kodları-Bitiş-->

					</div>	
					<div class="col-md-7 single-top-in">
						<div class="single-para">
							<h4><%=urunbilgidata.Rows[0]["urnadi"].ToString()%></h4>
							<div class="para-grid">
								<span  class="add-to"><%=urunbilgidata.Rows[0]["urnfiyati"]%> TL</span>
							<!--	<a href="#" class="hvr-shutter-in-vertical cart-to">Add to Cart</a>			-->		
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		<asp:Button ID="Button1" runat="server" Text="Sepete Ekle" CssClass="btn btn-success" />	
								<div class="clearfix"></div>
							 </div>
							<h5><%=urunbilgidata.Rows[0]["urnozellik"].ToString()%></h5>
							<div class="available">
								<h6>Available Options :</h6>
								<ul>
									<li>Color:
										<select>
										<option>Silver</option>
										<option>Black</option>
										<option>Dark Black</option>
										<option>Red</option>
									</select></li>
								<li>Size:<select>
									<option>Large</option>
									<option>Medium</option>
									<option>small</option>
									<option>Large</option>
									<option>small</option>
								</select></li>
								<li>Quality:<select>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select></li>
							</ul>
						</div>
							<p><%=urunbilgidata.Rows[0]["urnbilgi"].ToString()%></p>
							
								<a href="#" class="hvr-shutter-in-vertical ">More details</a>
							
						</div>
					</div>
                      <%System.Data.DataTable ayni3urun= new System.Data.DataTable();
                  urunislemleri aynial=new urunislemleri();
                  int dortno = Convert.ToInt16(urunbilgidata.Rows[0]["urnkategori"]);
                  ayni3urun = aynial.aynı3(dortno);
                
                   %>

				<div class="clearfix"> </div>
				<div class="content-top-in">

                      <%for (int i = 0; i < ayni3urun.Rows.Count; i++)
                      {%>
						<div class="col-md-4 top-single">
							<div class="col-md">
								<a href="urunbilgisi.aspx?bilgi=<%=ayni3urun.Rows[i][0].ToString()%>" class="compare-in"><img  src="urunresmi/<%=ayni3urun.Rows[i]["urnresim"] %>" alt="" /></a>	
								<div class="top-content">
									<h5><%=ayni3urun.Rows[i]["urnadi"] %></h5>
									<div class="white">

                                         <%if (Session["uye"]!=null)
                                          {%>

										<a  href="urunbilgisi.aspx?sepet=<%=ayni3urun.Rows[i][0].ToString()%>" class="btn btn-warning" onclick="return window.confirm('Bu ürünü sepete eklemek istediğinize emin misiniz?');">Sepete Ekle</a>
                                         <%} %>

                                        <%else
                                          {%>
                                               <a  href="#" class="btn btn-warning" onclick="return window.confirm('Bu işlemi gerçekleştirebilmek için üye olmanız gerekmektedir.');">Sepete Ekle</a>
                                         <% } %>
										<p class="dollar"><span><%=ayni3urun.Rows[i]["urnfiyati"] %></span><span class="in-dollar">TL</span></p>
										<div class="clearfix"></div>
									</div>
								</div>							
							</div>
						</div>
                     <%} %>
						
					<div class="clearfix"></div>
					</div>
				</div>
                                    <%System.Data.DataTable menugetir = new System.Data.DataTable();
                      kategoriler amenu = new kategoriler();
                      menugetir = amenu.menucek();
                   
                    
                     %>
				<div class="col-md-3">
					<div class="single-bottom">
						<h4>Kategoriler</h4>
						<ul> <%for (int i = 0; i < menugetir.Rows.Count; i++)
                     
                       {%>
						<li><a href="tumurun.aspx?anaurun=<%=menugetir.Rows[i][0] %>"><i> </i><%=menugetir.Rows[i][1].ToString()%></a></li><%} %>
						</ul>
					</div>
					<div class="single-bottom">
						<h4>Product Categories</h4>
						<ul>
						<li><a href="#"><i> </i>feugiat(5)</a></li>
						<li><a href="#"><i> </i>Fusce (4)</a></li>
						<li><a href="#"><i> </i> feugiat (4)</a></li>
						<li><a href="#"><i> </i>Fusce (4)</a></li>
						<li><a href="#"><i> </i> feugiat(2)</a></li>
						</ul>
					</div>
					<div class="single-bottom">
						
							
							
							
				</div>
				</div>
				<div class="clearfix"> </div>
		</div>
	</div>
		<!---->
		<div class="footer">
			
			
			<script type="text/javascript">
						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
					 		};
							*/
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
				<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

		</div><div style="height:450px;"></div>

</asp:Content>

