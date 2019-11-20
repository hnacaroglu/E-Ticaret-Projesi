<%@ Page Title="" Language="C#" MasterPageFile="~/ana1.master" AutoEventWireup="true" CodeFile="iletisim.aspx.cs" Inherits="iletisim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    	<div class="container">
			<div class="contact">
			<h2 class=" contact-in">İLETİŞİM</h2>
				
				<div class="col-md-6 contact-top">
					<h3>BİLGİ</h3>
					<div class="map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d8579.219444975479!2d28.864615587374097!3d40.2210654510021!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa1108911db539788!2zVWx1ZGHEnyDDnG52LiDEsGt0aXNhZGkgVmUgxLBkYXJpIEJpcmltbGVyIEZha8O8bHRlc2k!5e1!3m2!1str!2str!4v1501783484800" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
					
					</div>
					
					<p>Bize ulaşmak için yan tarafta bulunan alanı doldurarak dilek ve şikayetlerinizi iletebilirsiniz. </p>
					<p>Merkez depomuz Bursa Demirtaş Sanayi Bölgesi içerisinde yer almaktadır. İstanbul , Gaziantep , Ankara ve İzmir de dağıtım şubelerimiz yer almaktadır.</p>				
					<ul class="social ">
						<li><span><i > </i>Demirtaş Organize Sanayi Sitesi- BURSA </span></li>
						<li><span><i class="down"> </i>+ 00 123 456 7890</span></li>
						<li><a href="#"><i class="mes"> </i>nacarshopp@gmail.com</a></li>
					</ul>
				</div>
				<div class="col-md-6 contact-top">
					<h3>BİZİMLE İLETİŞİME GEÇMEK İSTER MİSİNİZ?</h3>
						<div>
							<span>Adınız </span>		
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>				
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" * Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Viletisim" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
						</div>
						<div>
							<span>E- Mail Adresiniz </span>		
							  <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" * Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Viletisim" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>					
						</div>
						<div>
							<span>Konu</span>		
							  <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" * Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Viletisim" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
						</div>
						<div>
							<span>Mesajınız </span>		
							  <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox>	&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage=" * Bu Alan Boş Geçilemez." ForeColor="Red" ValidationGroup="Viletisim" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
						</div>
                    <asp:Button ID="Button1" runat="server" Text="Gönder"  ValidationGroup="Viletisim" OnClick="Button1_Click1" />	
				</div>
			<div class="clearfix"> </div>
		</div>
	</div>
		<!---->
</span><div style="width:auto; height:333px"></div>
</asp:Content>

