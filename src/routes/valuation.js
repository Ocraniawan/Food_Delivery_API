require('dotenv').config()

const router = require('express').Router()
const mysql = require('../dbconfig')
const {auth} = require('../middleware')
const {add, detail} = require('../model/valuation')

router.post('/',auth,user,(req,res)=>{
    const {rating,review} = req.body
    const created_on = new Date()
    const updated_on = new Date()

    mysql.execute(add, [rating,review,created_on,updated_on],(err,result,field)=>{
        res.send({succes:true, data:result})
    })
})


router.get('/:id',auth,(req,res)=>{
    const {id} = req.params

    mysql.execute(detail, [id],(err,result,field)=>{
        res.send({succes:true,data:result[0]})
    })
})