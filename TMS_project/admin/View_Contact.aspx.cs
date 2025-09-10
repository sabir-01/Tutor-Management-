using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace TMS_project.admin
{
    public partial class View_Contact : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["admin_user"] == null)
            {
                Response.Redirect("Login_form.aspx");
            }
            if (!IsPostBack) { 
            BindGridview();
            
            }

        }

        void BindGridview()
        {
            SqlConnection con = new SqlConnection(cs);
            string querry = "select * from contact_tbl";
            SqlDataAdapter sda =   new SqlDataAdapter(querry,con);
           DataTable data = new DataTable();
            sda.Fill(data);
            GridView1.DataSource = data;
            GridView1.DataBind();   

        }

        protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex]; 
            Label itemid = (Label)row.FindControl("LabelId");
             string Id = itemid.Text;
            SqlConnection con = new SqlConnection(cs);
            string query = "delete from contact_tbl where id = @id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", Id);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Data has been Deleted Successfull')</script>");
                BindGridview();
            }
            con.Close();
        }
    }
}