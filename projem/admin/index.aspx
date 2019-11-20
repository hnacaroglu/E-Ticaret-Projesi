<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <%System.Data.DataTable uyesay = new System.Data.DataTable();
      uyekayitislemleri uyeler = new uyekayitislemleri();
      uyesay = uyeler.uyelistele(); %>

    <div class="page-container">
  </div>
    <div class="four-grids">
					<div class="col-md-3 four-grid">
						<div class="four-agileits">
							<div class="icon">
								<i class="glyphicon glyphicon-user" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>Toplam Üye Sayısı</h3>
								<h4> <%=uyesay.Rows.Count.ToString()%> </h4>
								
							</div>
							
						</div>
					</div>

           <%System.Data.DataTable urunsay = new System.Data.DataTable();
      urunislemleri urunler= new urunislemleri();
      urunsay = urunler.urunlistele(); %>

					<div class="col-md-3 four-grid">
						<div class="four-agileinfo">
							<div class="icon">
								<i class="glyphicon glyphicon-list-alt" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>Toplam Ürün Çeşidi</h3>
								<h4><%=urunsay.Rows.Count.ToString()%></h4>

							</div>
							
						</div>
					</div>
					<div class="col-md-3 four-grid">
						<div class="four-w3ls">
							<div class="icon">
								<i class="glyphicon glyphicon-folder-open" aria-hidden="true"></i>
							</div>
                                    <%
                                        urunislemleri stoksayma= new urunislemleri();
                                        int stok = stoksayma.urunstoksayisi();
                               %>
							<div class="four-text">
								<h3>Toplam Ürün Stoğu</h3>
								<h4><%=stok %></h4>
								
							</div>
							
						</div>
					</div>
					<div class="col-md-3 four-grid">
						<div class="four-wthree">
							<div class="icon">
								<i class="glyphicon glyphicon-briefcase" aria-hidden="true"></i>
							</div>

                            <%urunislemleri topfiyat = new urunislemleri();
                              int toplamdeger = topfiyat.uruntopfiyati(); %>
							<div class="four-text">
								<h3>Toplam Ürün Değeri</h3>
								<h4><%=toplamdeger %> TL</h4>
								
							</div>
							
						</div>
					</div>
					<div class="clearfix"></div>
				</div>

    
</asp:Content>

