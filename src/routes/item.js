require('dotenv').config()

const router = require('express').Router()
const mysql = require('../dbconfig')
const {auth, restaurant} = require('../middleware')
const {detail,add,dlt,edit}= require('../model/item')

/*tambah item*/
router.post('/',auth,restaurant,(req,res)=>{
    const {name,categories_id,price,description,image} = req.body
    const created_on = new Date()
    const updated_on = new Date()

    mysql.execute(
        add, [name,categories_id,price,description,image,created_on,updated_on],
        (err,result,field)=>{
            console.log(err)
            res.send({succes:true,data:result})
        }
    )
})

/* mengambil item */
router.get('/:id',auth,restaurant,(req,res)=>{
    const {id} = req.params
        mysql.execute(detail,[id], (err, result,field)=>{
            res.send({succes:true,data:result[0]})
        })
})

/** delete item */
router.delete('/:id',auth,restaurant,(req,res)=>{
    const {id} = req.params
    mysql.execute(dlt,[id], (err,result,field)=>{
        res.send({succes:true,data:result})
    })
})

/**edit item */
router.put('/:id',auth,restaurant,(req,res)=>{
    const {id} = req.params
    const{name,categories_id,price,description,image} = req.body
    const updated_on = new Date()
    mysql.execute(
        edit, [name,categories_id,price,description,image,updated_on,id],(err,result,field)=>{
            res.send({succes:true,data:result})
            // console.log(err)
        }
    ) 
})

module.exports = router
