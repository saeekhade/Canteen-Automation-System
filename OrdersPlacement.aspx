<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrdersPlacement.aspx.cs" Inherits="PROJECT.OrdersPlacement" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Placement</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f4f4f4;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input, textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <label for="txtItems">Items:</label>
        <textarea id="txtItems" runat="server" name="txtItems" rows="4"></textarea>

        <!-- Add more controls as needed -->

        <button id="btnPlaceOrder" runat="server" type="button" onclick="btnPlaceOrder_Click">Place Order</button>
    </form>
</body>
</html>
