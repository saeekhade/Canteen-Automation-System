using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJECT
{
    public partial class About : System.Web.UI.Page
    {
        private object txtMobileno;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Assuming you have a class to represent a contact
            ContactInfo contact = new ContactInfo
            {
                Name = txtName.Text,
                Email = txtEmail.Text,
                MobileNo = txtMobileno,
                Message = txtMessage.Text
            };

            // Assuming you have a method to handle the submission logic
            bool submissionResult = SubmitContactInfo(contact);

            if (submissionResult)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Contact form submitted successfully!');", true);
                // You can also clear the form if needed
                ClearForm();
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Error submitting contact form. Please try again.');", true);
            }
        }

        private bool SubmitContactInfo(ContactInfo contact)
        {
            // Connection string from your web.config
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

            // SQL query to insert contact information into a table (adjust table and column names)
            string insertQuery = "INSERT INTO ContactTable (Name, Email, Message) VALUES (@Name, @Email, @Message)";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
                    {
                        // Add parameters to the query to prevent SQL injection
                        command.Parameters.AddWithValue("@Name", contact.Name);
                        command.Parameters.AddWithValue("@Email", contact.Email);
                        command.Parameters.AddWithValue("@Message", contact.Message);

                        // Execute the query
                        command.ExecuteNonQuery();
                    }
                }
                return true;
            }
            catch (Exception ex)
            {
                // Handle the exception, log it, or display an error message
                // For demonstration purposes, let's just log to the console
                Console.WriteLine($"Error submitting contact form: {ex.Message}");
                return false;
            }
        }

        private void ClearForm()
        {
            // Clear the textboxes in the form
            txtName.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = "";
        }
    }

    public class ContactInfo
    {
        internal object MobileNo;

        public string Name { get; set; }
        public string Email { get; set; }
        public string Message { get; set; }
    }
}
    
