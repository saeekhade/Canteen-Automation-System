<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminpanel.aspx.cs" Inherits="PROJECT.adminpanel" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Admin Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: black;
            margin: 0;
            padding: 0;
            text-align: center; /* Center-align the content within the body */
        }

        form {
            max-width: 800px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 50px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: left; /* Align the content within the form to the left */
        }

        h1 {
            text-align: center;
            color: #333;
        }

        p {
            margin-bottom: 80px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            margin-bottom: 10px;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        a:hover {
            color:darkblue;
        }

        #btnLogout {
            background-color: #ff0000;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }

        #btnLogout:hover {
            background-color: #ff6a00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Welcome to Canteen Admin Panel</h1>
            <p>Hello <asp:Label ID="lblAdminName" runat="server"></asp:Label>!</p>
            <ul typeof="disc">
                <li><a href="AddMenu.aspx">Add Item</a>
                <ol type="1">
                <li><a href="AddMenu1.aspx">Add Item1</a></li>
                <li><a href="AddMenu2.aspx">Add Item2</a></li> 
                 <li><a href="AddMenu3.aspx">Add Item3</a></li>
                 <li><a href="AddMenu4.aspx">Add Item4</a></li>
                 <li><a href="AddMenu5.aspx">Add Item5</a></li>
                 <li><a href="AddMenu6.aspx">Add Item6</a></li>
                 <li><a href="AddMenu7.aspx">Add Item7</a></li>
                 <li><a href="AddMenu8.aspx">Add Item8</a></li>
                    </ol>
                </li>

                <li><a href="Delete.aspx">Delete Items</a></li>
                <li><a href="Orders.aspx">View Orders</a></li>
                <!-- Add more links as needed -->
            </ul>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
        </div>
    </form>
</body>
</html>
