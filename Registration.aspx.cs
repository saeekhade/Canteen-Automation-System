using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJECT
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Check for empty fields
            if (string.IsNullOrWhiteSpace(txtFirstName.Text) ||
                string.IsNullOrWhiteSpace(txtLastName.Text) ||
                string.IsNullOrWhiteSpace(txtContact.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtUsername.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text) ||
                string.IsNullOrWhiteSpace(txtConfirmPassword.Text))
            {
                lblMessage.Text = "Please fill in all the required fields.";
                return;
            }

            if (IsEmailAlreadyExists(txtEmail.Text))
            {
                // Email already exists, show an error message
                string script = "alert('Email is already in use. Please choose a different one.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "EmailExistsScript", script, true);
            }

            cvUsername.Validate();
            if (!cvUsername.IsValid)
            {
                // Username already exists, show an error message
                string script = "alert('Username is already in use. Please choose a different one.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "UsernameExistsScript", script, true);
            }
            else
            {
                try
                {
                    string firstname = txtFirstName.Text;
                    string Lastname = txtLastName.Text;
                    string MobileNo = txtContact.Text;
                    string email = txtEmail.Text;
                    string username = txtUsername.Text;
                    string password = txtPassword.Text;

                    // Save the user data to the database
                    using (SqlConnection conn = new SqlConnection("Server=DESKTOP-DUHTIJ3\\SQLEXPRESS;Database=Saeedb;Trusted_Connection=True"))
                    {
                        conn.Open();

                        using (SqlCommand cmd = new SqlCommand("INSERT INTO Login(Firstname,Lastname, Contact, Email,Username, Password) VALUES (@Firstname,@LastName, @MobileNo, @Email,@Username, @Password)", conn))
                        {
                            cmd.Parameters.AddWithValue("@Firstname", firstname);
                            cmd.Parameters.AddWithValue("@LastName", Lastname);
                            cmd.Parameters.AddWithValue("@MobileNo", MobileNo);
                            cmd.Parameters.AddWithValue("@Email", email);
                            cmd.Parameters.AddWithValue(@"Username", username);
                            cmd.Parameters.AddWithValue("@Password", password);

                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                lblMessage.Text = "Record Inserted Successfully";
                            }
                            else
                            {
                                lblMessage.Text = "Record Not Inserted";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }

        private bool IsEmailAlreadyExists(string email)
        {
            // Check if the email already exists in the database
            SqlConnection conn = new SqlConnection("Server=DESKTOP-DUHTIJ3\\SQLEXPRESS;Database=Saeedb;Trusted_Connection=True");
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Login WHERE Email" +
               " = @Email", conn);
            cmd.Parameters.AddWithValue("@Email", email);

            conn.Open();
            int count = (int)cmd.ExecuteScalar();
            conn.Close();

            return count > 0;
        }

        protected void ServerValidateUsername(object source, ServerValidateEventArgs args)
        {
            // Validate username on the server side
            args.IsValid = !uname(args.Value);
        }

        private bool uname(string name)
        {
            // Check if the email already exists in the database SAEEKHADE\\SQLEXPRESS
            SqlConnection conn = new SqlConnection("Server=DESKTOP-DUHTIJ3\\SQLEXPRESS;Database=Saeedb;Trusted_Connection=True");
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Login WHERE Username" +
               " = @Username", conn);
            cmd.Parameters.AddWithValue("@Username", name);

            conn.Open();
            int count = (int)cmd.ExecuteScalar();
            conn.Close();

            return count > 0;
        }
    }
}
