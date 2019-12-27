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
        if (err) {
            res.send(err)
        }else{
            const avgrate = 'SELECT AVG(rating) AS rate FROM valuation WHERE item_id=?'
            mysql.execute(avgrate,[item_id],(err0,result0,field0)=>{
             if (err0) {
                 res.send({data:err0, msg: 'Error 1'})
             }else{
                 const ratingavg = 'UPDATE item SET rating=? WHERE id_item=? '
                 mysql.execute(ratingavg,[result0[0].rate, item_id],(err2, res2, field2)=>{
                     if (err) {
                         res.send({data:err2, msg: 'error 2'})
                     }else{
                        res.send({data:result0[0].rate, msg: 'Berhasill'})  
                     }
                 })
        
             }
        }

    ) }
    })
})


router.get('/:id',auth,(req,res)=>{
    const {id} = req.params

    mysql.execute(detail, [id],(err,result,field)=>{
        res.send({succes:true,data:result[0]})
    })
})

module.exports = router