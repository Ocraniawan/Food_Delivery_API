require('dotenv').config()

const router = require('express').Router()
const mysql = require('../dbconfig')
const {auth, client} = require('../middleware')
const {add,edit,detail,dlt} = require('../model/cart')


/**ADD TO CART */
router.post('/',auth,client,(req,res)=>{
    const {item_id,user_id,restaurant_id} =  req.body
    const created_on = new Date()
    const updated_on = new Date()
    mysql.execute(add,[item_id,user_id,restaurant_id,created_on,updated_on],
            (err,result,field)=>{
                res.send({succes:true,data:result})
                console.log(err)
            }
        )

})

/**EDIT CART */
router.put('/:id_carts',auth,client,(req,res)=>{
    const {id_carts} = req.params
    const {item_id,user_id,restaurant_id} = req.body
    const updated_on = new Date()
    mysql.execute(edit,[item_id,user_id,restaurant_id,updated_on,id_carts],
        (err,result,field)=>{
            res.send({succes:true,data:result})
        }
        )
})

/**DETAIL CART */
router.get('/:id_carts',auth,client,(req,res)=>{
    const {id_carts} = req.params
    mysql.execute(detail,[id_carts],(err,result,field)=>{
        res.send({succes:true,data:result[0]})
        console.log(err)
    })
})


/**DELETE CART */
router.delete('/:id',auth,client,(req,res)=>{
    const {id_carts} = req.params
    mysql.execute(dlt,[id_carts],(err,result,field)=>{
        res.send({succes:true,data:result})
    })
})




module.exports = router