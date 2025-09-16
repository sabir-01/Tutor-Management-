using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMS_project.Student
{
    public partial class Status_check : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if student session is null
                if (Session["student"] == null || string.IsNullOrEmpty(Session["student"].ToString()))
                {
                    Response.Redirect("~/Student_Login.aspx");
                }
                else
                {
                    string studentUsername = Session["student"].ToString();
                  
                    Response.Write(studentUsername);
                    BindStudentRequests(studentUsername);


                }
            }
        }


        private void BindStudentRequests(string studentUsername)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT r.RequestID, 
                        t.name AS TutorName, 
                        r.Status, 
                        r.CreatedDate
                 FROM Request r
                 INNER JOIN tutor_signup t ON r.Tutor_id = t.Tutor_id
                 WHERE r.StudentUsername = @StudentUsername";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@StudentUsername", studentUsername);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvStudentRequests.DataSource = dt;
                gvStudentRequests.DataBind();
            }
        }
    }
}