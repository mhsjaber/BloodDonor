<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="BloodDonor.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #ValidAlert, #RegAlert, #MailAlert {
            display:none;
        }
    </style>
        <div id="fh5co-feature-product" class="fh5co-section-white">
			<div class="container">
                <div class="row">
					<div class="col-md-12 text-center heading-section">
						<h3>Registration Form</h3>
						<p>Register to become an <span>Honourable Member</span>. Please give your proper information, contact number, district/area, blood group to help others to find you <span>as a donor</span>.</p>
					</div>
				</div>
				<div class="col-sm-12 row animate-box">
					<div class="col-md-6">
						<div class="row form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="name">Name: <span>*</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control required" id="name" placeholder="Enter name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="mobile">Mobile: <span>*</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control required" id="mobile" placeholder="Enter mobile number">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="email">Email: <span>*</span></label>
                                <div class="col-sm-9">
                                    <input type="email" class="form-control required" id="email" placeholder="Enter email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="password">Password: <span>*</span></label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control required" id="password" placeholder="Enter password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="district">District: <span>*</span></label>
                                <div class="col-sm-9">
                                    <select class="form-control required md" id="district">
                                        <optgroup label="Barisal Division">
                                            <option>Barguna</option>
                                            <option>Barisal</option>
                                            <option>Bhola</option>
                                            <option>Jhalokati</option>
                                            <option>Patuakhali</option>
                                            <option>Pirojpur</option>
                                        </optgroup>
                                        <optgroup label="Chittagong Division">
                                            <option>Bandarban</option>
                                            <option>Brahmanbaria</option>
                                            <option>Chandpur</option>
                                            <option>Chittagong</option>
                                            <option>Comilla</option>
                                            <option>Cox's Bazar</option>
                                            <option>Feni</option>
                                            <option>Khagrachhari</option>
                                            <option>Lakshmipur</option>
                                            <option>Noakhali</option>
                                            <option>Rangamati</option>
                                        </optgroup>
                                        <optgroup label="Dhaka Division">
                                            <option selected>Dhaka</option>
                                            <option>Faridpur</option>
                                            <option>Gazipur</option>
                                            <option>Gopalganj</option>
                                            <option>Jamalpur</option>
                                            <option>Kishoreganj</option>
                                            <option>Madaripur</option>
                                            <option>Manikganj</option>
                                            <option>Munshiganj</option>
                                            <option>Mymensingh</option>
                                            <option>Narayanganj</option>
                                            <option>Narsingdi</option>
                                            <option>Netrakona</option>
                                            <option>Rajbari</option>
                                            <option>Shariatpur</option>
                                            <option>Sherpur</option>
                                            <option>Tangail</option>
                                        </optgroup>
                                        <optgroup label="Khulna Division">
                                            <option>Bagerhat</option>
                                            <option>Chuadanga</option>
                                            <option>Jessore</option>
                                            <option>Jhenaidah</option>
                                            <option>Khulna</option>
                                            <option>Kushtia</option>
                                            <option>Magura</option>
                                            <option>Meherpur</option>
                                            <option>Narail</option>
                                            <option>Satkhira</option>
                                        </optgroup>
                                        <optgroup label="Rajshahi Division">
                                            <option>Bogra</option>
                                            <option>Joypurhat</option>
                                            <option>Naogaon</option>
                                            <option>Natore</option>
                                            <option>Nawabganj</option>
                                            <option>Pabna</option>
                                            <option>Rajshahi</option>
                                            <option>Sirajganj</option>
                                        </optgroup>
                                        <optgroup label="Rangpur Division">
                                            <option>Dinajpur</option>
                                            <option>Gaibandha</option>
                                            <option>Kurigram</option>
                                            <option>Lalmonirhat</option>
                                            <option>Nilphamari</option>
                                            <option>Panchagarh</option>
                                            <option>Rangpur</option>
                                            <option>Thakurgaon</option>
                                        </optgroup>
                                        <optgroup label="Sylhet Division">
                                            <option>Habiganj</option>
                                            <option>Moulvibazar</option>
                                            <option>Sunamganj</option>
                                            <option>Sylhet</option>
                                        </optgroup>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="area">Area: <span>*</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control required sm" id="area" placeholder="Enter area">
                                </div>
                            </div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="row form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="address">Address</label>
                                <div class="col-sm-9">
                                    <textarea class="form-control" id="address" placeholder="Enter full address (optional)"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="blood">B. Group: <span>*</span></label>
                                <div class="col-sm-9">
                                    <select class="form-control md" id="blood">
                                        <option>A+</option>
                                        <option>B+</option>
                                        <option>O+</option>
                                        <option>AB+</option>
                                        <option>A-</option>
                                        <option>B-</option>
                                        <option>O-</option>
                                        <option>AB-</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="area">Status: <span>*</span></label>
                                <div class="col-sm-9">
                                    <select class="form-control required md" id="donateStatus">
                                        <option>Donate anytime.</option>
                                        <option>Donate, if urgent.</option>
                                        <option>Not now, Recently donated.</option>
                                        <option>Not now, Donate later.</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="publish">Publish: <span>*</span></label>
                                <div class="col-sm-9">
                                    <select class="form-control required md" id="publish">
                                        <option value="1"> Yes, I want to publish</option>
                                        <option value="2"> No, Publish me later.</option>
                                    </select>
                                </div>
                            </div>
							<div class="form-group">
                                <label class="control-label col-sm-3"></label>
                                <div class="col-sm-9" style="padding-top:6px">
                                    <button type="button" class="btn btn-primary" onclick="verify()" ><i class="glyphicon glyphicon-user"></i> Register</button>
								    <br />
                                    <span id="ValidAlert"><label class="label label-danger">Fields are required!</label></span>
                                    <span id="MailAlert"><label class="label label-danger">Invalid Email!</label></span>
                                    <span id="RegAlert"><label class="label label-success">Registered successfully!</label></span>
                                    <span><label class="label label-danger" id="URegAlert"></label></span><br />
                                    Already a member? <a runat="server" href="~/Login">Sign In</a> here.
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
                        <p>Register as a member?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success btn-sm" data-dismiss="modal" onclick="registerMember()"><i class="glyphicon glyphicon-ok"></i> Yes</button>
                        <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="glyphicon glyphicon-remove"></i> No</button>
                    </div>
                </div>
            </div>
        </div>
    <script>
        var rc = {};
        function verify() {
            rc.Name = $("#name").val();
            rc.Mobile = $("#mobile").val();
            rc.Email = $("#email").val();
            rc.Password = $("#password").val();
            rc.District = $("#district").val();
            rc.Area = $("#area").val();
            rc.Address = $("#address").val();
            rc.DonateStatus = $("#donateStatus").val();
            rc.Publish = $("#publish").val();
            rc.BloodGroup = $("#blood").val();

            var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
            var x = true;

            $(".required").each(function () {
                if ($(this).val().length == 0) {
                    $(this).addClass('form-conrol-danger');
                    x = false;
                }
                else {
                    $(this).removeClass('form-conrol-danger');
                }
            });

            if (x) {
                $('#ValidAlert').hide('slow');
                if (!pattern.test(rc.Email)) {
                    $('#MailAlert').show('slow');
                    $('#email').addClass('form-conrol-danger');
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

        function registerMember() {
            $.ajax({
                url: "RegistrationService.asmx/RegisterMember",
                type: "POST",
                contentType: "application/json;charset=utf-8",
                data: "{rc:" + JSON.stringify(rc) + "}",
                success: function (data) {
                    if (data.d == "2") {
                        $('#URegAlert').html('Already registered with this email ID.');
                    }
                    else if (data.d == "3") {
                        $('#URegAlert').html('Error in registration.');
                    }
                    else {
                        window.location.replace("Login");
                    }
                },
                error: function (data) {
                    console.log(data);
                }
            });
        }

        $(document).ready(function () {
            $.ajax({
                url: "ContactService.asmx/GetDescription",
                type: "POST",
                dataType: "JSON",
                success: function (data) {
                }
            });
        });
    </script>
</asp:Content>
