# Food_Delivery_App
 Make Backend Food Delivery App With Express.js 
 <h1 align="center">ExpressJS - Food Delivery</h1>



Food Delivery App is a simple Food Delivery application specially for backend only. Built with NodeJs using the ExpressJs Framework.
Express.js is a web application framework for Node.js. [More about Express](https://en.wikipedia.org/wiki/Express.js)
## Built With
[![Express.js](https://img.shields.io/badge/Express.js-4.x-orange.svg?style=rounded-square)](https://expressjs.com/en/starter/installing.html)
[![Node.js](https://img.shields.io/badge/Node.js-v.10.16-green.svg?style=rounded-square)](https://nodejs.org/)

## Requirements
1. <a href="https://nodejs.org/en/download/">Node Js</a>
2. Node_modules
3. <a href="https://www.getpostman.com/">Postman</a>
4. Web Server (ex. localhost)

## How to run the app ?
1. Open app's directory in CMD or Terminal
2. Type `npm install`
3. Make new file a called **.env**, set up first [here](#set-up-env-file)
4. Turn on Web Server and MySQL can using Third-party tool like xampp, etc.
5. Create a database with the name food_delivery, and Import file [food_delivery.sql](food_delivery.sql) to **phpmyadmin**
6. Open Postman desktop application or Chrome web app extension that has installed before
7. Choose HTTP Method and enter request url.(ex. localhost:3000/notes)
8. You can see all the end point [here](#end-point)

## Set up .env file
Open .env file on your favorite code editor, and copy paste this code below :
```
PORT=3000
HOST=localhost
USER=root // default
PASS= // default
DATABASE=food_delivery
NODE_ENV=development node server.js
```

## End Point
**1. GET**
* `/:id`
* `/restaurant/`
* `/restaurant/:id_restaurant`
* `/item/` (Get all Item with pagination)
* `/item/:id:item` (get detail item by id)
* `/carts/:id` 
* `/valuation/:item_id`
* `/categories/` (Get All Categories)
* `/categories/:id_categories` (Get Categories by id)
* `/categories/detail/id_categories` (Show all item with categories id)
* `/item/search` (Search Item By name or price or rating)
* `/restaurant/menu/id_restaurant` (show all menu/item by id restaurant)



**2. POST**
* `/login`

* `/logout`

* `/register`

* `/registerest`

* `/restaurant/`

*  `/item/` (Add Item)

* `/carts/` (Add to Cart)

* `/valuation/` (Add Review and Rating)

* `/categories/` (Add Categories)


**3. PUT**
* `/:id` (Edit User Account)
  * ``` { "name": "arka", "username": "Demy", "password": "arkademy", "role_id": 3 } ```

* `/item/:id_item` (Edit item)
    
* `/restaurant/:id_restaurant`

* `/carts/:id_carts`

* `/carts/checkout/:id_carts` (CheckOut item)

* `/categories/id_categories` (Edit Categories)

 


**4. DELETE**
* `/:id` (Delete User Account)
* `/item/:id_item` (Delete Item)
* `/restaurant/:id_restaurant` (Delete Restaurant)
* `/carts/:id` (Delete Item On Cart)
* `/categories/:id_categories` (Delete Categories)
