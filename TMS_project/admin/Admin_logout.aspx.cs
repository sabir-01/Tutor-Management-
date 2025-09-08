using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMS_project.admin
{
    public partial class Admin_logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["admin_user"]!= null)
            {
                Session.Abandon(); // 
                Response.Redirect("Login_form.aspx");
            }

        }
    }
}