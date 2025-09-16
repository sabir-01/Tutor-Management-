using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TMS_project.admin
{
    public partial class View_Teacher : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_user"] == null)
            {
                Response.Redirect("Login_form.aspx");
            }   
            LoadTeachers();
                LoadFilterDropdowns();
                LoadStatistics();           
                ClearAddForm();
        }

        private void LoadTeachers(string searchTerm = "", string cityFilter = "", string qualificationFilter = "")
        {
            string query = @"SELECT [Tutor_id], [name], [surname], [gender], [age], [martial_status], 
                           [country], [city], [address], [qulification], [degree], [experience], 
                           [contactno], [username], [password], [email]
                           FROM [TMS_db].[dbo].[tutor_signup] WHERE 1=1";

            // Add search conditions
            if (!string.IsNullOrEmpty(searchTerm))
            {
                query += " AND ([name] LIKE @SearchTerm OR [username] LIKE @SearchTerm OR [contactno] LIKE @SearchTerm)";
            }
            if (!string.IsNullOrEmpty(cityFilter))
            {
                query += " AND [city] = @CityFilter";
            }
            if (!string.IsNullOrEmpty(qualificationFilter))
            {
                query += " AND [qulification] = @QualificationFilter";
            }

            query += " ORDER BY [Tutor_id] DESC";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (!string.IsNullOrEmpty(searchTerm))
                    {
                        cmd.Parameters.AddWithValue("@SearchTerm", "%" + searchTerm + "%");
                    }
                    if (!string.IsNullOrEmpty(cityFilter))
                    {
                        cmd.Parameters.AddWithValue("@CityFilter", cityFilter);
                    }
                    if (!string.IsNullOrEmpty(qualificationFilter))
                    {
                        cmd.Parameters.AddWithValue("@QualificationFilter", qualificationFilter);
                    }

                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvTeachers.DataSource = dt;
                    gvTeachers.DataBind();
                }
            }
        }

        private void LoadFilterDropdowns()
        {
            // Load Cities
            string cityQuery = "SELECT DISTINCT [city] FROM [tutor_signup] WHERE [city] IS NOT NULL AND [city] != '' ORDER BY [city]";
            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(cityQuery, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlCityFilter.Items.Clear();
                    ddlCityFilter.Items.Add(new ListItem("All Cities", ""));

                    while (reader.Read())
                    {
                        ddlCityFilter.Items.Add(new ListItem(reader["city"].ToString(), reader["city"].ToString()));
                    }
                }
            }

            // Load Qualifications
            string qualificationQuery = "SELECT DISTINCT [qulification] FROM [tutor_signup] WHERE [qulification] IS NOT NULL AND [qulification] != '' ORDER BY [qulification]";
            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(qualificationQuery, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlQualificationFilter.Items.Clear();
                    ddlQualificationFilter.Items.Add(new ListItem("All Qualifications", ""));

                    while (reader.Read())
                    {
                        ddlQualificationFilter.Items.Add(new ListItem(reader["qulification"].ToString(), reader["qulification"].ToString()));
                    }
                }
            }
        }

        private void LoadStatistics()
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                conn.Open();

                // Total Teachers
                string totalQuery = "SELECT COUNT(*) FROM [tutor_signup]";
                using (SqlCommand cmd = new SqlCommand(totalQuery, conn))
                {
                    lblTotalTeachers.Text = cmd.ExecuteScalar().ToString();
                }

                // Qualified Teachers (with qualification)
                string qualifiedQuery = "SELECT COUNT(*) FROM [tutor_signup] WHERE [qulification] IS NOT NULL AND [qulification] != ''";
                using (SqlCommand cmd = new SqlCommand(qualifiedQuery, conn))
                {
                    lblQualifiedTeachers.Text = cmd.ExecuteScalar().ToString();
                }

                // Unique Cities
                string cityQuery = "SELECT COUNT(DISTINCT [city]) FROM [tutor_signup] WHERE [city] IS NOT NULL AND [city] != ''";
                using (SqlCommand cmd = new SqlCommand(cityQuery, conn))
                {
                    lblCities.Text = cmd.ExecuteScalar().ToString();
                }

                // Experienced Teachers (5+ years)
                string experiencedQuery = "SELECT COUNT(*) FROM tutor_signup WHERE experience > 5";
                using (SqlCommand cmd = new SqlCommand(experiencedQuery, conn))
                {
                    try
                    {
                        lblExperienced.Text = cmd.ExecuteScalar().ToString();
                    }
                    catch
                    {
                        lblExperienced.Text = "0";
                    }
                }

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadTeachers(txtSearch.Text, ddlCityFilter.SelectedValue, ddlQualificationFilter.SelectedValue);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlCityFilter.SelectedIndex = 0;
            ddlQualificationFilter.SelectedIndex = 0;
            LoadTeachers();
        }

        protected void gvTeachers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int tutorId = Convert.ToInt32(e.CommandArgument);

            switch (e.CommandName)
            {
                case "ViewTeacher":
                    ViewTeacher(tutorId);
                    break;
                case "EditTeacher":
                    EditTeacher(tutorId);
                    break;
                case "DeleteTeacher":
                    DeleteTeacher(tutorId);
                    break;
            }
        }

        protected void gvTeachers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Handle if needed for inline editing
        }

        protected void gvTeachers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Handle if needed for inline deleting
        }

        protected void gvTeachers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Add any row-specific styling or logic here
                e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='#f8f9fa'";
                e.Row.Attributes["onmouseout"] = "this.style.backgroundColor=''";
            }
        }

        private void ViewTeacher(int tutorId)
        {
            string query = @"SELECT * FROM [tutor_signup] WHERE [Tutor_id] = @TutorId";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@TutorId", tutorId);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        lblViewName.Text = reader["name"].ToString();
                        lblViewSurname.Text = reader["surname"].ToString();
                        lblViewUsername.Text = reader["username"].ToString();
                        lblViewEmail.Text = reader["email"].ToString();
                        lblViewAge.Text = reader["age"].ToString();
                        lblViewGender.Text = reader["gender"].ToString();
                        lblViewMaritalStatus.Text = reader["martial_status"].ToString();
                        lblViewQualification.Text = reader["qulification"].ToString();
                        lblViewDegree.Text = reader["degree"].ToString();
                        lblViewExperience.Text = reader["experience"].ToString();
                        lblViewCity.Text = reader["city"].ToString();
                        lblViewCountry.Text = reader["country"].ToString();
                        lblViewContactNo.Text = reader["contactno"].ToString();
                        lblViewAddress.Text = reader["address"].ToString();

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showViewModal", "showModal('viewTeacherModal');", true);
                    }
                }
            }
        }

        private void EditTeacher(int tutorId)
        {
            string query = @"SELECT * FROM [tutor_signup] WHERE [Tutor_id] = @TutorId";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@TutorId", tutorId);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        hfEditTeacherID.Value = tutorId.ToString();
                        txtEditName.Text = reader["name"].ToString();
                        txtEditSurname.Text = reader["surname"].ToString();
                        txtEditUsername.Text = reader["username"].ToString();
                        txtEditPassword.Text = reader["password"].ToString();
                        txtEditEmail.Text = reader["email"].ToString();
                        txtEditAge.Text = reader["age"].ToString();
                        ddlEditGender.SelectedValue = reader["gender"].ToString();
                        ddlEditMaritalStatus.SelectedValue = reader["martial_status"].ToString();
                        txtEditQualification.Text = reader["qulification"].ToString();
                        txtEditDegree.Text = reader["degree"].ToString();
                        txtEditExperience.Text = reader["experience"].ToString();
                        txtEditCity.Text = reader["city"].ToString();
                        txtEditCountry.Text = reader["country"].ToString();
                        txtEditContactNo.Text = reader["contactno"].ToString();
                        txtEditAddress.Text = reader["address"].ToString();

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showEditModal", "showModal('editTeacherModal');", true);
                    }
                }
            }
        }

        private void DeleteTeacher(int tutorId)
        {
            string query = "DELETE FROM [tutor_signup] WHERE [Tutor_id] = @TutorId";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@TutorId", tutorId);
                    conn.Open();
                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        LoadTeachers();
                        LoadStatistics();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "deleteSuccess",
                            "alert('Teacher deleted successfully!');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "deleteError",
                            "alert('Error deleting teacher!');", true);
                    }
                }
            }
        }
        protected void btnUpdateTeacher_Click(object sender, EventArgs e)
        {
            int tutorId = Convert.ToInt32(hfEditTeacherID.Value);

            // Check for duplicate username (excluding current teacher)
            if (IsUsernameExists(txtEditUsername.Text, tutorId))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "usernameExistsEdit",
                    "alert('Username already exists! Please choose a different username.'); showModal('editTeacherModal');", true);
                return;
            }

            // Check for duplicate email (excluding current teacher)
            if (IsEmailExists(txtEditEmail.Text, tutorId))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "emailExistsEdit",
                    "alert('Email already exists! Please choose a different email.'); showModal('editTeacherModal');", true);
                return;
            }

            string query = @"UPDATE [tutor_signup] SET 
                            [name] = @Name, [surname] = @Surname, [gender] = @Gender, 
                            [age] = @Age, [martial_status] = @MaritalStatus, [country] = @Country, 
                            [city] = @City, [address] = @Address, [qulification] = @Qualification, 
                            [degree] = @Degree, [experience] = @Experience, [contactno] = @ContactNo, 
                            [username] = @Username, [password] = @Password, [email] = @Email
                            WHERE [Tutor_id] = @TutorId";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@TutorId", tutorId);
                    cmd.Parameters.AddWithValue("@Name", txtEditName.Text);
                    cmd.Parameters.AddWithValue("@Surname", txtEditSurname.Text);
                    cmd.Parameters.AddWithValue("@Gender", ddlEditGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@Age", string.IsNullOrEmpty(txtEditAge.Text) ? (object)DBNull.Value : txtEditAge.Text);
                    cmd.Parameters.AddWithValue("@MaritalStatus", ddlEditMaritalStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@Country", txtEditCountry.Text);
                    cmd.Parameters.AddWithValue("@City", txtEditCity.Text);
                    cmd.Parameters.AddWithValue("@Address", txtEditAddress.Text);
                    cmd.Parameters.AddWithValue("@Qualification", txtEditQualification.Text);
                    cmd.Parameters.AddWithValue("@Degree", txtEditDegree.Text);
                    cmd.Parameters.AddWithValue("@Experience", string.IsNullOrEmpty(txtEditExperience.Text) ? (object)DBNull.Value : txtEditExperience.Text);
                    cmd.Parameters.AddWithValue("@ContactNo", txtEditContactNo.Text);
                    cmd.Parameters.AddWithValue("@Username", txtEditUsername.Text);
                    cmd.Parameters.AddWithValue("@Password", txtEditPassword.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEditEmail.Text);

                    conn.Open();
                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        LoadTeachers();
                        LoadFilterDropdowns();
                        LoadStatistics();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "updateSuccess",
                            "alert('Teacher updated successfully!');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "updateError",
                            "alert('Error updating teacher!'); showModal('editTeacherModal');", true);
                    }
                }
            }
        }

        private bool IsUsernameExists(string username, int excludeTutorId = 0)
        {
            string query = "SELECT COUNT(*) FROM [tutor_signup] WHERE [username] = @Username";
            if (excludeTutorId > 0)
            {
                query += " AND [Tutor_id] != @TutorId";
            }

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    if (excludeTutorId > 0)
                    {
                        cmd.Parameters.AddWithValue("@TutorId", excludeTutorId);
                    }

                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        private bool IsEmailExists(string email, int excludeTutorId = 0)
        {
            string query = "SELECT COUNT(*) FROM [tutor_signup] WHERE [email] = @Email";
            if (excludeTutorId > 0)
            {
                query += " AND [Tutor_id] != @TutorId";
            }

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    if (excludeTutorId > 0)
                    {
                        cmd.Parameters.AddWithValue("@TutorId", excludeTutorId);
                    }

                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        private void ClearAddForm()
        {
            txtName.Text = "";
            txtSurname.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtEmail.Text = "";
            txtAge.Text = "";
            ddlGender.SelectedIndex = 0;
            ddlMaritalStatus.SelectedIndex = 0;
            txtQualification.Text = "";
            txtDegree.Text = "";
            txtExperience.Text = "";
            txtContactNo.Text = "";
            txtCity.Text = "";
            txtCountry.Text = "";
            txtAddress.Text = "";
        }
    }
}