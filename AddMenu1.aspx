<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMenu1.aspx.cs" Inherits="PROJECT.AddMenu1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
        }

        #ItemGridView {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        #ItemGridView th, #ItemGridView td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        #ItemGridView th {
            background-color: #f2f2f2;
        }

        #ItemGridView tr:hover {
            background-color: #f5f5f5;
        }

        #ItemGridView a {
            text-decoration: none;
            color: #007bff;
        }

        #ItemGridView a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Admin Panel</h2>

            <asp:TextBox ID="itemNameTextBox" runat="server" placeholder="Enter item name" CssClass="input-style"></asp:TextBox>
            <asp:TextBox ID="itemPriceTextBox" runat="server" placeholder="Enter item price" CssClass="input-style"></asp:TextBox>
            <asp:TextBox ID="categoryTextBox" runat="server" placeholder="Enter category" CssClass="input-style"></asp:TextBox>
              <asp:TextBox ID="imagePathTextBox" runat="server" placeholder="Enter image path" CssClass="input-style"></asp:TextBox>
            <asp:Button ID="btnAddItem" runat="server" Text="Add Item" OnClick="btnAddItem_Click" CssClass="custom-button" />
            <br />
            <a href="adminpanel.aspx"></a>
             <asp:Button ID="Button2" runat="server" Text="Back to Admin Panel" OnClick="btnBack_Click" CssClass="custom-button" />
            <asp:GridView ID="ItemGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Name">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Item Name" SortExpression="Name" />
                    <asp:BoundField DataField="Price" HeaderText="Item Price (₹)" SortExpression="Price" DataFormatString="₹{0:N2}" />
                    <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                    <asp:ImageField DataImageUrlField="ImagePath" HeaderText="Item Image" ControlStyle-Width="50" ControlStyle-Height="50" />
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            
        </div>
    </form>
</body>
</html>