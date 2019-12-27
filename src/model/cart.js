const add = 'INSERT INTO carts (item_id,user_id,restaurant_id,created_on,updated_on) VALUES (?,?,?,?,?)'
const edit = 'UPDATE carts SET item_id=?, user_id=?,restaurant_id=?,updated_on=? WHERE id_carts=?'
const dlt = 'DELETE FROM carts WHERE id_carts=?'
const detail = `SELECT carts.id_carts, item.item_name, item.price,  user.username,  restaurant.restaurant_name FROM carts 
INNER JOIN item ON carts.item_id = item.id_item
INNER JOIN restaurant ON carts.restaurant_id = restaurant.id_restaurant
INNER JOIN user ON carts.user_id = user.id
 WHERE id_carts=?`


module.exports = {add, edit, dlt, detail}
