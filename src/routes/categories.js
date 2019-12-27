require('dotenv').config()

const router = require('express').Router()
const mysql = require('../dbconfig')
const {auth,admin_restaurant} = require('../middleware')
const {add,edit,dlt,detail} = require('../model/categories')


/**add categories */
router.post('/',auth,admin_restaurant,(req,res)=>{
    const {name_categories} = req.body
    const created_on = new Date()
    const updated_on = new Date()
    mysql.execute(add,[name_categories,created_on,updated_on], (err,result,field)=>{
        res.send({succes:true,data:result})
        console.log(err)
    })
})

/**edit categories */
router.put('/:id_categories',auth,admin_restaurant,(req,res)=>{
    const {id_categories} = req.params
    const {categories_name} = req.body
    const updated_on = new Date()
    mysql.execute(edit,[categories_name,updated_on,id], (err,result,field)=>{
        res.send({succes:true,data:result})
        console.log(err)
    })
})


/**detail categories */
router.get('/:id_categories',auth,admin_restaurant,(req,res)=>{
    const {id} =req.params
    mysql.execute(detail,[id_categories], (err,result,field)=>{
        res.send({succes:true,data:result})
    })
})

/**delete categories */
router.delete('/:id_categories',auth,admin_restaurant,(req,res)=>{
    const {id} = req.params
    mysql.execute(dlt,[id_categories], (err,result,field)=>{
        res.send({success:true,data:result})
    })
})


module.exports = router