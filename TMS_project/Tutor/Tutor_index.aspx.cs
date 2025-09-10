using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMS_project.Tutor
{
    public partial class Tutor_index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tutor"] == null)
            {
                Response.Redirect("~/Tutor_Login.aspx");
            }

        }
    }
}