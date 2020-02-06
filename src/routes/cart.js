require('dotenv').config()

const router = require('express').Router()
const mysql = require('../dbconfig')
const {auth, client} = require('../middleware')
const {add,edit,detail,dlt} = require('../model/cart')


/**ADD TO CART */
router.post('/',(req,res)=>{
    const {item_id,user_id,quantity} =  req.body
    const created_on = new Date()
    const updated_on = new Date()
    mysql.execute(add,[item_id,user_id,quantity,created_on,updated_on],
            (err,result,field)=>{
                res.send({succes:true, data:result})
                console.log(err)
            }
        )

})

/**EDIT CART */
router.put('/:id_carts',auth,(req,res)=>{
    const {id_carts} = req.params
    const {item_id,user_id,restaurant_id} = req.body
    const updated_on = new Date()
    mysql.execute(edit,[item_id,user_id,restaurant_id,updated_on,id_carts],
        (err,result,field)=>{
            res.send({succes:true,data:result})
        }
        )
})


// CHECK OUT */
router.put('/checkout/:id_carts',(req,res)=>{
    const {id_carts} = req.params
    const is_checkout = 1
    const updated_on = new Date()
    const sql = `UPDATE carts set is_checkout=?, updated_on=? WHERE id_carts=?`
    mysql.execute(sql,[is_checkout,updated_on,id_carts],(err,result,field)=>{
        if (err) {
            console.log(err)
        } else {
            res.send({ succes: true, data: result, msg: "Check Out Successfull", })
        }
    })
})

// /* input review */
// router.post('/inputreview', auth, (req, res)=>{ //jangan lupa pakai role dan auth
//     const {rating, review, id_item, id_user} = req.body
//     const created_on = new Date()
//     const updated_on = new Date()
//     const sql = `INSERT INTO review (rating, review, id_item, id_user, created_on, updated_on) VALUES (?,?,?,?,?,?)`
//     mysql.execute(sql, [rating, review, id_item, id_user, created_on, updated_on], (err, resuld, field)=>{
//         // var id_user = resuld[0].id_user
//         if(err == null){
//             const sql = `SELECT AVG(rating) AS rate from review WHERE id_item = ${id_item}`
//             mysql.execute(sql, [], (err, result, field)=>{
//                 var rating = result[0].rate
//                 if(err == null){
//                     const sql = `UPDATE item_data set rating = ${result[0].rate} WHERE id_item = ${id_item} `
//                     mysql.execute(sql, [rating], (err, result1, field)=>{
//                         if(err == null){
//                             const sql = `DELETE from cart WHERE id_item = ${id_item} AND id_user = ${id_user}`
//                             mysql.execute(sql, [id_item, id_user], (err, result2, field) =>{
//                                 res.send({success: true, result2})
//                             } )
//                         }
                        
//                     })
//                 }
//             })
//         } 
//     })
// })
/* ------------------------------------------------------------------------------------------*/

/**DETAIL CART */
router.get('/:id',auth,(req,res)=>{
    const {id} = req.params
    mysql.execute(detail,[id],(err,result,field)=>{
        res.send({succes:true,data:result})
        console.log(err)
    })
})


/**DELETE CART */
router.delete('/:id',(req,res)=>{
    const {id} = req.params
    mysql.execute(dlt,[id],(err,result,field)=>{
        res.send({succes:true, data:result})
        console.log(err)
    })
})

 


module.exports = router