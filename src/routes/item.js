require('dotenv').config()

const router = require('express').Router()
const mysql = require('../dbconfig')
const {auth, restaurant} = require('../middleware')
const {detail,add,dlt,edit}= require('../model/item')


const multer = require('multer')
const storage = multer.diskStorage({destination: function(req,file,cb){
    cb(null, './src/images/item' )
    },
    filename: function(req,file,cb){
        cb(null, file.originalname)
    }
})

const upload = multer ({storage:storage})

/*tambah item*/
router.post('/',auth,restaurant,upload.single('image'),(req,res)=>{
    const image = (req.file.originalname)
    const {item_name,categories_id,restaurant_id,price,description} = req.body
    const created_on = new Date()
    const updated_on = new Date()

    mysql.execute(
        add, [item_name,categories_id,restaurant_id,price,description,image,created_on,updated_on],
        (err,result,field)=>{
            console.log(err)
            res.send({succes:true,data:result})
        }
    )
})

/* detail item */
router.get('/:id_item',auth,restaurant,(req,res)=>{
    const {id_item} = req.params
        mysql.execute(detail,[id_item], (err, result,field)=>{
            res.send({succes:true,data:result[0]})
        })
})

/** delete item */
router.delete('/:id_item',auth,restaurant,(req,res)=>{
    const {id} = req.params
    mysql.execute(dlt,[id_item], (err,result,field)=>{
        res.send({succes:true,data:result})
    })
})

/**edit item */
router.put('/:id_item',auth,restaurant,upload.single('image'),(req,res)=>{
    const {id_item} = req.params
    const image = (req.file.originalname)
    const{item_name,categories_id,restaurant_id,price,description} = req.body
    const updated_on = new Date()
    mysql.execute(
        edit, [item_name,categories_id,restaurant_id,price,description,image,updated_on,id_item],(err,result,field)=>{
            res.send({succes:true,data:result})
            console.log(err)
        }
    ) 
})

module.exports = router
