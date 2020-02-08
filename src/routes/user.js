require('dotenv').config()

const router = require('express').Router()
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')
const mysql = require('../dbconfig')
const {auth, admin, restaurant, client} = require('../middleware')
const {login,detail,add,dlt,edit}= require('../model/user')


/*Log In*/
router.post('/login',(req,res)=>{
    const {username,password} = req.body
 
    mysql.execute(login,[username],(err,result,field)=>{
        if(result.length>0){
            if(bcrypt.compareSync(password,result[0].password)){
            const id_user = result[0].id
            const roles = result[0].role_id
            const auth = jwt.sign({username, id_user, roles},process.env.APP_KEY)
            const token = auth
            const is_revoked = 0
            const created_on = new Date()
            const updated_on = new Date()
            const revoked = `INSERT INTO revoked_token (token,is_revoked,created_on,updated_on) VALUES (?,?,?,?)`
            mysql.execute(revoked,[token,is_revoked,created_on,updated_on], (err,result,field)=>{
            res.send({
                succes: true,
                auth
            })
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


/**Log Out */
router.get('/logout',auth,(req,res)=>{
    const token = req.headers.auth_token
    const sql = 'UPDATE revoked_token SET is_revoked=? WHERE token=?'
    mysql.execute(sql, [1, token],(err,result,field)=>{
        res.send({ 
            success: true, data:result, msg: "Log Out Success"
        })
        console.log(err)
    })
})

/**CLIENT REGISTER */
router.post('/registuser',(req,res)=>{
    const {name, username, password} = req.body
    const role_id = 3
    const enc_pass = bcrypt.hashSync(password)
    const created_on = new Date()
    const updated_on = new Date()

    const check = 'SELECT * FROM user WHERE username=?'
    mysql.execute(check, [username], (err1, res1, field1) => {
        if (err1) {
            console.log(err1)
            res.send({
                status: 400,
                msg: err1,
            })
        } else if (res1.length === 0) {
            const sql = 'INSERT INTO user(name, username, password, role_id, created_on, updated_on) VALUES (?,?,?,?,?,?)'
            mysql.execute(sql, [name,username,enc_pass,role_id,created_on,updated_on], (err, result) => {
                if (err) {
                    console.log(err)
                } else {
                    res.send({ succsess: true, data: result })
                }
            })
        }
        else {
            res.send({
                status: 400,
                msg: 'Username already used.',
            })
        }
    })
})

// })

router.put('/forgotpassword', (req, res) => {
    const {username, password} = req.body
    const updated_on = new Date()
    const enc_pass = bcrypt.hashSync(password)
    const sql = `UPDATE user SET password = ?, updated_on = ? where username = ?`
    mysql.execute(sql, [enc_pass, username, updated_on], (err, result, field) => {
        res.send({succcess: true, data: result})
    })
})

/*Add User*/
router.post('/',auth,admin,(req,res)=>{
    const {name, username, password, role_id} = req.body
    const enc_pass = bcrypt.hashSync(password)
    const created_on = new Date()
    const updated_on = new Date()

    mysql.execute(
        add, [name,username,enc_pass,role_id,created_on,updated_on],
        (err,result,field)=>{
            res.send(result)
            console.log(err)
        }
    )
})


/**RESTAURANT REGISTER */
router.post('/registrest',restaurant,(req,res)=>{
    const {name, username, password} = req.body
    const role_id = 2
    const enc_pass = bcrypt.hashSync(password)
    const created_on = new Date()
    const updated_on = new Date()

    const sql = 'INSERT INTO user(name, username, password, role_id, created_on, updated_on) VALUES (?,?,?,?,?,?)'
    mysql.execute(sql,[name,username,enc_pass,role_id,created_on,updated_on], (err,result)=>{
        res.send({succsess:true, data:result})
    })
})

/* detail user */
router.get('/:id',(req,res)=>{
    const {id} = req.params

        mysql.execute(detail,[id], (err, result,field)=>{
            res.send({succes:true,data:result[0]})
        })
})

/** delete user */
router.delete('/:id',auth,admin,(req,res)=>{
    const {id} = req.params
    mysql.execute(dlt,[id], (err,result,field)=>{
        res.send({succes:true,data:result})
        console.log(err)
    })
})

/**edit user */
router.put('/:id',auth,admin,(req,res)=>{
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