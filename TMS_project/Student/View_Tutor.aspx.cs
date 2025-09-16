using System;
using System;
using System.Collections.Generic;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMS_project.Student
{
    public partial class View_Tutor : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student"] == null)
            {
                Response.Redirect("~/Student_Login.aspx");
            }
            if (!IsPostBack)
            {
                BindRepeater();
            }
        }
        void BindRepeater()
        {
            SqlConnection con = new SqlConnection(cs);
            string querry = "select * from tutor_signup";
            SqlDataAdapter sda = new SqlDataAdapter(querry, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            Repeater1.DataSource = data;
            Repeater1.DataBind();

        }

        protected void searchbtn_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string querry = @"SELECT * FROM tutor_signup 
                  WHERE name LIKE '%" + SerachText.Text + @"%' 
                     OR surname LIKE '%" + SerachText.Text + @"%' 
                     OR gender LIKE '%" + SerachText.Text + @"%' 
                     OR age LIKE '%" + SerachText.Text + @"%' 
                     OR martial_status LIKE '%" + SerachText.Text + @"%' 
                     OR country LIKE '%" + SerachText.Text + @"%' 
                     OR city LIKE '%" + SerachText.Text + @"%' 
                     OR address LIKE '%" + SerachText.Text + @"%' 
                     OR qulification LIKE '%" + SerachText.Text + @"%' 
                     OR degree LIKE '%" + SerachText.Text + @"%' 
                     OR experience LIKE '%" + SerachText.Text + @"%' 
                     OR contactno LIKE '%" + SerachText.Text + @"%' 
                     OR username LIKE '%" + SerachText.Text + @"%' 
                     OR password LIKE '%" + SerachText.Text + @"%' 
                     OR email LIKE '%" + SerachText.Text + @"%'";
            SqlDataAdapter sda = new SqlDataAdapter(querry, con);
            DataTable data = new DataTable();
            sda.Fill(data);

            if (data.Rows.Count > 0)
            {
                Repeater1.DataSource = data;
                Repeater1.DataBind();

            }
            else
            {
                Response.Write("<script>alert('No data found');</script>");
                Repeater1.DataSource = null;
                Repeater1.DataBind();
            }
        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SendRequest")
            {
                int tutorId = Convert.ToInt32(e.CommandArgument);
                string studentUsername = Session["student"].ToString(); // must be set at login

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString))
                {
                    string query = @"INSERT INTO Request (StudentUsername, Tutor_id, Status) 
                             VALUES (@StudentUsername, @Tutor_id, @Status)";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@StudentUsername", studentUsername);
                    cmd.Parameters.AddWithValue("@Tutor_id", tutorId);
                    cmd.Parameters.AddWithValue("@Status", "Pending");

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();

                        ScriptManager.RegisterStartupScript(this, this.GetType(),
                            "alert", "alert('Request Sent Successfully!');", true);
                    }
                    catch (SqlException ex)
                    {
                        if (ex.Number == 547) // FK violation
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(),
                                "alert", $"alert('Error: Either Student ({studentUsername}) or Tutor ({tutorId}) does not exist.');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(),
                                "alert", "alert('An error occurred while sending the request. Please try again later.');", true);
                        }
                    }
                }
            }
        }

    }

}

