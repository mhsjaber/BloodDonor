<%@ Page Title="Donors" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Donors.aspx.cs" Inherits="BloodDonor.Donors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="fh5co-feature-product" class="fh5co-section-gray">
		<div class="container">
            <div class="row">
				<div class="col-md-12 text-center heading-section">
					<h3>Blood Donors</h3>
				</div>
			</div>
			<div class="col-sm-12 row animate-box" style="margin-bottom:15px">
                <div class="col-sm-12">
                    <div class="col-sm-2 col-xs-4 search-box">
                        <label for="Sblood">B.Group</label>
                        <select class="form-control md" id="Sblood">
                            <option>All</option>
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
                    <div class="col-sm-4 col-xs-8 search-box">
                        <label for="Sdistrict">District</label>
                         <select class="form-control required" id="Sdistrict">
                            <option>All</option>
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
                                <option>Dhaka</option>
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
                    <div class="col-sm-4 col-xs-8 search-box">
                        <label for="Sarea">Area</label>
                        <input type="text" id="Sarea" class="form-control" placeholder="Enter Area"/>
                    </div>
                    <div class="col-sm-2 col-xs-4 search-box" style="padding-top: 27px;">
                        <button type="button" class="btn btn-success" onclick="searchDonors()">Go <i class="glyphicon glyphicon-menu-right"></i></button>
                    </div>
                </div>
            </div>

			<div class="col-sm-12 row animate-box" id="donor-section">
			</div>
		</div>
	</div>
    <script>
        $(document).ready(function () {
            $.ajax({
                url: "DonorsService.asmx/GetDonors",
                type: "POST",
                dataType: "JSON",
                success: function (data) {
                    var html = '';

                    $.each(data, function (i, item) {
                        html += '<div class="col-md-4 col-sm-6 col-xs-12 donors">' +
                                    '<div class="donor-box">' +
                                        '<h3>' + item.Name + '</h3>' +
                                        'Blood Group : <span>' + item.BloodGroup + '</span><br/>' +
                                        'Mobile : <span>' + item.Mobile + '</span><br/>' +
                                        'Status : <span>' + item.DonateStatus + '</span><br/>' +
                                        'Location : <span>' + item.Area + ', ' + item.District + '</span><br/>' +
                                    '</div>' +
                                '</div>';
                    });
                    $('#donor-section').html(html);
                },
                error: function (data) {
                    console.log(data.error);
                }
            });
        });

        function searchDonors() {
            var dn = {};
            dn.BloodGroup = $('#Sblood').val();
            dn.District = $('#Sdistrict').val();
            dn.Area = $('#Sarea').val();
            console.log(dn);

            $.ajax({
                url: "DonorsService.asmx/SearchDonors",
                type: "POST",
                dataType: "JSON",
                data: "{dn:" + JSON.stringify(dn) + "}",
                success: function (data) {
                    var html = '';
                    console.log(data);
                    //$.each(data, function (i, item) {
                    //    html += '<div class="col-md-4 col-sm-6 col-xs-12 donors">' +
                    //                '<div class="donor-box">' +
                    //                    '<h3>' + item.Name + '</h3>' +
                    //                    'Blood Group : <span>' + item.BloodGroup + '</span><br/>' +
                    //                    'Mobile : <span>' + item.Mobile + '</span><br/>' +
                    //                    'Status : <span>' + item.DonateStatus + '</span><br/>' +
                    //                    'Location : <span>' + item.District + ', ' + item.Area + '</span><br/>' +
                    //                '</div>' +
                    //            '</div>';
                    //});
                    //$('#donor-section').html(html);
                },
                error: function (data) {
                    console.log(data.error);
                }
            });
        }

    </script>
</asp:Content>
