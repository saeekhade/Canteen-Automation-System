<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu4.aspx.cs" Inherits="PROJECT.Menu4" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quick Canteen Menu</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: grey;
            color: #333; /* Text color */
        }

        .food-item {
            border: 2px solid #333;
            padding: 15px;
            margin: 15px;
            display: inline-block;
            background-color:black; /* White background */
            border-radius: 8px;
            width: 250px; /* Set a fixed width for better layout */
        }

        .food-item img {
             display: block;
             margin: 0 auto;
            width: 100%;
            border-radius: 8px;
            margin-bottom: 10px;
         }

        .food-item h3 {
            text-align:center;
            color: white;
        }

        .food-item img {
            width: 100%; 
            border-radius: 8px;
            margin-bottom: 10px; 
        }

        .food-item p {
            text-align:center;
            color: white; 
        }

        .food-item button {
            background-color: #000; 
            color: floralwhite; /* White button text */
            border: none;
            padding: 8px 15px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 10px; 
        }

        .food-item button:hover {
            background-color: #333; /* Darker black on hover */
        }

        .cart {
            border: 2px solid #333;
            padding: 15px;
            margin: 15px;
            background-color: #eee; /* Light grey background */
            border-radius: 8px;
        }

        .cart h2 {
            color: midnightblue;
        }

        #cartItems li {
            color: #555; /* Dark grey text for cart items */
        }

        #totalAmount {
            color: #000; /* Black text for total amount */
            font-weight: bold;
        }

         #checkoutButton {
           background-color: red;
           color: white;
           border: none;
           padding: 10px 15px;
           cursor: pointer;
           border-radius: 5px;
           width: 100%;
           margin-top: 10px;
          }

         #checkoutButton:hover {
           background-color: black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Food Items</h2>
            </div>
            <div class="food-item">
                <img src="https://www.cookwithmanali.com/wp-content/uploads/2023/05/Sabudana-Vada-Recipe-Navratri.jpg" class="centered-image"alt="centered-image" style="width: 100px; height: 100px" />
                <h3> Sabudana Vada </h3>
                <p >₹50</p>
                <input type="number" min="0" value="1" />
                <button type="button" onclick="addToCart('Sabudana Vada', 50)">Add to Cart</button>
            </div>

             <div class="food-item">
                 <img src="https://img-global.cpcdn.com/recipes/f0d1dee279531ee5/680x482cq70/hommade-fasting-potato-chips-recipe-main-photo.jpg" class="centered-image"alt="centered-image" style="width: 100px; height: 100px" />
                 <h3>Potato Chips </h3>
                 <p >₹20</p>
                 <input type="number" min="0" value="1" />
                 <button type="button" onclick="addToCart('Potato Chips', 20)">Add to Cart</button>
             </div>
             
                  <div class="food-item">
                     <img src="https://i0.wp.com/culinarylabz.com/wp-content/uploads/2019/10/IMG_20191001_133626321.jpg?ssl=1" class="centered-image"alt="centered-image" style="width: 100px; height: 100px" />
                     <h3>Sabudana Khichdi</h3>
                     <p >₹100</p>
                     <input type="number" min="0" value="1" />
                     <button type="button" onclick="addToCart('Sabudana Khichdi', 100)">Add to Cart</button>
                </div>
           
                    <!-- Cart Section -->
        <div class="cart" >
            <h2>Food Cart</h2>
            <ul id="cartItems">
                <!-- Cart items will be dynamically added here -->
            </ul>
            <p>Total: ₹<span id="totalAmount">0.00</span></p>
            <button type="button" id="checkoutButton" onclick="redirectToPayment()">Checkout</button>
        </div>

       <script>
           // JavaScript function to add items to the cart
           function addToCart(itemName, price) {
               var cartItems = document.getElementById('cartItems');
               var totalAmount = document.getElementById('totalAmount');

               // Get the quantity input value
               var quantityInput = document.querySelector('.food-item input');
               var quantity = parseInt(quantityInput.value);

               // Check if the item is already in the cart
               var existingCartItem = findCartItemByName(itemName);

               if (existingCartItem) {
                   // If item already exists, update its quantity and total price
                   var existingQuantity = parseInt(existingCartItem.querySelector('.cart-item-quantity').innerText);
                   existingQuantity += quantity;
                   existingCartItem.querySelector('.cart-item-quantity').innerText = existingQuantity;
                   existingCartItem.querySelector('.cart-item-total').innerText = '₹' + (price * existingQuantity).toFixed(2);
               } else {
                   // Create new list item for the cart
                   var listItem = document.createElement('li');
                   listItem.innerHTML = itemName + ' x<span class="cart-item-quantity">' + quantity + '</span> - <span class="cart-item-total">₹' + (price * quantity).toFixed(2) + '</span>';
                   listItem.appendChild(createQuantityButtons(itemName, price)); // Add +/- buttons

                   // Append item to the cart
                   cartItems.appendChild(listItem);
               }

               // Update total amount
               var currentTotal = parseFloat(totalAmount.innerText);
               totalAmount.innerText = (currentTotal + price * quantity).toFixed(2);

               // Reset quantity input to 1 for the next item
               quantityInput.value = 1;
           }

           // Function to find a cart item by name
           function findCartItemByName(itemName) {
               var cartItems = document.getElementById('cartItems').getElementsByTagName('li');
               for (var i = 0; i < cartItems.length; i++) {
                   var currentItemName = cartItems[i].innerText.split(' x')[0];
                   if (currentItemName === itemName) {
                       return cartItems[i];
                   }
               }
               return null;
           }

           // Function to create quantity adjustment buttons
           function createQuantityButtons(itemName, price) {
               var quantityButtons = document.createElement('div');
               quantityButtons.innerHTML = '<button onclick="adjustQuantity(\'' + itemName + '\', ' + price + ', 1)">+</button>' +
                   '<button onclick="adjustQuantity(\'' + itemName + '\', ' + price + ', -1)">-</button>';
               return quantityButtons;
           }

           // Function to adjust quantity
           function adjustQuantity(itemName, price, adjustment) {
               var cartItem = findCartItemByName(itemName);
               if (cartItem) {
                   var quantityElement = cartItem.querySelector('.cart-item-quantity');
                   var currentQuantity = parseInt(quantityElement.innerText);
                   var newQuantity = currentQuantity + adjustment;

                   if (newQuantity > 0) {
                       // Update quantity and total price
                       quantityElement.innerText = newQuantity;
                       cartItem.querySelector('.cart-item-total').innerText = '₹' + (price * newQuantity).toFixed(2);

                       // Update total amount
                       var totalAmount = document.getElementById('totalAmount');
                       var currentTotal = parseFloat(totalAmount.innerText);
                       totalAmount.innerText = (currentTotal + price * adjustment).toFixed(2);
                   } else {
                       // If new quantity is zero or negative, remove the item from the cart
                       cartItem.remove();
                   }
               }
           }

           // JavaScript function to redirect to payment page
           function redirectToPayment() {
               // Get the cart items
               var cartItems = document.getElementById('cartItems').innerText;

               // Get the total amount
               var totalAmount = document.getElementById('totalAmount').innerText;

               // Redirect to payment.aspx with cart data as query parameters
               window.location.href = 'payment.aspx?cartItems=' + encodeURIComponent(cartItems) + '&totalAmount=' + encodeURIComponent(totalAmount);
           }
       </script>

    </form>
</body>
</html>

            

           