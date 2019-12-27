const detail = 'SELECT * FROM restaurant WHERE id_restaurant=?'
const add = 'INSERT INTO restaurant (restaurant_name,description,image,longitude,latitude,user_id,created_on,updated_on) VALUES(?,?,?,?,?,?,?,?)'
const dlt = 'DELETE FROM restaurant WHERE id_restaurant=?'
const edit = 'UPDATE restaurant SET restaurant_name=?, description=?, image=?, longitude=?, latitude=?, user_id=?, updated_on=? WHERE id_restaurant=?'
module.exports = {detail,add,dlt,edit}
