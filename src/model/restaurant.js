const detail = 'SELECT * FROM restaurant WHERE id=?'
const add = 'INSERT INTO restaurant (name,description,image,longitude,latitude,user_id,created_on,updated_on) VALUES(?,?,?,?,?,?,?,?)'
const dlt = 'DELETE FROM restaurant WHERE id=?'
const edit = 'UPDATE restaurant SET name=?, description=?, image=?, longitude=?, latitude=?, user_id=?, updated_on=? WHERE id=?'
module.exports = {detail,add,dlt,edit}
