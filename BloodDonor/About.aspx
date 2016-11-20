<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="BloodDonor.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
		<div id="fh5co-content-section" class="fh5co-section-gray">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center heading-section">
						<h3>About Us</h3>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
					</div>
				</div>

				<div class="row animate-box">
					<div class="col-md-12">
						<div class="feature-text">
							<p id="description"></p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="fh5co-feature-product" class="fh5co-section-white">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center heading-section">
						<h3>Mission, Vision & Charity</h3>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
					</div>
				</div>

				<div class="row animate-box">
					<div class="col-md-12">
						<div class="feature-text">
							<h2>Mission</h2>
							<p id="mission"></p>
						</div>
					</div>
					<div class="col-md-12">
						<div class="feature-text">
							<h2>Vision</h2>
							<p id="vision"></p>
						</div>
					</div>
					<div class="col-md-12">
						<div class="feature-text">
							<h2>Charity</h2>
							<p id="charity"></p>
						</div>
					</div>
				</div>
			</div>
		</div>


	<script>

	    $(document).ready(function () {
	        $.ajax({
	            url: "ContactService.asmx/GetDescription",
	            type: "POST",
	            dataType: "JSON",
	            success: function (data) {
	                $("#mission").html(data.Mission);
	                $("#vision").html(data.Vision);
	                $("#charity").html(data.Charity);
	                $("#description").html(data.Description);
	                //$("#address").html(data.Address);
	            }
	        });
	    });
	</script>
</asp:Content>
