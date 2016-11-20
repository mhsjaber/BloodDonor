<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="BloodDonor.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="fh5co-feature-product" class="fh5co-section-white">
		<div class="container">
            <div class="row">
				<div class="col-md-12 text-center heading-section">
					<h3>Profile</h3>
				</div>
			</div>
			<div class="col-sm-12 row animate-box">
			</div>
		</div>
	</div>
    <script>
        $(document).ready(function () {
            $.ajax({
                url: "DonorsService.asmx/Myprofile",
                type: "POST",
                dataType: "JSON",
                success: function (data) {
                    console.log(data);
                },
                error: function (data) {
                    console.log(data.error);
                }
            });
        });        
    </script>
</asp:Content>
