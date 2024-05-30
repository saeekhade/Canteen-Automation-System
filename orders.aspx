<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="PROJECT.orders" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Orders</title>
     <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        button {
            padding: 10px 15px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            display: block;
            margin: 15px auto;
        }

        button:hover {
            background-color: #45a049;
        }

        #lblMessage {
            font-weight: bold;
            margin-top: 15px;
            color: #008000; /* Green color for success messages */
        }

        #GridViewOrders {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        #GridViewOrders th, #GridViewOrders td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        #GridViewOrders th {
            background-color: #4caf50;
            color: #fff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Orders</h2>
            
            <div>
                <label for="txtCustomerName">Customer Name:</label>
                <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox>
            </div>
            
            <div>
                <label for="txtItemName">Item Name:</label>
                <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
            </div>
            
            <div>
                <label for="txtQuantity">Quantity:</label>
                <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
            </div>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>

            
            <div>
                <asp:Button ID="btnAcceptOrder" runat="server" Text="Accept Order" OnClick="btnAcceptOrder_Click" />
            </div>
            
            <asp:GridView ID="GridViewOrders" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID">
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
                    <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
                    <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
