<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="PROJECT.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
    <style>
        body {
            background-color: #808080;
            font-family: 'Montserrat', sans-serif;
        }

        .container {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            border: 1px solid #ddd;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            
        }

        .card-header {
            background-color: #007bff;
            color: white;
            text-align: center;
            font-weight: bold;
            border-bottom: 1px solid #ddd;
            padding: 15px;
            border-radius: 8px 8px 0 0;
        }

        .card-body {
            padding: 20px;
            border-top: 1px solid #ddd;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ced4da;
            border-radius: 5px;
        }

        .btn-forgot {
            background-color: #4cff00;
            color: white;
            border-radius: 5px;
            padding: 10px 15px;
            cursor: pointer;
            width: 100%;
        }

        .btn-forgot:hover {
            background-color: #000000;
        }

        .error-message {
            color: #dc3545;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server" class="container">
        <div class="row justify-content-center">
            <div class="card">
                <div class="card-header">
                    Forgot Password
                </div>
                <div class="card-body">
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="False" CssClass="error-message"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                    <br />
                    <asp:Button ID="Forgot_Button" runat="server" Text="Forgot Password" CssClass="btn-forgot" OnClick="BtnForgotPassword_Click" />
                </div>
            </div>
        </div>
    </form>

</body>
</html>
