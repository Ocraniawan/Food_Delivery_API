require('dotenv').config()

const router = require('express').Router()
const mysql = require('../dbconfig')
const {auth, client} = require('../middleware')
const {add, detail} = require('../model/valuation')

router.post('/',auth,client,(req,res)=>{
    const {rating,review, user_id,item_id,cart_id} = req.body
    const created_on = new Date()
    const updated_on = new Date()

    mysql.execute(add, [rating,review,user_id,item_id,cart_id,created_on,updated_on],(err,result,field)=>{
        res.send({succes:true, data:result})
        console.log(err)
    })
})


router.get('/:id',auth,(req,res)=>{
    const {id} = req.params

    mysql.execute(detail, [id],(err,result,field)=>{
        res.send({succes:true,data:result[0]})
    })
})

module.exports = router