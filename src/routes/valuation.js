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
        // var user_id = result0[0].user_id
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



    // var sql = ''

    // console.log(item_id)

    // item_id.forEach((v,i) => {
    //     sql += add + `VALUES (${rating},${review},${user_id},${v},${created_on},${updated_on});`
    // })

//     console.log(sql)
//     mysql.execute(sql,[rating,review, user_id,item_id],(err,result,field)=>{
//         if (err) {
//             res.send(err)
//         }else{
//             const avgrate = 'SELECT AVG(rating) AS rate FROM valuation WHERE item_id=?'
//             mysql.execute(avgrate,[item_id],(err1,result1)=>{
//              if (err1) {
//                  res.send({data:err1, msg: 'Error Average Rating'})
//              }else{
//                  const ratingavg = 'UPDATE item SET rating=? WHERE id_item=? '
//                  mysql.execute(ratingavg,[result1[0].rate, item_id],(err2, res2, field2)=>{
//                      if (err) {
//                          res.send({data:err2, msg: 'Error Update Rating'})
//                      }else{
//                         res.send({data:result1[0].rate, msg: 'Update Rating Success'})  
//                      }
//                  })
        
//              }
//         }

//     ) }
//     // res.send({success:true, data:result})

// })
// })


router.get('/:item_id',(req,res)=>{
    const {item_id} = req.params
    mysql.execute(detail,[item_id],(err,result,field)=>{
        res.send({succes:true, data:result})
        // console.log(err)
    })
})

module.exports = router