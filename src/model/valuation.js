const add = 'INSERT INTO valuation (rating,review,user_id,item_id,created_on,updated_on)'
const detail = `SELECT valuation.valuation_id, item.item_name, valuation.rating, valuation.review, item.price,  user.username FROM valuation 
INNER JOIN item ON valuation.item_id = item.id_item
INNER JOIN user ON valuation.user_id = user.id
 WHERE item_id=? order by valuation_id ASC LIMIT 4`


module.exports = {add,detail}