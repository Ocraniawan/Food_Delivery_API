const add = 'INSERT INTO valuation (rating,review,user_id,item_id,cart_id,created_on,updated_on) VALUES(?,?,?,?,?,?,?)'
const detail = 'SELECT * FROM valuation WHERE id=?'


module.exports = {add,detail}