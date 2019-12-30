require('dotenv').config()

const router = require('express').Router()
const mysql = require('../dbconfig')
const item = require('../model/item')


/**SEARCH */
router.get('/',(req,res)=>{
    const {name,price,rating} = req.query
    if(name){
        const sql = `SELECT * FROM item WHERE item_name LIKE '%${name}%' `
        mysql.execute(sql,[],(err,result,field)=>{
            res.send({succes:true, data:result})
            console.log(err)
        })
    }else if(price){
        const sql = `SELECT * FROM item WHERE price = '${price}'`
        mysql.execute(sql,[],(err,result,field)=>{
            res.send({succes:true, data:result})
            console.log(err)
        })
    }else if(rating){
        const sql = `SELECT * FROM item WHERE rating >= '${rating}'`
        mysql.execute(sql,[],(err,result,field)=>{
            res.send({succes:true, data:result})
        })
    }else if(name&&price){
        const sql = `SELECT * FROM item WHERE item_name LIKE '%${name}%' AND price = '${price}'`
        mysql.execute(sql,[],(err,result,field)=>{
            res.send({succes:true, data:result})
            console.log(err)
        })
    }else {
        res.send({
    succes:false, msg:'what are you looking for?'
        })
    }
})

/**SORT ASC*/
router.get('/sortasc',(req,res)=>{
    const {name,rating,price,date_update} = req.query
    if(name){
        const sql = `SELECT item.item_name, item.id_item,  item.price, item.rating, item.description, restaurant.restaurant_name, categories.categories_name FROM item 
        INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
        INNER JOIN categories ON item.categories_id = categories.id_categories        
        ORDER BY item_name ASC`
        mysql.execute(sql,[],(err,result,field)=>{
            res.send({succes:true, data:result})
            console.log(err)
        })
    }else if(rating){
        const sql = `SELECT item.rating, item.id_item, item.price, item.item_name, item.description, restaurant.restaurant_name, categories.categories_name FROM item 
        INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
        INNER JOIN categories ON item.categories_id = categories.id_categories  
        ORDER BY rating ASC`
        mysql.execute(sql,[],(err,result,field)=>{
            res.send({succes:true, data:result})
        })
    }else if(price){
        const sql = `SELECT item.price, item.id_item, item.item_name, item.rating, item.description, restaurant.restaurant_name, categories.categories_name FROM item 
        INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
        INNER JOIN categories ON item.categories_id = categories.id_categories 
        ORDER BY price ASC`
        mysql.execute(sql,[],(err,result,field)=>{
            res.send({succes:true, data:result})
        })
    }else if(date_update){
        const sql = `SELECT item.updated_on, item.id_item, item.price, item.item_name, item.rating, item.description, restaurant.restaurant_name, categories.categories_name FROM item 
        INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
        INNER JOIN categories ON item.categories_id = categories.id_categories 
        ORDER BY updated_on ASC`
        mysql.execute(sql,[],(err,result,field)=>{
            res.send({succes:true, data:result})
        })
    }else {
        res.send({
            succes:false, msg: 'Please, tell me What do you want?'
        })
    }
})


/**SORT DESC*/
router.get('/sortdesc',(req,res)=>{
    const {name,rating,price,date_update} = req.query
    if(name){
        const sql = `SELECT item.item_name, item.id_item, item.price, item.rating, item.description, restaurant.restaurant_name, categories.categories_name FROM item 
        INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
        INNER JOIN categories ON item.categories_id = categories.id_categories        
        ORDER BY item_name DESC`
        mysql.execute(sql,[],(err,result,field)=>{
            res.send({succes:true, data:result})
            console.log(err)
        })
    }else if(rating){
        const sql = `SELECT item.rating, item.id_item, item.price, item.item_name, item.description, restaurant.restaurant_name, categories.categories_name FROM item 
        INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
        INNER JOIN categories ON item.categories_id = categories.id_categories  
        ORDER BY rating DESC`
        mysql.execute(sql,[],(err,result,field)=>{
            res.send({succes:true, data:result})
        })
    }else if(price){
        const sql = `SELECT  item.price, item.id_item, item.item_name, item.rating, item.description, restaurant.restaurant_name, categories.categories_name FROM item 
        INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
        INNER JOIN categories ON item.categories_id = categories.id_categories 
        ORDER BY price DESC`
        mysql.execute(sql,[],(err,result,field)=>{
            res.send({succes:true, data:result})
        })
    }else if(date_update){
        const sql = `SELECT item.updated_on, item.id_item, item.price, item.item_name, item.rating, item.description, restaurant.restaurant_name, categories.categories_name FROM item 
        INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
        INNER JOIN categories ON item.categories_id = categories.id_categories 
        ORDER BY updated_on DESC`
        mysql.execute(sql,[],(err,result,field)=>{
            res.send({succes:true, data:result})
        })
    }else {
        res.send({
            succes:false, msg: 'Please, tell me What do you want?'
        })
    }
})


/**PAGINATION */
router.get('/page', (req,res)=>{
    const {page, limits} = req.query
    if (page == 1){
        const initial = page - 1
        const sql = `SELECT item.id_item, item.item_name, item.price, item.rating, item.description, restaurant.restaurant_name, categories.categories_name, item.image FROM item 
        INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
        INNER JOIN categories ON item.categories_id = categories.id_categories        
        ORDER BY item_name ASC LIMIT ${initial}, ${limits}`
    mysql.execute(sql, [], (err,result, field)=>{
        res.send(result)
        console.log(err)
    })
    }else if (page >= 2){
        const initial = page * limits - limits
        const sql =  `SELECT item.id_item, item.item_name, item.price, item.rating, item.description, restaurant.restaurant_name, categories.categories_name FROM item 
        INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
        INNER JOIN categories ON item.categories_id = categories.id_categories        
        ORDER BY item_name ASC LIMIT ${initial}, ${limits}`
    mysql.execute(sql, [], (err,result, field)=>{
        res.send(result)
    })
    }
})


// /**SEARCH AND SORT AND PAGINATION */
// router.get('/searchsort',(req,res)=>{
//     const {name}
// })


/**GET ALL DATA */
router.get('/all',(req,res)=>{
    const sql = `SELECT item.id_item, restaurant.id_restaurant, categories.id_categories, item.item_name, item.price, item.rating, item.description, restaurant.restaurant_name, categories.categories_name FROM item 
    INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
    INNER JOIN categories ON item.categories_id = categories.id_categories`
    mysql.execute(sql, [], (err,result, field)=>{
        res.send(result)
    })
})

module.exports = router