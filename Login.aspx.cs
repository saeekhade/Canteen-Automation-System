using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJECT
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Forgot_Pass(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx");
        }
        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin1.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string connectionString = "Data Source=DESKTOP-DUHTIJ3\\SQLEXPRESS;Initial Catalog=Saeedb;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT COUNT(*) FROM Login WHERE Username=@Username AND Password=@Password";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    int count = (int)cmd.ExecuteScalar();
                    if (count > 0)
                    {
                       
                        Session["session_id"] = Session.SessionID;
                        Session["User_id"] = txtUsername.Text;// Redirect to the welcome page on successful login
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        // Display an error message
                        Response.Write("<script>alert('Invalid username or password');</script>");
                    }
                }
            }
        }
    }
}