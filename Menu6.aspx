<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu6.aspx.cs" Inherits="PROJECT.Menu5" %>
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
                <img src="https://www.vegrecipesofindia.com/wp-content/uploads/2021/06/sandwich-recipe.jpg" class="centered-image"alt="centered-image" style="width: 100px; height: 100px" />
                <h3> Veg.Sandwich </h3>
                <p >₹35</p>
                <input type="number" min="0" value="1" />
                <button type="button" onclick="addToCart('Veg.Sandwich', 35)">Add to Cart</button>
            </div>

             <div class="food-item">
                 <img src="https://2.bp.blogspot.com/-g9HDrmcd-dQ/Vd6VEPLmu6I/AAAAAAAAEOc/BUyJ2tmiOHQ/s1600/Veg_Cheese_Sandwich.JPG" class="centered-image"alt="centered-image" style="width: 100px; height: 100px" />
                 <h3>Veg Toast Sandwich </h3>
                 <p >₹50</p>
                  <input type="number" min="0" value="1" />
                 <button type="button" onclick="addToCart('Veg Toast Sandwich', 50)">Add to Cart</button>
             </div>
             
                  <div class="food-item">
                     <img src="https://www.spiceupthecurry.com/wp-content/uploads/2020/11/masala-toast-sandwich-1.jpg" class="centered-image"alt="centered-image" style="width: 100px; height: 100px" />
                     <h3>Masala Toast Sandwich</h3>
                     <p >₹30</p>
                     <input type="number" min="0" value="1" />
                     <button type="button" onclick="addToCart('Masala Toast Sandwich', 30)">Add to Cart</button>
                </div>
           
             <div class="food-item">
               <img src="https://www.ndtv.com/cooks/images/CHEESE.SANDWITCH.765%281%29.jpg" class="centered-image"alt="centered-image" style="width: 100px; height: 100px" />
               <h3>Cheese Sandwich</h3>
                <p >₹60</p>
             <input type="number" min="0" value="1" />
             <button type="button" onclick="addToCart('Cheese Frankie', 60)">Add to Cart</button>
            </div>

              <div class="food-item">
               <img src="https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=1080/assets/search/usecase/butter_toast_zdish.png" class="centered-image"alt="centered-image" style="width: 100px; height: 100px" />
              <h3>Bread Butter</h3>
              <p >₹30</p>
              <input type="number" min="0" value="1" />
              <button type="button" onclick="addToCart('Bread Butter', 30)">Add to Cart</button>
        </div>

              <div class="food-item">
                <img src="https://cdn.loveandlemons.com/wp-content/uploads/2023/01/grilled-cheese.jpg" class="centered-image"alt="centered-image" style="width: 100px; height: 100px" />
                <h3>Cheese Toast Sandwich</h3>
                <p >₹65</p>
                <input type="number" min="0" value="1" />
                <button type="button" onclick="addToCart('CheeseToast Sandwich', 65)">Add to Cart</button>
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

