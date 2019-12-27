require('dotenv').config()

const express = require('express')
const cors = require('cors')
const bodyParser = require('body-parser')
const {auth} = require('./src/middleware')

const user = require('./src/routes/user')
const restaurant = require('./src/routes/restaurant')
const item = require('./src/routes/item')
const cart = require('./src/routes/cart')
const categories = require('./src/routes/categories')
const valuation = require('./src/routes/valuation')
const search = require('./src/routes/search')

const app = express()

app.use(bodyParser.urlencoded({extended:false}))

app.use(bodyParser.json())

app.use('/user',user)
app.use('/restaurant',restaurant)
app.use('/item',item)
app.use('/cart',cart)
app.use('/categories',categories)
app.use('/valuation',valuation)
app.use('/search',search)


const port = process.env.APP_PORT

app.listen(port,()=>{
    console.log('App listen on Port'+ port)
})