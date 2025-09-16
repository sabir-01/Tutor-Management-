using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace TMS_project.admin
{
    public partial class View_Student : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_user"] == null)
            {
                Response.Redirect("Login_form.aspx");
            }
            if (!IsPostBack)
            {
                // Check if admin is logged in


                LoadStudents();
                LoadFilterDropdowns();
                LoadStatistics();
            }
        }

        private void LoadStudents(string searchTerm = "", string cityFilter = "", string classFilter = "")
        {
            string query = @"SELECT [StudentID], [Name], [FatherName], [Surname], [Username], [Password], 
                           [Age], [Gender], [Class], [Subject], [TuitionType], [TutorPreferred], 
                           [GoingTo], [City], [Address], [Country], [ContactNumber]
                           FROM [TMS_db].[dbo].[student_signup] WHERE 1=1";

            // Add search conditions
            if (!string.IsNullOrEmpty(searchTerm))
            {
                query += " AND ([Name] LIKE @SearchTerm OR [Username] LIKE @SearchTerm OR [ContactNumber] LIKE @SearchTerm)";
            }
            if (!string.IsNullOrEmpty(cityFilter))
            {
                query += " AND [City] = @CityFilter";
            }
            if (!string.IsNullOrEmpty(classFilter))
            {
                query += " AND [Class] = @ClassFilter";
            }

            query += " ORDER BY [StudentID] DESC";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (!string.IsNullOrEmpty(classFilter))
                    {
                        cmd.Parameters.AddWithValue("@ClassFilter", classFilter);
                    }

                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvStudents.DataSource = dt;
                    gvStudents.DataBind();
                }
            }
        }

        private void LoadFilterDropdowns()
        {
            // Load Cities
            string cityQuery = "SELECT DISTINCT [City] FROM [student_signup] WHERE [City] IS NOT NULL AND [City] != '' ORDER BY [City]";
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
                        ddlCityFilter.Items.Add(new ListItem(reader["City"].ToString(), reader["City"].ToString()));
                    }
                }
            }

            // Load Classes
            string classQuery = "SELECT DISTINCT [Class] FROM [student_signup] WHERE [Class] IS NOT NULL AND [Class] != '' ORDER BY [Class]";
            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(classQuery, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlClassFilter.Items.Clear();
                    ddlClassFilter.Items.Add(new ListItem("All Classes", ""));

                    while (reader.Read())
                    {
                        ddlClassFilter.Items.Add(new ListItem(reader["Class"].ToString(), reader["Class"].ToString()));
                    }
                }
            }
        }

        private void LoadStatistics()
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                conn.Open();

                // Total Students
                string totalQuery = "SELECT COUNT(*) FROM [student_signup]";
                using (SqlCommand cmd = new SqlCommand(totalQuery, conn))
                {
                    lblTotalStudents.Text = cmd.ExecuteScalar().ToString();
                    lblActiveStudents.Text = cmd.ExecuteScalar().ToString(); // Assuming all are active
                }

                // Unique Cities
                string cityQuery = "SELECT COUNT(DISTINCT [City]) FROM [student_signup] WHERE [City] IS NOT NULL AND [City] != ''";
                using (SqlCommand cmd = new SqlCommand(cityQuery, conn))
                {
                    lblCities.Text = cmd.ExecuteScalar().ToString();
                }

                // Unique Subjects
                string subjectQuery = "SELECT COUNT(DISTINCT [Subject]) FROM [student_signup] WHERE [Subject] IS NOT NULL AND [Subject] != ''";
                using (SqlCommand cmd = new SqlCommand(subjectQuery, conn))
                {
                    lblSubjects.Text = cmd.ExecuteScalar().ToString();
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadStudents(txtSearch.Text, ddlCityFilter.SelectedValue, ddlClassFilter.SelectedValue);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlCityFilter.SelectedIndex = 0;
            ddlClassFilter.SelectedIndex = 0;
            LoadStudents();
        }

        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int studentId = Convert.ToInt32(e.CommandArgument);

            switch (e.CommandName)
            {
                case "ViewStudent":
                    ViewStudent(studentId);
                    break;
                case "EditStudent":
                    EditStudent(studentId);
                    break;
                case "DeleteStudent":
                    DeleteStudent(studentId);
                    break;
            }
        }

        protected void gvStudents_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Handle if needed for inline editing
        }

        protected void gvStudents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Handle if needed for inline deleting
        }

        protected void gvStudents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Add any row-specific styling or logic here
                e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='#f8f9fa'";
                e.Row.Attributes["onmouseout"] = "this.style.backgroundColor=''";
            }
        }

        private void ViewStudent(int studentId)
        {
            string query = @"SELECT * FROM [student_signup] WHERE [StudentID] = @StudentID";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StudentID", studentId);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        lblViewName.Text = reader["Name"].ToString();
                        lblViewFatherName.Text = reader["FatherName"].ToString();
                        lblViewSurname.Text = reader["Surname"].ToString();
                        lblViewUsername.Text = reader["Username"].ToString();
                        lblViewAge.Text = reader["Age"].ToString();
                        lblViewGender.Text = reader["Gender"].ToString();
                        lblViewClass.Text = reader["Class"].ToString();
                        lblViewSubject.Text = reader["Subject"].ToString();
                        lblViewTuitionType.Text = reader["TuitionType"].ToString();
                        lblViewTutorPreferred.Text = reader["TutorPreferred"].ToString();
                        lblViewGoingTo.Text = reader["GoingTo"].ToString();
                        lblViewCity.Text = reader["City"].ToString();
                        lblViewCountry.Text = reader["Country"].ToString();
                        lblViewContactNumber.Text = reader["ContactNumber"].ToString();
                        lblViewAddress.Text = reader["Address"].ToString();

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showViewModal", "showModal('viewStudentModal');", true);
                    }
                }
            }
        }

        private void EditStudent(int studentId)
        {
            string query = @"SELECT * FROM [student_signup] WHERE [StudentID] = @StudentID";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StudentID", studentId);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        hfEditStudentID.Value = studentId.ToString();
                        txtEditName.Text = reader["Name"].ToString();
                        txtEditFatherName.Text = reader["FatherName"].ToString();
                        txtEditSurname.Text = reader["Surname"].ToString();
                        txtEditUsername.Text = reader["Username"].ToString();
                        txtEditPassword.Text = reader["Password"].ToString();
                        txtEditAge.Text = reader["Age"].ToString();
                        ddlEditGender.SelectedValue = reader["Gender"].ToString();
                        txtEditClass.Text = reader["Class"].ToString();
                        txtEditSubject.Text = reader["Subject"].ToString();
                        ddlEditTuitionType.SelectedValue = reader["TuitionType"].ToString();
                        ddlEditTutorPreferred.SelectedValue = reader["TutorPreferred"].ToString();
                        txtEditGoingTo.Text = reader["GoingTo"].ToString();
                        txtEditCity.Text = reader["City"].ToString();
                        txtEditCountry.Text = reader["Country"].ToString();
                        txtEditContactNumber.Text = reader["ContactNumber"].ToString();
                        txtEditAddress.Text = reader["Address"].ToString();

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showEditModal", "showModal('editStudentModal');", true);
                    }
                }
            }
        }

        private void DeleteStudent(int studentId)
        {
            string query = "DELETE FROM [student_signup] WHERE [StudentID] = @StudentID";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StudentID", studentId);
                    conn.Open();
                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        LoadStudents();
                        LoadStatistics();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "deleteSuccess",
                            "alert('Student deleted successfully!');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "deleteError",
                            "alert('Error deleting student!');", true);
                    }
                }
            }
        }

      
        protected void btnUpdateStudent_Click(object sender, EventArgs e)
        {
            int studentId = Convert.ToInt32(hfEditStudentID.Value);

            // Check for duplicate username (excluding current student)
            if (IsUsernameExists(txtEditUsername.Text, studentId))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "usernameExistsEdit",
                    "alert('Username already exists! Please choose a different username.'); showModal('editStudentModal');", true);
                return;
            }

            string query = @"UPDATE [student_signup] SET 
                            [Name] = @Name, [FatherName] = @FatherName, [Surname] = @Surname, 
                            [Username] = @Username, [Password] = @Password, [Age] = @Age, 
                            [Gender] = @Gender, [Class] = @Class, [Subject] = @Subject, 
                            [TuitionType] = @TuitionType, [TutorPreferred] = @TutorPreferred, 
                            [GoingTo] = @GoingTo, [City] = @City, [Address] = @Address, 
                            [Country] = @Country, [ContactNumber] = @ContactNumber
                            WHERE [StudentID] = @StudentID";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StudentID", studentId);
                    cmd.Parameters.AddWithValue("@Name", txtEditName.Text);
                    cmd.Parameters.AddWithValue("@FatherName", txtEditFatherName.Text);
                    cmd.Parameters.AddWithValue("@Surname", txtEditSurname.Text);
                    cmd.Parameters.AddWithValue("@Username", txtEditUsername.Text);
                    cmd.Parameters.AddWithValue("@Password", txtEditPassword.Text);
                    cmd.Parameters.AddWithValue("@Age", string.IsNullOrEmpty(txtEditAge.Text) ? (object)DBNull.Value : txtEditAge.Text);
                    cmd.Parameters.AddWithValue("@Gender", ddlEditGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@Class", txtEditClass.Text);
                    cmd.Parameters.AddWithValue("@Subject", txtEditSubject.Text);
                    cmd.Parameters.AddWithValue("@TuitionType", ddlEditTuitionType.SelectedValue);
                    cmd.Parameters.AddWithValue("@TutorPreferred", ddlEditTutorPreferred.SelectedValue);
                    cmd.Parameters.AddWithValue("@GoingTo", txtEditGoingTo.Text);
                    cmd.Parameters.AddWithValue("@City", txtEditCity.Text);
                    cmd.Parameters.AddWithValue("@Address", txtEditAddress.Text);
                    cmd.Parameters.AddWithValue("@Country", txtEditCountry.Text);
                    cmd.Parameters.AddWithValue("@ContactNumber", txtEditContactNumber.Text);

                    conn.Open();
                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        LoadStudents();
                        LoadFilterDropdowns();
                        LoadStatistics();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "updateSuccess",
                            "alert('Student updated successfully!');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "updateError",
                            "alert('Error updating student!'); showModal('editStudentModal');", true);
                    }
                }
            }
        }

        private bool IsUsernameExists(string username, int excludeStudentId = 0)
        {
            string query = "SELECT COUNT(*) FROM [student_signup] WHERE [Username] = @Username";
            if (excludeStudentId > 0)
            {
                query += " AND [StudentID] != @StudentID";
            }

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    if (excludeStudentId > 0)
                    {
                        cmd.Parameters.AddWithValue("@StudentID", excludeStudentId);
                    }

                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }

       
    }
} 
  