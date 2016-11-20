using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Web.Script;
using System.Web.Script.Serialization;
using System.Configuration;

namespace BloodDonor
{
    /// <summary>
    /// Summary description for DescriptionService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class DescriptionService : System.Web.Services.WebService
    {

        [WebMethod]
        public void GetDescription()
        {
            ContactClass des = new ContactClass();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM OrgDetails WHERE Status = 1", con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    des.ID = Convert.ToInt32(rdr["Id"]);
                    des.Description = rdr["Description"].ToString();
                    des.Contact = rdr["Contact"].ToString();
                    des.Address = rdr["Address"].ToString();
                    des.Email = rdr["Email"].ToString();
                    des.Website = rdr["Website"].ToString();
                    des.About = rdr["About"].ToString();
                    des.Mission = rdr["Mission"].ToString();
                    des.Vision = rdr["Vision"].ToString();
                    des.Others = rdr["Others"].ToString();
                    des.Charity = rdr["Charity"].ToString(); 
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(des));
        }

        [WebMethod]
        public void SaveMessage(ContactClass des)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                string qr = "INSERT INTO ContactMessage "+
                    "(FullName, Email, Message, CreateDate, Status"+
                    ") VALUES('" + des.Name + "', '" + des.Email + 
                    "', '" + des.Message + "', '" + DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt") + "', '1')";
                SqlCommand cmd = new SqlCommand(qr, con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
