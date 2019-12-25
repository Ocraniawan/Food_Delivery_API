const add = 'INSERT INTO carts (item_id,user_id,restaurant_id,created_on,updated_on) VALUES (?,?,?,?,?)'
const edit = 'UPDATE carts SET item_id=?, user_id=?,restaurant_id=?,updated_on=? WHERE id=?'
const dlt = 'DELETE FROM carts WHERE id=?'
const detail = 'SELECT * FROM carts WHERE id=?'

module.exports = {add, edit, dlt, detail}
