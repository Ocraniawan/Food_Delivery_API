require('dotenv').config()

const router = require('express').Router()
const mysql = require('../dbconfig')
const {auth, client} = require('../middleware')
const {add, detail} = require('../model/valuation')

router.post('/',(req,res)=>{
    const {rating,review, user_id,item_id} = req.body
    const created_on = new Date()
    const updated_on = new Date()
    const sql = `INSERT INTO valuation (rating,review,user_id,item_id,created_on,updated_on) VALUES (?,?,?,?,?,?)`
    mysql.execute(sql, [rating,review,user_id,item_id,created_on,updated_on], (err, result0, field)=>{
        res.send({success: true, data: result0})
        if(err == null){
            const sql = `SELECT AVG(rating) AS rate from valuation WHERE item_id = ${item_id}`
            mysql.execute(sql, [], (err, result, field)=>{
                var rating = result[0].rate
                // console.log(user_id)
                if(err == null){
                    const sql = `UPDATE item set rating = ${result[0].rate} WHERE id_item = ${item_id} `
                    mysql.execute(sql, [rating], (err, result1, field)=>{
                        if(err == null){
                            const sql = `DELETE from carts WHERE item_id = ${item_id} AND user_id = ${user_id}`
                            mysql.execute(sql, [item_id, user_id], (err, result2, field) =>{
                                res.send({success: true, result2})
                            } )
                        }
                        
                    })
                }
            })
        } 
    })
})


router.get('/:item_id',(req,res)=>{
    const {item_id} = req.params
    mysql.execute(detail,[item_id],(err,result,field)=>{
        res.send({succes:true, data:result})
        // console.log(err)
    })
})

module.exports = router