require('dotenv').config()

const router = require('express').Router()
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')
const mysql = require('../dbconfig')
const {auth} = require('../middleware')
const {detail,add,dlt,edit}= require('../model/restaurant')

/*tambah data*/
router.post('/',auth,(req,res)=>{
    const {name,description,image,longitude,latitude,item_id, user_id} = req.body
    const created_on = new Date()
    const updated_on = new Date()

    mysql.execute(
        add, [name,description,image,longitude,latitude,item_id,user_id,created_on,updated_on],
        (err,result,field)=>{
            console.log(err)
            res.send({succes:true,data:result})
        }
    )
})

/* mengambil data */
router.get('/:id',auth,(req,res)=>{
    const {id} = req.params
        mysql.execute(detail,[id], (err, result,field)=>{
            res.send({succes:true,data:result[0]})
        })
})

/** delete restaurant */
router.delete('/:id',auth,(req,res)=>{
    const {id} = req.params
    mysql.execute(dlt,[id], (err,result,field)=>{
        res.send({succes:true,data:result})
    })
})

/**edit restaurant */
router.put('/:id',auth,(req,res)=>{
    const {id} = req.params
    const{name,description,image,longitude,latitude,item_id, user_id} = req.body
    const updated_on = new Date()
    mysql.execute(
        edit, [name,description,image,longitude,latitude,item_id,user_id,updated_on,id],(err,result,field)=>{
            res.send({succes:true,data:result})
            // console.log(err)
        }
    ) 
})

module.exports = router
