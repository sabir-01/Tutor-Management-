using System;
using System.Configuration;
using System.Data.SqlClient;


namespace TMS_project
{
    public partial class Tutor_Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        void resset()
        {
            txtUsername.Text = "";
            txtPassword.Text = "";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string querry = "select * from tutor_signup where username = @username and password = @password";
            SqlCommand cmd = new SqlCommand(querry, con);
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                //Response.Write("<script>alert('Login successful !!');</script>");

                Session["tutor"] = txtUsername.Text;

                Response.Redirect("Tutor/Tutor_index.aspx");
                resset();
            }
            else
            {
                //Response.Write("<script>alert('Login failed !! ');</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "Swal.fire({\r\n                title: \"Failure!\",\r\n                text: \"username or password incorrect!\",\r\n                icon: \"error\"\r\n            });", true);
                resset();
            }
        }
    }
}