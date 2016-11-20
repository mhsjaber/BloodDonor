using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodDonor
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FullName"] != null && Session["Email"] != null && Session["Password"] != null)
            {
                Response.Redirect("Profile");
            }
        }
    }
}