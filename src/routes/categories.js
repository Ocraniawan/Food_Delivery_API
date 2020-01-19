require('dotenv').config()

const router = require('express').Router()
const mysql = require('../dbconfig')
const {auth,admin_restaurant} = require('../middleware')
const {add,edit,dlt,detail, all} = require('../model/categories')

/**Upload Foto/File */
const multer = require('multer')
const storage = multer.diskStorage({destination: function(req,file,cb){
    cb(null, './src/images/categories')
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



/**add categories */
router.post('/',auth,admin_restaurant,(req,res)=>{
    const {categories_name} = req.body
    const created_on = new Date()
    const updated_on = new Date()
    mysql.execute(add,[categories_name,created_on,updated_on], (err,result,field)=>{
        res.send({succes:true,data:result})
        console.log(err)
    })
})

/**edit categories */
router.put('/:id_categories', upload.single('image'),(req,res)=>{
    const {id_categories} = req.params
    const image = (req.file.originalname)
    const {categories_name} = req.body
    const updated_on = new Date()
    console.log(categories_name)
    mysql.execute(edit,[categories_name,image,updated_on,id_categories], (err,result,field)=>{
        res.send({succes:true,data:result})
        console.log(err)
    })
})


/**detail all categories */
router.get('/',(req,res)=>{

    mysql.execute(all,[], (err,result,field)=>{
        res.send({succes:true, data:result})
    })
})

/**detail categories */
router.get('/:id_categories',(req,res)=>{
    const {id_categories} =req.params
    mysql.execute(detail,[id_categories], (err,result,field)=>{
        res.send({succes:true,data:result})
    })
})


router.get('/detail/:id_categories',(req,res)=>{
    const {id_categories} =req.params
    const sql = `SELECT item.id_item, restaurant.id_restaurant, categories.id_categories, item.item_name, item.image, item.price, item.rating, item.description, restaurant.restaurant_name, categories.categories_name FROM item 
    INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
    INNER JOIN categories ON item.categories_id = categories.id_categories WHERE categories.id_categories=?`
    mysql.execute(sql,[id_categories], (err,result,field)=>{
        res.send({succes:true, data:result})
        console.log(err)
    })
})

/**delete categories */
router.delete('/:id_categories',auth,admin_restaurant,(req,res)=>{
    const {id_categories} = req.params
    mysql.execute(dlt,[id_categories], (err,result,field)=>{
        res.send({success:true,data:result})
    })
})


module.exports = router