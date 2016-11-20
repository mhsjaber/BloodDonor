using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace BloodDonor
{
    /// <summary>
    /// Summary description for DonorsService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [ScriptService]
    public class DonorsService : System.Web.Services.WebService
    {

        [WebMethod]
        public void GetDonors()
        {
            List<DonorsClass> donorList = new List<DonorsClass>();

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                string qr = "SELECT * FROM Members WHERE Status = 1 AND Publish = 1 ORDER BY BloodGroup, Name";

                SqlCommand cmd = new SqlCommand(qr, con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    DonorsClass donor = new DonorsClass();
                    donor.Name = rdr["Name"].ToString();
                    donor.Email = rdr["Email"].ToString();
                    donor.Mobile = rdr["Mobile"].ToString();
                    donor.District = rdr["District"].ToString();
                    donor.Area = rdr["Area"].ToString();
                    donor.Address = rdr["Address"].ToString();
                    donor.BloodGroup = rdr["BloodGroup"].ToString();
                    donor.DonateStatus = rdr["DonateStatus"].ToString();

                    donorList.Add(donor);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(donorList));
        }


        [WebMethod(EnableSession = true)]
        public void Myprofile()
        {
            List<DonorsClass> donorList = new List<DonorsClass>();

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                string user = HttpContext.Current.Session["Email"].ToString();
                string qr = "SELECT * FROM Members WHERE Status = 1 AND Publish = 1 AND Email = '" + user + "' ";

                SqlCommand cmd = new SqlCommand(qr, con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    DonorsClass donor = new DonorsClass();
                    donor.Name = rdr["Name"].ToString();
                    donor.DonateStatus = rdr["DonateStatus"].ToString();
                    donor.District = rdr["District"].ToString();
                    donor.Area = rdr["Area"].ToString();
                    donor.Address = rdr["Address"].ToString();
                    donor.Mobile = rdr["Mobile"].ToString();
                    donor.BloodGroup = rdr["BloodGroup"].ToString();
                    donor.Publish = Convert.ToInt32(rdr["Publish"].ToString());
                    if (!DBNull.Value.Equals(rdr["LastDonate"]))
                    {
                        donor.LastDonate = ((DateTime)rdr["LastDonate"]).ToString("dd' 'MMM',' yyyy");// .ToString(); //DateTime.ParseExact(rdr["LastDonate"].ToString(), "dd MMM, yyyy", CultureInfo.InvariantCulture).ToString();
                    }
                    else
                    {
                        donor.LastDonate = "N/A";
                    }
                    donorList.Add(donor);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(donorList));
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void SearchDonors(DonorsClass dn)
        {

            List<DonorsClass> donorList = new List<DonorsClass>();

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                string qr = "SELECT * FROM Members WHERE ";
                if (dn.Area != "")
                {
                    qr += "Area = '" + dn.Area + "' AND ";
                }
                if (dn.BloodGroup != "")
                {
                    qr += "BloodGroup = '" + dn.BloodGroup + "' AND ";
                }
                if (dn.District != "")
                {
                    qr += "District = '" + dn.District + "' AND ";
                }

                qr += "Status = 1 AND Publish = 1";

                SqlCommand cmd = new SqlCommand(qr, con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    DonorsClass donor = new DonorsClass();
                    donor.Name = rdr["Name"].ToString();
                    donor.Email = rdr["Email"].ToString();
                    donor.Mobile = rdr["Mobile"].ToString();
                    donor.District = rdr["District"].ToString();
                    donor.Area = rdr["Area"].ToString();
                    donor.Address = rdr["Address"].ToString();
                    donor.BloodGroup = rdr["BloodGroup"].ToString();

                    donorList.Add(donor);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(dn);
        }
    }
}
