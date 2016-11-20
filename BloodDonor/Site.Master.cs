using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodDonor
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string user = Session["FullName"] == null ? "User" : Session["FullName"].ToString();
            if (user.Contains(' ')) {
                user = user.Substring(0, user.IndexOf(' '));
            }
            Label1.Text = user;
        }
    }
}