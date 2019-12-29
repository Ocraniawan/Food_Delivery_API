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

/*ADD item*/
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
router.get('/:id_item',auth,(req,res)=>{
    const {id_item} = req.params
        mysql.execute(detail,[id_item], (err, result,field)=>{
            const category = result[0].categories_name
            console.log(err)
            const sql = `SELECT item.id_item, item.item_name, item.price, item.description, item.rating, categories.categories_name, restaurant.restaurant_name, item.image FROM item
            INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
            INNER JOIN categories ON item.categories_id = categories.id_categories
            WHERE  categories.categories_name LIKE ?`
            mysql.execute(sql,['%'+category+'%'],(err, result1,field)=>{
                res.send({success:true, data:result, suggess:result1})
            })
        })
})


/**SHOWCASE */
router.get('/showcase/:item_name',auth,(req,res)=>{
    const {item_name} = req.params
    const sql = `SELECT item.id_item, item.item_name, item.price, item.description, item.rating, categories.categories_name, restaurant.restaurant_name, item.image FROM item
        INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
        INNER JOIN categories ON item.categories_id = categories.id_categories
        WHERE item_name= ?`
    mysql.execute(sql,[item_name],(err,result,field)=>{
        const category = result[0].categories_name
        const sql = `SELECT item.id_item, item.item_name, item.price, item.description, item.rating, categories.categories_name, restaurant.restaurant_name, item.image FROM item
        INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
        INNER JOIN categories ON item.categories_id = categories.id_categories
        WHERE  categories.categories_name LIKE ?`
        mysql.execute(sql,['%'+category+'%'],(err, result1,field)=>{
            res.send({success:true, data:result, suggess:result1})
        })

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
    const{item_name,categories_id,price,description} = req.body
    const updated_on = new Date()
    mysql.execute(
        edit, [item_name,categories_id,price,description,image,updated_on,id_item],(err,result,field)=>{
            res.send({succes:true,data:result})
            console.log(err)
        }
    ) 
})

module.exports = router
