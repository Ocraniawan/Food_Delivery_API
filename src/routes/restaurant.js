require('dotenv').config()

const router = require('express').Router()
const mysql = require('../dbconfig')
const {auth, admin} = require('../middleware')
const {detail,add,dlt,edit, all}= require('../model/restaurant')

/**Upload Foto/File */
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

/*add restaurant*/
router.post('/',auth,admin,upload.single('image'),(req,res)=>{
    const image = (req.file.originalname)
    const {restaurant_name,description,longitude,latitude, user_id} = req.body
    const created_on = new Date()
    const updated_on = new Date()

    mysql.execute(add, [restaurant_name,description,image,longitude,latitude,user_id,created_on,updated_on],
        (err,result,rows,field)=>{
            // console.log(err)
            res.send({succes:true,data:result})
        }
    )
})


/* detail restaurant */
router.get('/:id_restaurant',auth,admin,(req,res)=>{
    const {id_restaurant} = req.params
        mysql.execute(detail,[id_restaurant], (err, result,field)=>{
            res.send({succes:true,data:result[0]})
        })
})

/* detail all restaurant */
router.get('/',(req,res)=>{
    
        mysql.execute(all,[], (err, result,field)=>{
            res.send({data:result})
        })
})


router.get('/menu/:id_restaurant',(req,res)=>{
    const {id_restaurant} =req.params
    const sql = `SELECT item.id_item, restaurant.id_restaurant, categories.id_categories, item.item_name, item.image, item.price, item.rating, item.description, restaurant.restaurant_name, categories.categories_name FROM item 
    INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
    INNER JOIN categories ON item.categories_id = categories.id_categories WHERE restaurant.id_restaurant=?`
    mysql.execute(sql,[id_restaurant], (err,result,field)=>{
        res.send({succes:true, data:result})
        console.log(err)
    })
})




/** delete restaurant */
router.delete('/:id_restaurant',auth,admin,(req,res)=>{
    const {id} = req.params
    mysql.execute(dlt,[id_restaurant], (err,result,field)=>{
        res.send({succes:true,data:result})
    })
})

/**edit restaurant */
router.put('/:id_restaurant',auth,admin,upload.single('image'),(req,res)=>{
    const {id_restaurant} = req.params
    const image = (req.file.originalname)
    const{restaurant_name,description,longitude,latitude, user_id} = req.body
    const updated_on = new Date()
    mysql.execute(edit, [restaurant_name,description,image,longitude,latitude,user_id,updated_on,id_restaurant],(err,result,field)=>{
            res.send({succes:true,data:result})
            console.log(err)
        }
    ) 
})

module.exports = router
