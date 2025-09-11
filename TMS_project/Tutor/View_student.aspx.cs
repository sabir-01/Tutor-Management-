using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace TMS_project.Tutor
{
    public partial class View_student : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Tutor"] == null)
            {
                Response.Redirect("~/Tutor_Login.aspx");
            }
            if (!IsPostBack)
            {
                BindRepeater();
            }
        }
        void BindRepeater()
        {
            SqlConnection con = new SqlConnection(cs);
            string querry = "select * from student_signup";
            SqlDataAdapter sda = new SqlDataAdapter(querry, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            Repeater1.DataSource = data;
            Repeater1.DataBind();

        }

        protected void searchbtn_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string querry = @"SELECT * FROM student_signup
                 WHERE Name LIKE '%" + SerachText.Text + @"%'
                    OR FatherName LIKE '%" + SerachText.Text + @"%'
                    OR Surname LIKE '%" + SerachText.Text + @"%'
                    OR Username LIKE '%" + SerachText.Text + @"%'
                    OR Password LIKE '%" + SerachText.Text + @"%'
                    OR Age LIKE '%" + SerachText.Text + @"%'
                    OR Gender LIKE '%" + SerachText.Text + @"%'
                    OR Class LIKE '%" + SerachText.Text + @"%'
                    OR Subject LIKE '%" + SerachText.Text + @"%'
                    OR TuitionType LIKE '%" + SerachText.Text + @"%'
                    OR TutorPreferred LIKE '%" + SerachText.Text + @"%'
                    OR GoingTo LIKE '%" + SerachText.Text + @"%'
                    OR City LIKE '%" + SerachText.Text + @"%'
                    OR Address LIKE '%" + SerachText.Text + @"%'
                    OR Country LIKE '%" + SerachText.Text + @"%'
                    OR ContactNumber LIKE '%" + SerachText.Text + @"%'";

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
    }
}