<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BloodDonor.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #ValidAlert, #LogAlert, #MailAlert, #LogErrorAlert, #DeactiveAlert{
            display:none;
        }
    </style>
    <div id="fh5co-feature-product" class="fh5co-section-white">
		<div class="container">
            <div class="row">
				<div class="col-md-12 text-center heading-section">
					<h3>Login Form</h3>
				</div>
			</div>
			<div class="col-sm-12 row animate-box">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
					<div class="row form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="email">Email</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="text" id="email" placeholder="Enter email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="password">Password</label>
                            <div class="col-sm-9">
                                <input class="form-control" type="password" id="password" placeholder="Enter password">
                            </div>
                        </div>
						<div class="form-group">
                            <label class="control-label col-sm-3"></label>
                            <div class="col-sm-9" style="padding-top:6px">
                                <button type="button" class="btn btn-primary" onclick="login()"><i class="glyphicon glyphicon-user"></i> Login</button> <br />
                                <span id="ValidAlert"><label class="label label-danger">All fields are required!</label></span>
                                <span id="MailAlert"><label class="label label-danger">Invalid Email!</label></span>
							    <span id="LogAlert"><label class="label label-danger">Email & password not matching!</label></span>
							    <span id="LogErrorAlert"><label class="label label-danger">Error in login!</label></span>
							    <span id="DeactiveAlert"><label class="label label-danger">Your account is deactivated!</label></span><br />
                                Don't have an account? <a runat="server" href="~/Registration">Sign Up</a> here.
							</div>
						</div>
					</div>
				</div>
                <div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
    <script>
        var lg = {};
        function login() {
            lg.Password = $("#password").val();
            lg.Email = $("#email").val();

            var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;

            if (lg.Password.length > 0 && lg.Email.length > 0) {
                $('#ValidAlert').hide('slow');

                if (!pattern.test(lg.Email)) {
                    $('#MailAlert').show('slow');
                }
                else {
                    $('#MailAlert').hide();
                    $('#LogErrorAlert').hide();
                    $('#DeactiveAlert').hide();
                    $('#LogAlert').hide();

                    $.ajax({
                        url: "RegistrationService.asmx/Login",
                        type: "POST",
                        contentType: "application/json;charset=utf-8",
                        data: "{lg:" + JSON.stringify(lg) + "}",
                        success: function (data) {
                            if (data.d == '1') {
                                window.location.href = "Profile";
                            }
                            else if (data.d == '0') {
                                $('#LogErrorAlert').hide('slow');
                                $('#DeactiveAlert').hide('slow');
                                $('#LogAlert').show('slow');
                            }
                            else if (data.d == '2' || data.d == '3') {
                                $('#LogErrorAlert').show('slow');
                            }
                            else if (data.d == '-1') {
                                $('#DeactiveAlert').show('slow');
                            }
                        },
                        error: function (data) {
                            console.log(data.error);
                        }
                    });
                }
            }
            else {
                $('#ValidAlert').show('slow');
            }
        }
    </script>
</asp:Content>
