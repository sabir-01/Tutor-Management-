using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMS_project.Student
{
    public partial class Student_logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student"] != null)
            {
               
                Session.Abandon();

                // Redirect to login page
                Response.Redirect("~/Student_Login.aspx");
          
            }
        }
    }
}