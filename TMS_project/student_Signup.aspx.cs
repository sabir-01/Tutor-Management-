using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.SqlClient;

namespace TMS_project
{
    public partial class student_Signup : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void ResetControls()
        {
            // Reset all TextBoxes
            txtName.Text = "";
            txtFatherName.Text = "";
            txtSurname.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            txtAge.Text = "";
            txtClass.Text = "";
            txtSubject.Text = "";
            txtCity.Text = "";
            txtAddress.Text = "";
            txtCountry.Text = "";
            txtContact.Text = "";

            // Reset DropDownLists
            ddlGender.ClearSelection();
            ddlTuitionType.ClearSelection();
            ddlTutor.ClearSelection();
            ddlGoingTo.ClearSelection();
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            try
            {
                string querry = "insert  into student_signup values(@Name,@FatherName,@Surname,@Username,@Password,@Age,@gender,@Class,@Subject,@TuitionType,@TutorPreferred,@GoingTo,@City,@Address,@Country,@ContactNumber)";
                SqlCommand cmd = new SqlCommand(querry, con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@FatherName", txtFatherName.Text);
                cmd.Parameters.AddWithValue("@Surname", txtSurname.Text);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Age", Convert.ToInt32(txtAge.Text));
                cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Class", txtClass.Text);
                cmd.Parameters.AddWithValue("@Subject", txtSubject.Text);
                cmd.Parameters.AddWithValue("@TuitionType", ddlTuitionType.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@TutorPreferred", ddlTutor.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@GoingTo", ddlGoingTo.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@City", txtCity.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
                cmd.Parameters.AddWithValue("@ContactNumber", txtContact.Text);
                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    //Response.Write("<script>alert('Insertion  successfull  || ') </script>");
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "Swal.fire({\r\n                title: \"Success!\",\r\n                text: \"Registred Successfullt !\",\r\n                icon: \"success\"\r\n            });", true);

                    ResetControls();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "Swal.fire({\r\n                title: \"Failure!\",\r\n                text: \"username or password incorrect!\",\r\n                icon: \"error\"\r\n            });", true);

                    //Response.Write("<script>alert('Insertion  Failed   || ') </script>");
                }
            }
            catch (SqlException ex)
            {
                // 2627 = Violation of UNIQUE KEY constraint (duplicate value)
                // 2601 = Cannot insert duplicate key row in object
                if (ex.Number == 2627 || ex.Number == 2601 || ex.Message.Contains("UNIQUE KEY constrain"))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "Swal.fire({title: 'Error!', text: 'Username already exists. Please choose another.', icon: 'warning'});", true);
                }
               
            }


            finally
            {
            con.Close();
            }



        }
    }
}