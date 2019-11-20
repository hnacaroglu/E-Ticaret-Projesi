<%@ Page Title="" Language="C#" MasterPageFile="~/ana1.master" AutoEventWireup="true" CodeFile="sepetim.aspx.cs" Inherits="sepetim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div style="width:800px; height:auto; margin:20px auto">
   
								<ul class="sub-icon1 list">
						  <h3>Sepetimdeki Ürünler</h3>
                                     
                                  

						  <div class="shopping_cart" style="width:250px; height:auto">

                              <%
                                  
                                      System.Data.DataTable sepetin = new System.Data.DataTable();
                                        sepetislemleri sepettekiler = new sepetislemleri();
                                        sepetin = sepettekiler.sepetici(Session["kuladi"].ToString());
                                          %>
                               <%
                                        if (sepetin.Rows.Count==0)
                                        {%>
                                            <h4>Sepetinizde Ürün Bulunmamaktadır.</h4>
                                       
                                    <%   }   %>

                              <%
                                  if (Convert.ToInt16(Request.QueryString["arti"])>0)
                                  {

                                      sepettekiler.sepetarti(Convert.ToInt16(Request.QueryString["arti"]));
                                     
                                      
                          
                                  Response.Redirect("sepetim.aspx");
                                }
                                  if (Convert.ToInt16(Request.QueryString["eksi"])>0)
                                  {
                                      sepettekiler.sepeteksi(Convert.ToInt16(Request.QueryString["eksi"]));
                                      Response.Redirect("sepetim.aspx");
                                  } 
                                   
                                
                                   %>
                                
                              <%
                                  if (sepetin.Rows.Count!=0)
                                  {
                                  
                                 int toplami = 0; 
                                  
                                  for (int i = 0; i < sepetin.Rows.Count; i++)
                                {

                                    TextBox1.Text = sepetin.Rows[i][3].ToString(); %>
                                    <%   
                                           toplami = toplami + ((Convert.ToInt16(sepetin.Rows[i][4]))*(Convert.ToInt16(sepetin.Rows[i][3])));
                                           
                                          
                                           
                                           %>
                              
							  <div class="cart_box" style="width:750px; height:auto; margin:30px auto">
							   	 <div class="message">
							   	     <div style="float:right"><a href="sepetim.aspx?sil=<%=sepetin.Rows[i][0]%>"> <img style="width:20px; height:20px" src="images/delete-icon.png" onclick="return window.confirm('Bu ürünü sepetinizden çıkarmak istediğinize emin misiniz?');"/></a></div> 

                                        
					                <div class="list_img"><img src="urunresmi/<%=sepetin.Rows[i][6] %>" class="img-responsive" alt=""></div>
								    <div class="list_desc"><h4><a href="urunbilgi.aspx?bilgi=<%=sepetin.Rows[i][1] %>"><%=sepetin.Rows[i][5].ToString() %></a></h4> 
                                        <!----sepet toplama-->
                                         <div> Adet: 
                                            
                                             <%if (Convert.ToInt16(sepetin.Rows[i][3])==1)
                                               {%>
                                                   <img style="width:20px; height:20px" src="images/beyaz-renk.jpg" />
                                            <%   }
                                               else
                                               {%>
                                                     <a href="sepetim.aspx?eksi=<%=sepetin.Rows[i][0]%>"><img style="width:20px; height:20px" src="images/eksi.png" /></a> 
                                          <%     }%>
                                            <asp:TextBox ID="TextBox1" runat="server" Text="" Height="24px" Width="34px"></asp:TextBox>
                                           
                                            

                                            
                                             &nbsp;<a href="sepetim.aspx?arti=<%=sepetin.Rows[i][0]%> "><img style="width:20px; height:20px" src="images/plus.png" /></a>
                                             <div></div>&nbsp; 
                                             
                                             </div>  <span class="actual">
		                       
                                                 
                                                 
                                                    <%=(Convert.ToInt16(sepetin.Rows[i][4])*(Convert.ToInt16(sepetin.Rows[i][3]))) %> TL</span></div>
		                              <div class="clearfix"></div>
	                              </div>
	                            </div>   
                              
                               <% } 
                                  %>

    <!-- anavt sepet = new anavt();
System.Data.DataTable sepetartirma = new System.Data.DataTable();
sepet.ac();
System.Data.SqlClient.SqlCommand sepett = new System.Data.SqlClient.SqlCommand("update tbl_sepet set surun_adet=surun_adet+@a where alisverissepetiid=@b",sepet.baglanti);
sepett.Parameters.AddWithValue("@a",Convert.ToInt16(1));
sepett.Parameters.AddWithValue("@b",Convert.ToInt16(Request.QueryString["arti"]));
sepett.ExecuteNonQuery();
                                  
                                 
                                  
sepet.kapat();-->
	                           
	                        <div class="total">
	                        	<div class="total_left">Toplam Tutar:  </div>
	                        	<div class="total_right"><%= toplami.ToString() %> TL</div>
	                        	<div class="clearfix"> </div>
	                        </div>
                            <div class="login_buttons">
							  <div class="check_button"><a href="Default.aspx" onclick="return window.confirm('Sepetinizdeki ürünler size gönderilmek üzere hazırlanacaktır. Bu işlemi devam ettirmek istiyor musunuz?');">Satın Al</a></div>
							  <div class="clearfix"></div>
						    </div>
					      <div class="clearfix"></div>
						</ul>
							</div><%  }%>

</asp:Content>

