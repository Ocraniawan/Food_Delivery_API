const jwt = require('jsonwebtoken')

const auth = (req,res,next)=>{
    if(
        req.headers['authorization'] &&
        req.headers['authorization'].startsWith('Bearer')
        ){
            const jwt_token = req.headers['authorization'].substr(7)
            try{
                const user = jwt.verify(jwt_token,process.env.APP_KEY)
                next()
            }catch(e){
                res.send({succes:false,msg:e})
            }
        }else{
            res.send({succes:false,msg:'You Must be Log In First'})
        }

}

const all = (req,res,next)=>{
    if(
        req.headers['roles'] === '1' || req.headers['roles'] === '2' || req.headers['roles'] === '3'
    ){
        next()
    }else{
        res.send({succes:false, msg: 'You are not be able to access this!'})
    }
}

const admin = (req,res,next)=>{
    if(
        req.headers['roles'] === '1'
    ){
        next()
    }else{
        res.send({succes:false, msg: 'You are not be able to access this!'})
    }
}

const restaurant = (req,res,next)=>{
    if(
        req.headers['roles'] === '2'
    ){
        next()
    }else{
        res.send({succes:false, msg: 'You are not be able to access this!'})
    }
}

const client = (req,res,next)=>{
    if(
        req.headers['roles'] === '3'
    ){
        next()
    }else{
        res.send({succes:false, msg: 'You are not be able to access this!'})   
    }
}

const admin_restaurant = (req,res,next)=>{
    if(
        req.headers['roles'] === '1' || req.headers['roles'] === '2'
    ){
        next()
    }else{
        res.send({succes:false, msg: 'You are not be able to access this!'})
    }
}


module.exports = {auth, all, admin, restaurant, admin_restaurant, client}