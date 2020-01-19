const add = 'INSERT INTO carts (item_id,user_id,quantity,created_on,updated_on) VALUES (?,?,?,?,?)'
const edit = 'UPDATE carts SET item_id=?, user_id=?,restaurant_id=?,updated_on=? WHERE id_carts=?'
const dlt = 'DELETE FROM carts WHERE id_carts=?'
const detail = `SELECT carts.id_carts, carts.item_id, item.item_name, item.price, item.image, carts.quantity, item.rating FROM carts 
INNER JOIN item ON carts.item_id = item.id_item
INNER JOIN user ON carts.user_id = user.id
 WHERE user.id=?`


module.exports = {add, edit, dlt, detail}
