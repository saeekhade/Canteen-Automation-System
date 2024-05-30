using System;
using System.Data.SqlClient;
using System.IO;

namespace PROJECT
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnDeleteItem_Click(object sender, EventArgs e)
        {
            try
            {
                string itemName = txtItemName.Text;
                decimal itemPrice = Convert.ToDecimal(txtItemPrice.Text);
                string itemImagePath = txtItemImagePath.Text;

                // Insert into database (replace with your connection string)
                using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-DUHTIJ3\\SQLEXPRESS;Initial Catalog=Saeedb;Integrated Security=True"))
                {
                    connection.Open();

                    string query = "INSERT INTO Items (ItemName, ItemPrice, ItemImagePath) VALUES (@ItemName, @ItemPrice, @ItemImagePath)";
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@ItemName", itemName);
                        cmd.Parameters.AddWithValue("@ItemPrice", itemPrice);
                        cmd.Parameters.AddWithValue("@ItemImagePath", itemImagePath);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            lblMessage.Text = "delete item successfully.";
                        }
                        else
                        {
                            lblMessage.Text = "Error deleting item.";
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
}