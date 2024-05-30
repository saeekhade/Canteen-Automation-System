using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJECT
{
    public partial class adminpanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve and display admin name (you need to implement user authentication)
                if (Context.User.Identity.IsAuthenticated)
                {
                    string adminName = Context.User.Identity.Name;
                    lblAdminName.Text = adminName;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Implement logout functionality
            // For example, you can use FormsAuthentication.SignOut() and redirect to the login page
            // FormsAuthentication.SignOut();
            // Response.Redirect("Login.aspx");
        }
    }
}
        
    
