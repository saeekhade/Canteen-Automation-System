<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="PROJECT.Menu1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quick Canteen Menu</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: black;
            color: white;
            margin: 0;
            padding: 0;
            border: 5px solid white; /* Add border to the body */
        }

        header {
            text-align: center;
            padding: 20px;
            background-color: black;
        }

        h1 {
            margin: 0;
        }

        ul {
            list-style-type: square;
            padding: 0;
            margin: 20px;
        }

        li {
            margin: 10px 0;
            font-size: 18px; /* Change the font size */
            font-family: 'Arial', sans-serif;
        }

        ol {
            list-style-type: decimal;
            padding-left: 20px;
        }
    </style>
</head>
<body>
    <header>
         <div>
         <img src="logo.JPG"alt="Centered Image" class="centered-image" style="width:300px; height:200px" />
     </div>
        <h1>Quick Canteen Menu</h1>
    </header>
    <ul>
        <li>Southern Delight
            <ol type="1">
                <li>Vadapav</li>
                <li>Samosa</li>
                <li>Idli</li>
                <li>Kanda Poha</li>
                <li>Sheera</li>
            </ol>
        </li>

        <li>Frankie
            <ol>
                <li>Sada Frankie</li>
                <li>Schz.Frankie</li>
                <li>Noodles Frankie</li>
                <li>Cheese Frankie</li>
                <li>Manchurian Frankie</li>
                <li>Mayonise Frankie</li>
            </ol>
        </li>

        <li>Chinese
            <ol>
                <li>Veg.Fried rice</li>
                <li>Veg.Noodles</li>
                <li>veg.Crispy</li>
                <li>veg Manchurian Rice</li>
                <li>Chicken Fried Rice</li>
                <li>Chicken Noodles</li>
                <li>Chicken Crispy</li>
                <li>Lolipop</li>
                
            </ol>
        </li>

         <li>Fasting 
            <ol>
                <li>Sabudana Vada</li>
                <li>Potato Chips</li>
                 <li>Sabudana Khichdi</li>
                </ol>
             </li>

        <li>Chaat Ka Kamal 
           <ol>
               <li>Bhelpuri</li>
               <li>Sevpuri</li>
               <li>Dahipuri</li>
               <li>chinese Bhel</li>
       </ol>
    </li>

      <li>Bread Magic
          <ol>
           <li>Veg Sandwich</li>
           <li>Veg Toast Sandwich</li>
           <li>Masala Toast Sandwich</li>
           <li>Cheese Sandwich</li>
           <li>Cheese Toast Sandwich</li>
           <li>Bread Butrer</li>
          </ol>
   </li>

       <li>Hot Beverages
          <ol>
              <li>Tea Full</li>
              <li>Tea Cutting</li>
              <li>Coffee</li>
     </ol>
  </li>

     <li>Cold Drinks
        <ol>
            <li>Soft Drink</li>
            <li>Mineral Water</li>
            <li>Nimbu Pani</li>
            <li>Butter Milk</li>
   </ol>
</li>
        

    </ul>
</body>
</html>
