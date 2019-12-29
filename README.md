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
5. Create a database with the name note, and Import file [note.sql](note.sql) to **phpmyadmin**
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
DATABASE=note
NODE_ENV=development node server.js
```

## End Point
**1. GET**
* `/:id`
* `/restaurant/:id_restaurant`
* `/:`



**2. POST**
* `/login`

* `/logout`

* `/`

* `/register`

* `/registerest`

* `/restaurant/`

* 


**3. PUT**
* `/:id` (Edit User Account)
* `/restaurant/:id_restaurant`
* `/note/:id` (Update note by id)
   * ``` { "name": "arka", "username": "Demy", "password": "arkademy", "role_id": 3 } ```


**4. DELETE**
* `/:id` (Delete User Account)
* `/restaurant/:id_restaurant` (Delete Restaurant)