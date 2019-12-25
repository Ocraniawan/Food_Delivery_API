require('dotenv').config()

const router = require('express').Router()
const mysql = require('../dbconfig')
const {auth,admin_restaurant} = require('../middleware')
const {add,edit,dlt,detail} = require('../model/categories')


/**add categories */
router.post('/',auth,admin_restaurant,(req,res)=>{
    const {name} = req.body
    const created_on = new Date()
    const updated_on = new Date()
    mysql.execute(add,[name,created_on,updated_on], (err,result,field)=>{
        res.send({succes:true,data:result})
        console.log(err)
    })
})

/**edit categories */
router.put('/:id',auth,admin_restaurant,(req,res)=>{
    const {id} = req.params
    const {name} = req.body
    const updated_on = new Date()
    mysql.execute(edit,[name,updated_on,id], (err,result,field)=>{
        res.send({succes:true,data:result})
        console.log(err)
    })
})


/**detail categories */
router.get('/:id',auth,admin_restaurant,(req,res)=>{
    const {id} =req.params
    mysql.execute(detail,[id], (err,result,field)=>{
        res.send({succes:true,data:result})
    })
})

/**delete categories */
router.delete('/:id',auth,admin_restaurant,(req,res)=>{
    const {id} = req.params
    mysql.execute(dlt,[id], (err,result,field)=>{
        res.send({success:true,data:result})
    })
})


module.exports = router