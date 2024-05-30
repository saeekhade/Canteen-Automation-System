using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJECT
{
    public partial class AddMenu5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                // Retrieve values from form controls (assuming you have TextBox controls for name, price, and imagePath)
                string itemName = itemNameTextBox.Text;
                decimal itemPrice = decimal.Parse(itemPriceTextBox.Text);
                string category = categoryTextBox.Text;
                string imagePath = imagePathTextBox.Text;

                // Execute the SQL query to insert a new item
                AddNewItem(itemName, itemPrice, category, imagePath);

                // You can add additional logic or redirect to another page after adding the item
            }
        }

        private void AddNewItem(string itemName, decimal itemPrice, string imagePath, string category)
        {
            // Connection string
            string connectionString = "Data Source=DESKTOP-DUHTIJ3\\SQLEXPRESS;Initial Catalog=Saeedb;Integrated Security=True";

            // SQL query to insert a new item
            string query = "INSERT INTO [Menu] (item_name, price, image_path, category) VALUES (@ItemName, @ItemPrice, @Category,@ImagePath)";

            // Create and open the connection
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Create and execute the command
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to prevent SQL injection
                    command.Parameters.AddWithValue("@ItemName", itemName);
                    command.Parameters.AddWithValue("@ItemPrice", itemPrice);
                    command.Parameters.AddWithValue("@Category", category);
                    command.Parameters.AddWithValue("@ImagePath", imagePath);

                    // Execute the query
                    command.ExecuteNonQuery();
                }
            }
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu5.aspx");
        }
    }
}

      