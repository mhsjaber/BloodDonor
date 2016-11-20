using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace BloodDonor
{
    /// <summary>
    /// Summary description for RegistrationService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class RegistrationService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public string RegisterMember(RegistrationClass rc)
        {
            try
            {
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ToString();
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string qr = "INSERT INTO Members (" +
                        "Name, Email, Password, DonateStatus, District, Area, Address, " +
                        "Mobile, BloodGroup, Publish, CreateDate, Status" +
                        ") VALUES(" +
                        "'" + rc.Name +
                        "', '" + rc.Email.ToLower() +
                        "', '" + rc.Password +
                        "', '" + rc.DonateStatus +
                        "', '" + rc.District +
                        "', '" + rc.Area +
                        "', '" + rc.Address +
                        "', '" + rc.Mobile +
                        "', '" + rc.BloodGroup +
                        "', '" + rc.Publish +
                        "', '" + DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt") + "', '1')";
                    SqlCommand cmd = new SqlCommand(qr, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                return "1";
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627)
                {
                    return "2";
                }
                else
                {
                    return "Error in registration.";
                }
            }
        }

        [WebMethod]
        public void UserDetails()
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
        public string Login(RegistrationClass lg)
        {
            try
            {
                int x = 0;
                string name="asda";

                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ToString();
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string qr = "SELECT * FROM Members WHERE Password = '"+lg.Password+"' AND Email = '"+lg.Email.ToLower() + "'";
                    SqlCommand cmd = new SqlCommand(qr, con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        x++;
                        if (Convert.ToInt32(rdr["Status"]) != 1) {
                            x = -1;
                            break;
                        }
                        name = rdr["Name"].ToString();
                    }
                }

                if (x == 1)
                {
                    Session["FullName"] = name;
                    Session["Email"] = lg.Email;
                    Session["Password"] = lg.Password;
                }
                return x.ToString();
                
            }
            catch (SqlException ex)
            {
                return "3";
            }
        }
    }
}
