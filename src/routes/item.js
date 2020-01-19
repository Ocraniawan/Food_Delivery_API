require('dotenv').config()

const router = require('express').Router()
const mysql = require('../dbconfig')
const {auth, restaurant} = require('../middleware')
const {detail,add,dlt,edit}= require('../model/item')

const url = `http://localhost:8080/item/`


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

/**GET ALL DATA */
// router.get('/',(req,res)=>{
//     const sql = `SELECT item.id_item, restaurant.id_restaurant, categories.id_categories, item.item_name, item.image, item.price, item.rating, item.description, restaurant.restaurant_name, categories.categories_name FROM item 
//     INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
//     INNER JOIN categories ON item.categories_id = categories.id_categories ORDER BY item_name ASC`
//     mysql.execute(sql, [], (err,result, field)=>{
//         res.send({data:result})
//     })
// })


/**GET ITEM WITH SEARCH SORT PAGE */
router.get('/', (req, res) => {

    const query = req.query
    let where = ''
    let sort = ''
    let page = 'LIMIT 12 OFFSET 0'
    let full_url = ''

    if (query.search) {
        let count = 1
        where += `WHERE`
        Object.keys(query.search).forEach(key => {
            if (Object.keys(query.search).length === 1) {
                where += ` item.${key} LIKE '%${query.search[key]}%'`
                full_url += `search[${key}]=${query.search[key]}&`
                count++
            } else if (Object.keys(query.search).length === count) {
                where += ` item.${key} LIKE '%${query.search[key]}%'`
                full_url += `search[${key}]=${query.search[key]}&`
                count++
            }
            else {
                where += ` item.${key} LIKE '%${query.search[key]}%' AND`
                full_url += `search[${key}]=${query.search[key]}&`
                count++
            }
        });
    }

    if (query.sort) {
        if (Object.keys(query.sort).length === 1) {
            sort += `ORDER BY`
            Object.keys(query.sort).forEach(key => {
                sort += ` item.${key} ${query.sort[key]}`
                full_url += `sort[${key}]=${query.sort[key]}&`
            });
        }
    }

    if (query.page) {
        const offset = (Number(query.page) * 12) - 12
        page = `LIMIT 12 OFFSET ${offset}`
        full_url += `page=${query.page}&`
    } else {
        query.page = 1
    }

    let sql1 = `SELECT COUNT(*) AS result FROM item`

    let sql2 = `SELECT item.id_item, item.item_name, item.price, item.rating, item.description, restaurant.restaurant_name, categories.categories_name, item.image FROM item 
    INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
    INNER JOIN categories ON item.categories_id = categories.id_categories ORDER BY item_name ASC ${where} ${sort} ${page}`

    mysql.execute(sql1, (err, result, field) => {
        if (err) {
            console.log(err)
            res.send({
                status: 400,
                msg: err,
            })
        } else if (result.length === 0) {
            res.send({
                status: 400,
                msg: "No data retrieved!",
            })
        } else {
            mysql.execute(sql2, (err2, res2, fie2) => {
                if (err2) {
                    console.log(err2)
                    res.send({
    
                        status: 400,
                        msg: err2,
                    })
                } else if (res2.length === 0) {
                    res.send({
    
                        status: 400,
                        msg: "No data retrieved!",
                    })
                } else {

                    let prev = ''
                    let next = ''

                    let noPage = full_url.replace(/page=[0-9\.]+&/g, '')

                    prev = `${url}?${noPage}page=${Number(query.page) - 1}`
                    next = `${url}?${noPage}page=${Number(query.page) + 1}`

                    if (Number(query.page) === Math.ceil(Number(result[0].result) / 12)) {
                        prev = `${url}?${noPage}page=${Number(query.page) - 1}`
                        next = ``
                    } else if (query.page <= 1) {
                        prev = ``
                        next = `${url}?${noPage}page=${Number(query.page) + 1}`
                    }

                    res.send({
                        status: 200,
                        info: {
                            count: result[0].result,
                            pages: Math.ceil(Number(result[0].result) / 12),
                            current: `${url}items?${full_url}`,
                            next: next,
                            previous: prev
                        },
                        data: res2
                    })
                }
            })
        }
    })
});




