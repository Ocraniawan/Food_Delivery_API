require('dotenv').config()

const router = require('express').Router()
const mysql = require('../dbconfig')
const {auth, admin} = require('../middleware')
const {detail,add,dlt,edit}= require('../model/restaurant')

/**Upload Foto */
const multer = require('multer')
const storage = multer.diskStorage({destination: function(req,file,cb){
    cb(null, './src/images/restaurant')
    },
    filename: function(req,file,cb){
        cb(null, file.originalname)
    }
})
const fileFilter = (req,file,cb)=> {
    if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png'){
        cb(null, true)
    }else{
        cb(null, false)
    }
}
const upload = multer({storage:storage, fileFilter:fileFilter})

/*tambah data*/
router.post('/',auth,admin,upload.single('image'),(req,res)=>{
    const image = (req.file.originalname)
    const {name,description,longitude,latitude, user_id} = req.body
    const created_on = new Date()
    const updated_on = new Date()

    mysql.execute(add, [name,description,image,longitude,latitude,user_id,created_on,updated_on],
        (err,result,rows,field)=>{
            // console.log(err)
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
router.put('/:id',auth,admin,upload.single('image'),(req,res)=>{
    const {id} = req.params
    const image = (req.file.originalname)
    const{name,description,longitude,latitude, user_id} = req.body
    const updated_on = new Date()
    mysql.execute(edit, [name,description,image,longitude,latitude,user_id,updated_on,id],(err,result,field)=>{
            res.send({succes:true,data:result})
            // console.log(err)
        }
    ) 
})

module.exports = router
