require('dotenv').config()

const express = require('express')
const cors = require('cors')
const bodyParser = require('body-parser')
const {auth} = require('./src/middleware')

const user = require('./src/routes/user')
const restaurant = require('./src/routes/restaurant')
const item = require('./src/routes/item')

const app = express()

app.use(bodyParser.urlencoded({extended:false}))

app.use(bodyParser.json())

app.use('/user',user)
app.use('/restaurant',restaurant)
app.use('/item',item)

const port = process.env.APP_PORT

app.listen(port,()=>{
    console.log('App listen on Port'+ port)
})