// /**PAGINATION */
// router.get('/page', (req,res)=>{
//     const {page, limits} = req.query
//     if (page == 1){
//         const initial = page - 1
//         const prev = parseInt(page) - 1
//         const next = parseInt(page) + 1
//         const sql = `SELECT item.id_item, item.item_name, item.price, item.rating, item.description, restaurant.restaurant_name, categories.categories_name, item.image FROM item 
//         INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
//         INNER JOIN categories ON item.categories_id = categories.id_categories        
//         ORDER BY item_name ASC LIMIT ${initial}, ${limits}`
//     mysql.execute(sql, [], (err,result, field)=>{
//         res.send ({success:true, data:result,
//                     next : `http://localhost:8080/item/page?page=${next}&limits=12` ,
//                     prev : `http://localhost:8080/item/page?page=${prev}&limits=12`            
//         })
//         console.log(err)
//     })
//     }else if (page >= 2){
//         const initial = page * limits - limits
//         const prev = parseInt(page) - 1
//         const next = parseInt(page) + 1
//         const sql =  `SELECT item.id_item, item.item_name, item.price, item.rating, item.description, restaurant.restaurant_name, categories.categories_name, item.image FROM item 
//         INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
//         INNER JOIN categories ON item.categories_id = categories.id_categories        
//         ORDER BY item_name ASC LIMIT ${initial}, ${limits}`
//     mysql.execute(sql, [], (err,result, field)=>{
//         res.send({success:true, data:result,
//             next : `http://localhost:8080/item/page?page=${next}&limits=12`,
//             prev : `http://localhost:8080/item/page?page=${prev}&limits=12`            
//         })
//     })
//     }
// })


/**------------------------------------------------------------ */

router.get(["", "/search"], (req, res) => {
    let { page, order, name, price, rating, limit, byRestaurant, asc } = req.query;
  
    name = name ? ` item.item_name LIKE "%${name}%" ` : `item.item_name LIKE "%%"`;
    price = price ? ` AND item.price= "${price}"` : "";
    rating = rating ? ` AND item.rating=ROUND(${rating},0) ` : "";
    byRestaurant = byRestaurant ? ` AND id_restaurant=${byRestaurant} ` : "";
    order = order ? "item." + order : "id_restaurant";
    // const AND = condition => (condition ? "" : "");
    let where = name || price || rating ? "WHERE" : "";
    page = parseInt(page) || 1;
    limit = parseInt(limit) || 10;
    asc = asc || "ASC";

    // "SELECT * FROM item WHERE id_restaurant=?";
  const sql = `SELECT item.id_item, item.item_name, item.price, item.description, item.rating, categories.categories_name, restaurant.restaurant_name, item.image FROM item
        INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
        INNER JOIN categories ON item.categories_id = categories.id_categories
  ${where} ${name} ${price} ${rating} ${byRestaurant}
  ORDER BY ${order} ${asc} LIMIT ${limit} OFFSET ${page * limit - limit}`;

  const pagequery = { current_page: page, limit, 
    link:req.get('host')+req.originalUrl, query: req.query }

  mysql.execute(sql, [], (err, result,field)=>{
    res.send({success:true, data:result})
    console.log(err)
  });
});


/**SEARCH */
router.get('/search',(req,res)=>{
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
    }else if(name&&price&&rating){
        const sql = `SELECT * FROM item WHERE item_name LIKE '%${name}%' price = '${price}' rating >= '${rating}'`
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






/* detail item */
router.get('/:id_item',(req,res)=>{
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


/** delete item */
router.delete('/:id_item',auth,restaurant,(req,res)=>{
    const {id_item} = req.params
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
