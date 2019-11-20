<%@ Page Title="" Language="C#" MasterPageFile="~/ana1.master" AutoEventWireup="true" CodeFile="tamurun.aspx.cs" Inherits="tamurun" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <div class="container">
			<div class="products" >
                  
                     <% 
                         System.Data.DataTable tamtablo = new System.Data.DataTable();

                         urunislemleri tamsayfa = new urunislemleri();
                         int urunsayfa = (Convert.ToInt16(Session["tsno"]) - 1) * 8;

                         tamtablo = tamsayfa.urunsayfam( urunsayfa, 8,Convert.ToInt16(DropDownList1.SelectedValue));
                             
                             
                             
                    %>
                   
                      
        
             
             
					<h2 class=" products-in">ÜRÜNLER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="789">Sıralama Seçiniz...</asp:ListItem>
                        <asp:ListItem Value="0">Fiyatı Artana Göre</asp:ListItem>
                        <asp:ListItem Value="1">Fiyatı Azalana Göre</asp:ListItem>
                        </asp:DropDownList>   </h2>
					<div class=" top-products" >
                       
                        <%for (int i = 0; i < tamtablo.Rows.Count; i++)
                          {%>
                              
                        
						<div class="col-md-3 md-col" style="margin:10px 0px 10px 0">
							<div class="col-md" style="width:auto; height:300px">
								<a href="urunbilgi.aspx?bilgi=<%=tamtablo.Rows[i][0]%>" class="compare-in"><img  src="urunresmi/<%=tamtablo.Rows[i]["urnresim"].ToString()%>" alt="" />
								<div class="compare">
									
								</div>
								</a>	
								<div class="top-content">
									<h5 ><a href="#"><%=tamtablo.Rows[i]["urnadi"].ToString()%></a></h5>
									<div class="white">
										   <%if (Session["uye"]!=null)
                                          {%>
                                              <a  href="Default.aspx?sepet=<%=tamtablo.Rows[i][0].ToString()%>" class="btn btn-warning" onclick="return window.confirm('Bu ürünü sepete eklemek istediğinize emin misiniz?');">Sepete Ekle</a>
                                         <%} %>
 
                                        <%else
                                          {%>
                                             <a  href="#" class="btn btn-warning" onclick="return window.confirm('Bu işlemi gerçekleştirebilmek için üye olmanız gerekmektedir.');">Sepete Ekle</a>
                                         <% } %>
										
										<p class="dollar"><span class="in-dollar"></span><span><%=tamtablo.Rows[i]["urnfiyati"].ToString()%></span>TL</p>
										<div class="clearfix"></div>
									</div>
								</div>							
							</div>
						</div><%  } %>
						
					<div class="clearfix"></div>
					</div>
			</div> <div style="width:auto; height:80px"> <ul id="sayfano" runat="server" class="start">
               <li ><a href="#"><i></i></a></li>

                    
                    
                   
            </ul>
       </div> 

            </div>
		


</asp:Content>

