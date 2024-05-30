<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="PROJECT.Registration" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('Images/bg_reg.jpg');
            background-size: cover;
            background-repeat: no-repeat;
        }

        form {
            background-color: #000000;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            padding: 25px;
            border-radius: 10px;
            text-align: center;
            max-width: 500px;
            max-height: 600px;
            width: 100%;
        }

        h1 {
            color: #fff;
            margin-block-start: 10px;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            text-align: left;
        }

        td {
            padding: 10px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #fff;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            border-radius: 5px;
            background-color: #f8f9fa;
            box-sizing: border-box;
        }

        .styled-link {
            color: #2196F3;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .styled-link:hover {
            color: #1565C0;
        }

        .custom-button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .custom-button:hover {
            background-color: #1565C0;
        }

        .input-style {
            background-color: #f8f9fa;
            border: 2px solid #007bff;
            color: #555;
            padding: 10px;
        }

        .success-message {
            margin-top: 20px;
            color: #28a745;
        }

        .error-message {
            margin-top: 20px;
            color: #dc3545;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hfUserID" runat="server" />
        </div>
        <h1>Registration Page</h1>
        <table>
            <tr>
                <td>
                    <label for="txtFirstName"><i class="fas fa-user"></i> First Name:</label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-style" placeholder="Enter your first name"></asp:TextBox>
                    <asp:Label Text="*" runat="server" ForeColor="Red" />
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                        ControlToValidate="txtFirstName"
                        ErrorMessage="First Name is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="yourValidationGroup">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtLastName"><i class="fas fa-user"></i> Last Name:</label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="input-style" placeholder="Enter your last name"></asp:TextBox>
                    <asp:Label Text="*" runat="server" ForeColor="Red" />
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                        ControlToValidate="txtLastName"
                        ErrorMessage="Last Name is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="yourValidationGroup">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtContact"><i class="fas fa-phone"></i> Contact:</label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtContact" runat="server" CssClass="input-style" placeholder="Enter your contact number"></asp:TextBox>
                    <asp:Label Text="*" runat="server" ForeColor="Red" />
                    <asp:RequiredFieldValidator ID="rfvContact" runat="server"
                        ControlToValidate="txtContact"
                        ErrorMessage="Contact is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="yourValidationGroup">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtEmail"><i class="fas fa-envelope"></i>Email:</label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input-style" placeholder="Enter your email"></asp:TextBox>
                    <asp:Label Text="*" runat="server" ForeColor="Red" />
                    <asp:RegularExpressionValidator ID="regexEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Invalid email format."
                        ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="yourValidationGroup">
                    </asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="yourValidationGroup">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtUsername"><i class="fas fa-user"></i>Username:</label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="input-style" placeholder="Choose a username"></asp:TextBox>
                    <asp:Label Text="*" runat="server" ForeColor="Red" />
                    <asp:CustomValidator ID="cvUsername" runat="server"
                        ControlToValidate="txtUsername"
                        ErrorMessage="Username already exists. Please choose a different one."
                        OnServerValidate="ServerValidateUsername"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="yourValidationGroup">
                    </asp:CustomValidator>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server"
                        ControlToValidate="txtUsername"
                        ErrorMessage="Username is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="yourValidationGroup">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtPassword"><i class="fas fa-lock"></i>Password:</label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-style" placeholder="Enter your password"></asp:TextBox>
                    <asp:Label Text="*" runat="server" ForeColor="Red" />
                    <asp:RegularExpressionValidator ID="regexPassword" runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password must be at least 8 characters long."
                        ValidationExpression="^.{8,}$"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="yourValidationGroup">
                    </asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="yourValidationGroup">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtConfirmPassword"><i class="fas fa-lock"></i> Confirm Password:</label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="input-style" placeholder="Confirm your password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ErrorMessage="Confirm Password is required."
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="yourValidationGroup">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2">
                    <asp:Button Text="Sign Up" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" CssClass="custom-button" ValidationGroup="yourValidationGroup" /><br />
                    <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/Login.aspx" CssClass="styled-link">Already registered? Login here.</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2">
                    <asp:Label Text="" ID="lblSuccessMessage" runat="server" CssClass="success-message"></asp:Label>
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2">
                    <asp:Label Text="" ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
