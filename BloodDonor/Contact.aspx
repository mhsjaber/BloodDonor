<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="BloodDonor.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #ValidAlert, #SentAlert, #MailAlert {
            display:none;
        }
    </style>
        <div id="fh5co-feature-product" class="fh5co-section-white">
			<div class="container">
                <div class="row">
					<div class="col-md-12 text-center heading-section">
						<h3>Contact Us</h3>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
					</div>
				</div>
				<div class="row animate-box">
					<div class="col-md-6">
						<h3 class="section-title">Our Address</h3>
						<p id="others"></p>
						<ul class="contact-info">
							<li><i class="icon-location-pin"></i> <span id="address"></span></li>
							<li><i class="icon-phone2"></i> <span id="contact"></span></li>
							<li><i class="icon-mail"></i> <a href="#"><span id="email"></span></a></li>
							<li><i class="icon-globe2"></i> <a href="#"><span id="website"></span></a></li>
						</ul>
					</div>
					<div class="col-md-6">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<input type="text" id="Cname" class="form-control" placeholder="Name">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<input type="text" id="Cemail" class="form-control" placeholder="Email">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<textarea name="" id="Cmessage" class="form-control" cols="30" rows="7" placeholder="Message"></textarea>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
                                    <button type="button" class="btn btn-primary" onclick="verify()" ><i class="glyphicon glyphicon-envelope"></i> Send Message</button>
								    <br />
                                    <span id="ValidAlert"><label class="label label-danger">All fields are required!</label></span>
                                    <span id="MailAlert"><label class="label label-danger">Invalid Email!</label></span>
                                    <span id="SentAlert"><label class="label label-success">Message sent successfully!</label></span>
                                </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-sm">
    
          <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Are you sure?</h4>
                    </div>
                    <div class="modal-body">
                        <p>Send message to authority?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success btn-sm" data-dismiss="modal" onclick="sendMessage()"><i class="glyphicon glyphicon-ok"></i> Yes</button>
                        <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="glyphicon glyphicon-remove"></i> No</button>
                    </div>
                </div>
            </div>
        </div>
    <script>
        var des = {};
        function verify() {
            des.Name = $("#Cname").val();
            des.Email = $("#Cemail").val();
            des.Message = $("#Cmessage").val();

            var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;

            if (des.Name.length > 0 && des.Email.length > 0 && des.Message.length > 0) {
                $('#ValidAlert').hide('slow');
                if (!pattern.test(des.Email)) {
                    $('#MailAlert').show('slow');
                }
                else {
                    $('#myModal').modal('show');
                    $('#MailAlert').hide('slow');
                }
            }
            else {
                $('#ValidAlert').show('slow');
            }
        }

        function sendMessage() {
            $.ajax({
                url: "ContactService.asmx/SaveMessage",
                type: "POST",
                contentType: "application/json;charset=utf-8",
                data: "{des:" + JSON.stringify(des) + "}",
                success: function (data) {
                    $('#SentAlert').show('slow');
                    $("#Cname").val('');
                    $("#Cemail").val('');
                    $("#Cmessage").val('');
                    setTimeout(function () { $('#SentAlert').hide('slow'); }, 5000);
                }
            });
        }

        $(document).ready(function () {
            $.ajax({
                url: "ContactService.asmx/GetDescription",
                type: "POST",
                dataType: "JSON",
                success: function (data) {
                    $("#others").html(data.Others);
                    $("#contact").html(data.Contact);
                    $("#email").html(data.Email);
                    $("#website").html(data.Website);
                    $("#address").html(data.Address);
                }
            });
        });
    </script>
</asp:Content>
