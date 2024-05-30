using System;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace PROJECT
{
    public partial class Payment : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["cartItems"] != null && Request.QueryString["totalAmount"] != null)
                {
                    string cartItems = Request.QueryString["cartItems"];
                    string totalAmount = Request.QueryString["totalAmount"];

                    itemname.Text = cartItems;
                    total_price.Text = totalAmount;
                }
            }
        }

        protected void btnMakePayment_Click(object sender, EventArgs e)
        {
            if (Session["User_id"] != null)
            {
                string connectionString = "Data Source=DESKTOP-DUHTIJ3\\SQLEXPRESS;Initial Catalog=Saeedb;Integrated Security=True";

                string username = Session["User_id"].ToString();

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    string query = "INSERT INTO Food_Booked (username, items, price) VALUES (@Username, @Items, @Price)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Items", itemname.Text);
                        cmd.Parameters.AddWithValue("@Price", total_price.Text);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Payment successful, send confirmation email
                            SendConfirmationEmail(username);

                            Response.Write("<script>alert('Payment successful!');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Payment failed. Please try again.');</script>");
                        }
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('User not logged in.');</script>");
            }
        }

        private void SendConfirmationEmail(string username)
        {
            try
            {
                string recipientEmail = GetRecipientEmail(username);

                if (!string.IsNullOrEmpty(recipientEmail))
                {
                    string smtpServer = "smtp.gmail.com";
                    int smtpPort = 587;
                    string smtpUsername = "khedekarsiddhi292@gmail.com"; // Update with your Gmail email
                    string smtpPassword = "begs mllu uqqm tzva"; // Update with your Gmail app password

                    using (SmtpClient smtpClient = new SmtpClient(smtpServer, smtpPort))
                    {
                        smtpClient.UseDefaultCredentials = false;
                        smtpClient.Credentials = new NetworkCredential(smtpUsername, smtpPassword);
                        smtpClient.EnableSsl = true;

                        MailMessage mailMessage = new MailMessage();
                        mailMessage.From = new MailAddress(smtpUsername);
                        mailMessage.To.Add(recipientEmail);
                        mailMessage.Subject = "Quick Canteen";

                        mailMessage.Body = $"Thank you for your payment! You will receive your order details shortly.\n\n" +
                                               "Order Details:\n" +
                                               "Items: " + string.Join(", ", itemname.Text) + "\n" +
                                               "Total Price: " + $"{total_price.Text:C}\n" +
                                               "Order Date: " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                        smtpClient.Send(mailMessage);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error sending email: {ex.Message}");
            }
        }

        private string GetRecipientEmail(string username)
        {
            string connectionString = "Data Source=DESKTOP-DUHTIJ3\\SQLEXPRESS;Initial Catalog=Saeedb;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "SELECT Email FROM Login WHERE Username = @Username";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Username", username);

                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        return result.ToString();
                    }
                }
            }

            return "";
        }
    }
}
