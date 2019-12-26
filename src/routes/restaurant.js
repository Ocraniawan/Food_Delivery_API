require('dotenv').config()

const router = require('express').Router()
const mysql = require('../dbconfig')
const {auth, admin} = require('../middleware')
const {detail,add,dlt,edit}= require('../model/restaurant')

/**Upload Foto */
const multer = require('multer')
const path = require('path')

const storage = multer.diskStorage({
    destination: function (req, file, callback) {
        callback(null, '../images/restaurant')
    },
    filename: function (req, file, callback) {
        callback(null, file.fieldname + Date.now() + path.extname(file.originalname))
    }
})



/*tambah data*/
router.post('/',auth,admin,(req,res)=>{
    const {name,description,longitude,latitude,item_id, user_id} = req.body
    const image = multer({ storage: storage }).single('image')
    const created_on = new Date()
    const updated_on = new Date()

    mysql.execute(
        add, [name,description,image,longitude,latitude,item_id,user_id,created_on,updated_on],
        (err,result,rows,field)=>{
            console.log(err)
            res.json({rows})
            res.send({succes:true,data:result})
        }
    )
})


/* mengambil data */
router.get('/:id',auth,admin,(req,res)=>{
    const {id} = req.params
        mysql.execute(detail,[id], (err, result,field)=>{
            res.send({succes:true,data:result[0]})
        })
})

/** delete restaurant */
router.delete('/:id',auth,admin,(req,res)=>{
    const {id} = req.params
    mysql.execute(dlt,[id], (err,result,field)=>{
        res.send({succes:true,data:result})
    })
})

/**edit restaurant */
router.put('/:id',auth,admin,(req,res)=>{
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
