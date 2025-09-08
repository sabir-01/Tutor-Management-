using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;


namespace TMS_project
{
    public partial class Contact : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        { }
        
        void resetcontact()
        {
            NameTextBox.Text = "";
            EmailTextBox.Text = "";
            subjectDropDownList.ClearSelection();
            messageTextArea.Text = "";
    

        }
        protected void submitButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string sp = "spContact_Insert";
            SqlCommand cmd = new SqlCommand(sp, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name",NameTextBox.Text);
            cmd.Parameters.AddWithValue("@email",EmailTextBox.Text);
            cmd.Parameters.AddWithValue("@subject",subjectDropDownList.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@message",messageTextArea.Text);
            con.Open();
            int a =cmd.ExecuteNonQuery();
            if (a > 0)
            {
                //Response.Write("<script>successcontent();</script>");
                //Response.Write("<script>alert('Form submitted || ') </script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "successcontent();", true);
                resetcontact();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "Errorcontent();", true);
                //Response.Write("<script>alert('submission failed || ') </script>");
            }

            con.Close();

        }
    }
}