<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PROJECT.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
              background-image: url('Images/bg_reg.jpg');
            background-size: cover; /* Adjust as needed */
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #000000;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            padding: 40px;
            border-radius: 8px;
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        h2 {
            color: #ffffff;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin: 15px 0;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 20px);
            padding: 15px;
            margin-bottom: 20px;
            border: none;
            border-radius: 5px;
            background-color: #f8f9fa;
            box-sizing: border-box;
        }
         .styled-link {
     color: #2196F3; /* Set your desired text color */
     text-decoration: none;
     font-weight: bold;
     transition: color 0.3s ease; /* Add transition for a smooth color change on hover */
 }

 .styled-link:hover {
     color: #1565C0; /* Set your desired hover color */
 }

        .custom-button {
     background-color: #28a745; /* Set your desired background color */
     color: white;             /* Set your desired text color */
     padding: 10px 20px;
     border: none;
     border-radius: 4px;
     cursor: pointer;
     transition: background-color 0.3s ease;
 }

 .custom-button:hover {
     background-color: #1565C0; /* Set your desired hover background color */
 }

        .btn-style {
            background: linear-gradient(to right, #ff6b6b, #ffcccb);
            margin-top: 10px;
        }

        .btn-style:hover {
            background: linear-gradient(to right, #ffcccb, #ff6b6b);
        }

        .input-style {
            background-color: #f8f9fa;
            border: 2px solid #007bff;
            color: #555;
            padding-left: 10px;
        }

        .forgot-password {
            margin-top: 20px;
            color: #888;
            text-decoration: none;
            font-size: 14px;
        }

        .forgot-password:hover {
            color: #555;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Login Page</h2>
            <div>
                <label for="txtUsername">Username:</label>
                <i class="fas fa-user"></i>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="input-style" placeholder="Enter your username"></asp:TextBox>
            </div>
            <div>
                <label for="txtPassword">Password:</label>
                <i class="fas fa-lock"></i>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-style" placeholder="Enter your password"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="custom-button" />
                <asp:Button ID="btnAdminLogin" runat="server" Text="Admin Login" OnClick="btnAdminLogin_Click" CssClass="custom-button btn-style" />
            </div>
            <asp:Button ID="btnForgotPassword" runat="server" Text="Forgot Password?" CssClass="forgot-password" OnClick="Forgot_Pass" />
        </div>
         <div>
            <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="~/Registration.aspx" CssClass="styled-link">Not registered yet? Register here.</asp:HyperLink>
        </div>
    </form>
</body>
</html>
