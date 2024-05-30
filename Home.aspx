<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PROJECT.Home" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quick Canteen</title>
    <style>
        /* Global styles */
        body {
            font-family:Dubai;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        /* Header styles */
        .centered-image {
            display: block;
            margin: 0 auto;
            text-align: center;
        }
        header {
            background-color: #333;
            color:white;
            padding: 1em;
            text-align: center;
        }


        /* Navigation styles */
        nav {
            background-color: #666;
            padding: 1em;
            text-align: center;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 0.5em 1em;
            margin: 0 1em;
            border-radius: 5px;
            background-color: #444;
            transition: background-color 0.3s ease;
        }

        nav a:hover {
            background-color: #555;
        }
        .mySlides img {
        width: 100%;
        height: 300px; /* Set a fixed height for the images */
        object-fit: cover; /* Maintain aspect ratio and cover the container */
    }

        /* Main content styles */
        section {
            padding: 2em;
        }

        h2 {
            color: #333;
            border-bottom: 2px solid #666;
            padding-bottom: 0.5em;
            margin-bottom: 1em;
        }

        /* Slideshow styles */
        .slideshow-container {
            max-width: 600px;
            margin: auto;
            display: flex;
            justify-content: space-between;
            overflow: hidden;
            position: relative;
        }

        .mySlides {
            flex: 0 0 auto;
            width: 100%;
            display: none;
        }

        img {
            width: 100%;
            height: auto;
        }

        .prev,
        .next {
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            cursor: pointer;
            background-color:darkgray;
        }

        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        .prev:hover,
        .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

        /* Featured items styles */
        .featured-item {
            text-align:center;
            display: inline-block;
            justify-content: space-between;
            border: 1px solid #ddd;
            padding: 1em;
            margin-bottom: 1em;
            transition: transform 0.3s ease;
        }

        .featured-item:hover {
            transform: scale(1.02);
            box-shadow: 0 0 10px #444;
        }

        button {
            padding: 0.5em 1em;
            border: none;
            background-color: #333;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #555;
        }

        /* Login section styles */
        .login-section {
            text-align: center;
            margin-top: 2em;
        }

        .login-form {
            display: inline-block;
            text-align: left;
            padding: 1em;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: grey;
        }

        /* Footer styles */
        footer {
     background-color: #333;
     color: white;
     text-align: center;
     padding: 2em;
     display: flex;
     justify-content: space-around;
     align-items: center;
     flex-wrap: wrap;
 }

 footer div {
     flex: 1;
     margin: 1em;
 }

 footer h3 {
     border-bottom: 2px solid white;
     padding-bottom: 0.5em;
 }

 footer p {
     margin: 0.5em 
        }
    </style>
</head>
<body>
   <!--- header---->
    <header>
    <div>
        <img src="logo.JPG"alt="Centered Image" class="centered-image" style="width:300px; height:200px" />
        </div>
     </header>
   
    <!-- Navigation -->
    <nav>
        <a href="#">Home</a>
        <a href="Menu.aspx">Menu</a>
        <a href="Payment.aspx">Payment</a>
        <a href="Login.aspx">Login</a>
    </nav>

    <!-- Latest Offers -->
    <section>
        <h2>Latest Offers</h2>
        <div class="slideshow-container">
            <div class="mySlides">
                <img src="Pic2.JPEG" alt="special offer 1 "/>
                <div class="text"></div>
            </div>

            <div class="mySlides">
                <img src="Pic1.JPEG"  alt="Special Offer 2" width="80" height="80"/>
                <div class="text"></div>
            </div>
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
        </div>
    </section>

    <!-- Featured Items -->
    <section>
        <h2>Featured Items</h2>
       <a href="Menu1.aspx">
        <div class="featured-item">
            <div>
                <img src="https://static.wixstatic.com/media/7b645a_5cd554ea08f141cfae7cbf03a19ac273~mv2.png/v1/fill/w_840,h_540,al_c,q_90/7b645a_5cd554ea08f141cfae7cbf03a19ac273~mv2.png" style="width: 300px; height: 200px;"/>
                <h3>Southern delight</h3>
                <p></p>
            </div>
            
        </div>
</a>
        <a href="Menu2.aspx">
        <div class="featured-item">
            <div>
                <img src="https://www.maggi.in/sites/default/files/styles/maggi_desktop_image_style/public/Indrayani-Kadam.jpg?h=4f5b30f1&itok=lcNYIE_Q" style="width: 300px; height: 200px;"/>
                <h3>Frankie</h3>
            </div>
            </div>
</a>
        <a href="Menu3.aspx">
        <div class="featured-item">
            <div>
                <img src="https://content.jdmagicbox.com/comp/delhi/r2/011pxx11.xx11.171127123811.v6r2/catalogue/raj-chinese-food-rohini-sector-10-delhi-take-away-joints-1fzcrn4vh9.jpg" style="width: 300px; height: 200px;" />
                <h3>Chinese</h3>
            </div>
            <div>
            </div>
        </div>
</a>
        <a href="Menu4.aspx">
        <div class="featured-item">
    <div>
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Sabudana_vada.JPG/800px-Sabudana_vada.JPG" style=" width: 300px ;height:200px;" />
        <h3>Fasting</h3>
    </div>
    <div>
        
    </div>
</div>
</a>
        <a href="Menu5.aspx">
        <div class="featured-item">
    <div>
        <img src="https://www.carolinescooking.com/wp-content/uploads/2023/07/papdi-chaat-photo.jpg"style="width: 300px; height: 200px;" />
        <h3>Chaat ka kamal</h3>
    </div>
    <div>
    </div>
</div>
</a>
        <a href="Menu6.aspx">
        <div class="featured-item">
    <div>
        <img src="https://aartimadan.com/wp-content/uploads/2023/10/Cheesy-Veg-Grilled-Sandwich.jpg"style="width: 300px; height: 200px;" />
        <h3>Bread Magic</h3>
    </div>
    <div>
    </div>
</div>
            </a>

        <a href="Menu7.aspx">
        <div class="featured-item">
    <div>
       <img src="https://c4.wallpaperflare.com/wallpaper/813/369/237/coffee-coffee-beans-cup-hot-drink-wallpaper-preview.jpg" style="width: 300px; height: 200px;" />
        <h3>Hot Beverages</h3>
    </div>
    <div>
    </div>
</div>
            </a>

        <a href="Menu8.aspx">
        <div class="featured-item">
    <div>
        <img src="https://images.indianexpress.com/2016/10/pet-bottle-small.jpg" style="width: 300px; height: 200px;" />
        <h3>Cold drinks</h3>
    </div>
    <div>
    </div>
</div>
</a>
    </section>

    <br />
    <!-- Footer -->
    <footer>
     <div>
         <h3>Contact Us</h3>
         <p>Email: info@quickcanteen.com</p>
         <p>Phone: +123 456 7890</p>
     </div>
     <div>
         <h3>Address</h3>
         <p>Dixit Road</p>
         <p>Villeparle (E),Mumbai</p>
     </div>
     <div>
         <h3>Working Hours</h3>
         <p>Monday to Friday: 9:00 AM - 5:00 PM</p>
         <p>Saturday: 9:00 AM - 4:00 PM</p>
         <p>Sunday: Closed</p>
     </div>
 </footer>

    <!-- Slideshow JavaScript -->
    <script>
        var slideIndex = 1;

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            if (n > slides.length) { slideIndex = 1; }
            if (n < 1) { slideIndex = slides.length; }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slides[slideIndex - 1].style.display = "block";
        }

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        setInterval(function () { plusSlides(1); }, 5000);
    </script>
</body>
</html>
