using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJECT
{
    public partial class orders : System.Web.UI.Page
    {
        private string connectionString = "Server=DESKTOP-DUHTIJ3\\SQLEXPRESS;Database=Saeedb;Trusted_Connection=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrderData();
            }
        }

        protected void btnAcceptOrder_Click(object sender, EventArgs e)
        {
            try
            {
                // Retrieve values from form controls
                string customerName = txtCustomerName.Text;
                string itemName = txtItemName.Text;
                int quantity = Convert.ToInt32(txtQuantity.Text);

                // Your logic for placing an order
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string insertQuery = "INSERT INTO Orders (CustomerName, ItemName, Quantity, OrderDate) " +
                                         "VALUES (@CustomerName, @ItemName, @Quantity, GETDATE())";


                    using (SqlCommand cmd = new SqlCommand(insertQuery, connection))
                    {
                        cmd.Parameters.AddWithValue("@CustomerName", customerName);
                        cmd.Parameters.AddWithValue("@ItemName", itemName);
                        cmd.Parameters.AddWithValue("@Quantity", quantity);

                        cmd.ExecuteNonQuery();
                    }
                }

                // Display success message
                lblMessage.Text = "Order placed successfully!";

                // Bind updated data to GridView
                BindOrderData();
            }
            catch (Exception ex)
            {
                // Handle exceptions
                lblMessage.Text = $"Error: {ex.Message}";
            }
        }

        private void BindOrderData()
        {
            // Fetch data from Orders1 table with ItemName
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string selectQuery = "SELECT [OrderID], [CustomerName], [ItemName], [Quantity], [OrderDate] " +
                                     "FROM Orders";

                using (SqlCommand cmd = new SqlCommand(selectQuery, connection))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt); // Fetch data and fill DataTable

                    // Bind data to GridView
                    GridViewOrders.DataSource = dt;
                    GridViewOrders.DataBind();
                }
            } // The using statement ensures that the connection is properly closed and disposed of.
        }
    }
}