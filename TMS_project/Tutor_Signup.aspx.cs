using System;
using System.Data.SqlClient;
using System.Configuration;

namespace TMS_project
{
    public partial class Tutor_Signup : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void ResetControls()
        {
            // Reset TextBoxes
            txtName.Text = "";
            txtSurname.Text = "";
            txtAge.Text = "";
            txtDegree.Text = "";
            txtContact.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            txtCity.Text = "";
            txtAddress.Text = "";
            txtCountry.Text = "";
            txtEmail.Text = "";

            // Reset DropDownLists
            ddlGender.ClearSelection();
            ddlMaritalStatus.ClearSelection();
            ddlqulification.ClearSelection();
            ddlExperience.ClearSelection();
        }
        protected void btnSignup_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            try
            {
                string query = "insert into tutor_signup values(@Name, @Surname, @Gender, @Age, @MaritalStatus, @Country, @City, @Address, @Qualification, @Degree, @Experience, @Contact, @Username, @Password, @Email)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Surname", txtSurname.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@Age", Convert.ToInt32(txtAge.Text));
                cmd.Parameters.AddWithValue("@MaritalStatus", ddlMaritalStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@Country", txtCountry.Text.Trim());
                cmd.Parameters.AddWithValue("@City", txtCity.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Qualification", ddlqulification.SelectedValue);
                cmd.Parameters.AddWithValue("@Degree", txtDegree.Text.Trim());
                cmd.Parameters.AddWithValue("@Experience", ddlExperience.SelectedValue);
                cmd.Parameters.AddWithValue("@Contact", txtContact.Text.Trim());
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());

                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "Swal.fire({title: 'Success!', text: 'Tutor Registered Successfully!', icon: 'success'});", true);
                    ResetControls();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "Swal.fire({title: 'Failure!', text: 'Registration failed!', icon: 'error'});", true);
                }
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627 || ex.Number == 2601 || ex.Message.Contains("UNIQUE KEY"))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "Swal.fire({title: 'Error!', text: 'Username already exists. Please choose another.', icon: 'warning'});", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "Swal.fire({title: 'Error!', text: '" + ex.Message + "', icon: 'error'});", true);
                }
            }
            finally
            {
                con.Close();
            }
        }
    }
  
}