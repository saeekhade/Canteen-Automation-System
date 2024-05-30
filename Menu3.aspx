<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu3.aspx.cs" Inherits="PROJECT.Menu3" %>
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

        .filter-container {
            text-align: center;
            margin-bottom: 15px;
        }

        .filter-container label {
            margin-right: 15px;
        }

        .filter-container input {
            margin-right: 5px;
        }

        .veg-filter {
            font-family:'Times New Roman', Times, serif;
            color: green;
        }

        .nonveg-filter {
            font-family:'Times New Roman', Times, serif;
            color: red;
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
            <h2> Food Items</h2>
        </div>
        <div class="filter-container">
            <label class="veg-filter">
                <input type="radio" name="category" value="all" onclick="filterItems('all')" checked/> All
            </label>
            <label class="veg-filter">
                <input type="radio" name="category" value="veg" onclick="filterItems('veg')" /> Veg
            </label>
            <label class="nonveg-filter">
                <input type="radio" name="category" value="nonveg" onclick="filterItems('nonveg')" /> Non-Veg
            </label>
        </div>

        <div class="food-item veg">
            <img src="https://www.kannammacooks.com/wp-content/uploads/schezwan-veg-fried-rice-1.jpg" class="centered-image" alt="centered-image" style="width: 100px; height: 100px" />
            <h3>Veg.Fried Rice</h3>
            <p >₹60</p>
            <p></p>
            <input type="number" min="0" value="1" />
            <button type="button" onclick="addToCart('Veg.Fried Rice', 60)">Add to Cart</button>
        </div>

        <div class="food-item veg">
            <img src="https://www.indianhealthyrecipes.com/wp-content/uploads/2021/07/hakka-noodles-recipe.jpg" class="centered-image"alt="centered-image" style="width: 100px; height: 100px" />
            <h3>Veg.Noodles </h3>
            <p >₹65</p>
            <p> </p>
            <input type="number" min="0" value="1" />
            <button type="button" onclick="addToCart('Veg.Noodles', 65)">Add to Cart</button>
        </div>

        <div class="food-item veg">
            <img src="https://sameeraskitchen.files.wordpress.com/2015/03/20190423_225645.jpg?w=640" class="centered-image"alt="centered-image" style="width: 100px; height: 100px" />
            <h3>Veg.Mancurian Rice</h3>
            <p >₹100</p>
            <p></p>
            <input type="number" min="0" value="1" />
            <button type="button" onclick="addToCart('Veg.Mancurian Rice', 100)">Add to Cart</button>
        </div>

        <div class="food-item veg">
            <img src="https://sangeetaskitchenblog.files.wordpress.com/2018/05/crispy-veg.jpg?w=1000" class="centered-image"alt="centered-image" style="width: 100px; height: 100px" />
            <h3>Veg.Crispy</h3>
            <p >₹60</p>
            <p></p>
            <input type="number" min="0" value="1" />
            <button type="button" onclick="addToCart('Veg.Crispy',60)">Add to Cart</button>
        </div>

        <div class="food-item nonveg">
            <img src="https://www.bigfattummy.com/wp-content/uploads/2016/09/Chi-Fried-Rice-07-1200x900.jpg" class="centered-image" alt="centered-image" style="width: 100px; height: 100px" />
            <h3>Chicken Fried Rice</h3>
            <p >₹100</p>
            <p>  </p>
            <input type="number" min="0" value="1" />
            <button type="button" onclick="addToCart('Chicken Fried Rice', 120)">Add to Cart</button>
        </div>

        <div class="food-item nonveg">
            <img src="https://theflavoursofkitchen.com/wp-content/uploads/2016/08/oriental-chicken-noodles.1024x1024-500x500.jpg" class="centered-image"alt="centered-image" style="width: 100px; height: 100px" />
            <h3>Chicken Noodles</h3>
            <p >₹100</p>
            <p>  </p>
            <input type="number" min="0" value="1" />
            <button type="button" onclick="addToCart('Chicken Noodles', 100)">Add to Cart</button>
        </div>

        <div class="food-item nonveg">
            <img src="https://assets-global.website-files.com/60d34b8627f6e735cf28df18/62a95eaacb8d206406f1d296_Chicken%20Lollipop%20Hero%204.3.jpg" class="centered-image"alt="centered-image" style="width: 100px; height: 100px" />
            <h3>Lolipop</h3>
            <p >₹100</p>
            <p> [3 pcs]</p>
            <p>   </p>
            <input type="number" min="0" value="1" />
            <button type="button" onclick="addToCart('Lolipop', 100)">Add to Cart</button>
        </div>

        <div class="food-item nonveg">
            <img src="https://mymorningmocha.com/wp-content/uploads/2022/04/Crispy-Chilli-Chicken.jpeg" class="centered-image"alt="centered-image" style="width: 100px; height: 100px" />
            <h3>Chicken Crispy</h3>
            <p >₹60</p>
            <p></p>
            <input type="number" min="0" value="1" />
            <button type="button" onclick="addToCart('ChickenvCrispy',60)">Add to Cart</button>
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

            // JavaScript function to filter food items based on category
            function filterItems(category) {
                var foodItems = document.getElementsByClassName('food-item');
                for (var i = 0; i < foodItems.length; i++) {
                    if (category === 'all') {
                        // Display all items
                        foodItems[i].style.display = 'inline-block';
                    } else {
                        // Display only items of the selected category
                        var itemCategory = foodItems[i].classList.contains('veg') ? 'veg' : 'nonveg';
                        if (itemCategory === category) {
                            foodItems[i].style.display = 'inline-block';
                        } else {
                            foodItems[i].style.display = 'none';
                        }
                    }
                }
            }
        </script>
    </form>
</body>
</html>
