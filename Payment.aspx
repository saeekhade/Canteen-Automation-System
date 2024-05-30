<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="PROJECT.Payment" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Canteen Payment</title>

    <!-- Add Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #000000;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .payment-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: left;
        }

        .card-header {
            background-color: cadetblue;
            color: black;
            text-align: center;
            font-weight: bold;
            width: auto;
            padding: 20px;
            margin-bottom: 10px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .lol {
            display: flex;
            align-items: center;
        }

        .textbox-label {
            flex: 0 0 150px;
            font-weight: bold;
            margin-right: 10px;
        }

        .textbox {
            border: none;
            border-bottom: 1px solid #ddd;
            padding: 8px;
            box-sizing: border-box;
            width: 100%;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 16px);
            padding: 8px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .text-danger {
            color: red;
        }

        a {
            text-decoration: none;
            color: black;
            display: inline-block;
            padding: 10px;
            background-color: #17a2b8;
            color: #fff;
            border-radius: 5px;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>

    <script type="text/javascript">
        // Your JavaScript validation and event handling functions can go here
    </script>
</head>
<body>
    <form id="form1" runat="server" class="payment-container">
        <div class="card-header">
            Canteen Payment
        </div>

        <div class="form-group lol">
    <asp:Label ID="label_itemname" runat="server" CssClass="textbox-label" AssociatedControlID="itemname">Item Name:</asp:Label>
    <asp:TextBox ID="itemname" runat="server" ReadOnly="true" CssClass="textbox form-control" style="width: 300px;"></asp:TextBox>
</div>


        <div class="form-group lol">
            <asp:Label ID="label_total_price" runat="server" CssClass="textbox-label" AssociatedControlID="total_price">Total Price:</asp:Label>
            <asp:TextBox ID="total_price" runat="server" ReadOnly="true" CssClass="textbox form-control"></asp:TextBox>
        </div>

        <!-- Add other relevant form fields for canteen payment -->
        <div class="form-group">
            <label for="cardNumber">Card Number:</label>
            <asp:TextBox ID="cardNumber" runat="server" placeholder="Enter card number" CssClass="form-control" Required="true"></asp:TextBox>
             <asp:RegularExpressionValidator ID="regexCardNumber" runat="server" ControlToValidate="cardNumber"
        ValidationExpression="^\d{16}$" ErrorMessage="Invalid card number. Must be 16 digits." ForeColor="Red" />
   </div>

        <div class="form-group">
            <label for="expiryDate">Expiry Date:</label>
            <asp:TextBox ID="expiryDate" runat="server" placeholder="MM/YY" CssClass="form-control" Required="true"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexExpiryDate" runat="server" ControlToValidate="expiryDate"
        ValidationExpression="^(0[1-9]|1[0-2])\/\d{2}$" ErrorMessage="Invalid expiry date. Must be in MM/YY format." ForeColor="Red" />
</div>

        <div class="form-group">
            <label for="cvv">CVV:</label>
            <asp:TextBox ID="cvv" runat="server" placeholder="Enter CVV" CssClass="form-control" Required="true" TextMode="Password"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexCVV" runat="server" ControlToValidate="cvv"
        ValidationExpression="^\d{3}$" ErrorMessage="Invalid CVV. Must be 3 digits." ForeColor="Red" />
</div>

        <center>
            <asp:Button ID="btnMakePayment" runat="server" Text=" Pay" CssClass="btn btn-primary btn-block " OnClick="btnMakePayment_Click" Width="150px" /><br /><br />
            <a href="Home.aspx" class="btn btn-info btn-block "><b>Cancel</b></a>
        </center>
    </form>
</body>
</html>