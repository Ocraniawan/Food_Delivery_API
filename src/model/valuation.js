const add = 'INSERT INTO valuation (rating,review,user_id,item_id,cart_id,created_on,updated_on) VALUES(?,?,?,?,?,?,?)'
const detail = `SELECT valuation.id, valuation.rating, valuation.review, item.item_name, item.price,  user.username FROM valuation 
INNER JOIN item ON valuation.item_id = item.id_item
INNER JOIN user ON valuation.user_id = user.id
 WHERE id=?`

// `SELECT valuation.id, item.item_name, valuation.rating, valuation.review, user.username FROM valuation
// INNER JOIN item ON valuation.item_id = item.id_item
// INNER JOIN user ON valuation.user_id = user.id
// WHERE id=?`



module.exports = {add,detail}