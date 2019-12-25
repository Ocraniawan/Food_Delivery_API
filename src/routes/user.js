require('dotenv').config()

const router = require('express').Router()
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')
const mysql = require('../dbconfig')
const {auth} = require('../middleware')
const {login,detail,add,dlt,edit}= require('../model/user')


/*Log In*/
router.post('/login',(req,res)=>{
    const {username,password} = req.body
 
    mysql.execute(login,[username],(err,result,field)=>{
        if(result.length>0){
            if(bcrypt.compareSync(password,result[0].password)){
            const auth = jwt.sign({username},process.env.APP_KEY)
            res.send({
                succes: true,
                auth
            })
            }else{
                res.send({
                    succes:false,
                    msg : "Incorret Password"
                })
            }
        }else{
            res.send({
                succes:false,
                msg : "Username Not Found"
            })
        }
    })
})

/*tambah data*/
router.post('/',auth,(req,res)=>{
    const {name, username, password, role_id} = req.body
    const enc_pass = bcrypt.hashSync(password)
    const created_on = new Date()
    const updated_on = new Date()

    mysql.execute(
        add, [name,username,enc_pass,role_id,created_on,updated_on],
        (err,result,field)=>{
            res.send(result)
        }
    )
})

/* mengambil data */
router.get('/:id',auth,(req,res)=>{
    const {id} = req.params

        mysql.execute(detail,[id], (err, result,field)=>{
            res.send({succes:true,data:result[0]})
        })
})

/** delete user */
router.delete('/:id',auth,(req,res)=>{
    const {id} = req.params
    mysql.execute(dlt,[id], (err,result,field)=>{
        res.send({succes:true,data:result})
        console.log(err)
    })
})

/**edit user */
router.put('/:id',auth,(req,res)=>{
    const {id} = req.params
    const{name,username,password,role_id} = req.body
    const enc_pass = bcrypt.hashSync(password)
    const updated_on = new Date()

    mysql.execute(
        edit,[name,username,enc_pass,role_id,updated_on,id],(err,result,field)=>{
            res.send({succes:true,data:result})
            console.log(err)
        }
    ) 
})

module.exports = router