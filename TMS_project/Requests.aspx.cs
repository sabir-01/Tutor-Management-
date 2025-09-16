using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMS_project
{
    public partial class Requests : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRequests();
            }
        }
        private void LoadRequests()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"
                    SELECT r.RequestID, 
                           r.StudentUsername, 
                           t.name + ' ' + t.surname AS TutorName, 
                           r.Status, 
                           r.CreatedDate
                    FROM Request r
                    INNER JOIN tutor_signup t ON r.Tutor_id = t.Tutor_id
                    ORDER BY r.CreatedDate DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvRequests.DataSource = dt;
                gvRequests.DataBind();
            }
        }
     protected void gvRequests_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvRequests.EditIndex = e.NewEditIndex;
            LoadRequests();
        }

        protected void gvRequests_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvRequests.EditIndex = -1;
            LoadRequests();
        }

        protected void gvRequests_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int requestId = Convert.ToInt32(gvRequests.DataKeys[e.RowIndex].Value);

            // Get dropdown value
            DropDownList ddlStatus = (DropDownList)gvRequests.Rows[e.RowIndex].FindControl("ddlStatus");
            string newStatus = ddlStatus.SelectedValue;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE Request SET Status=@Status WHERE RequestID=@RequestID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Status", newStatus);
                cmd.Parameters.AddWithValue("@RequestID", requestId);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            gvRequests.EditIndex = -1;
            LoadRequests();
 }  }    }