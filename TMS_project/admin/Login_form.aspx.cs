using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.SqlServer.Server;

namespace TMS_project.admin
{

    public partial class Login_form : System.Web.UI.Page
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
            string querry = "select * from Login where username = @username and password = @password";
            SqlCommand cmd = new SqlCommand(querry,con);           
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader(); 
            if(dr.HasRows == true)
            {
                //Response.Write("<script>alert('Login successful !!');</script>");

                Session["admin_user"] = txtUsername.Text;

                Response.Redirect("Admin_index.aspx");
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