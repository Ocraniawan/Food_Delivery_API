const detail = 'SELECT * FROM item WHERE id=?'
const add = 'INSERT INTO item (name,categories_id,price,description,image,created_on,updated_on) VALUES(?,?,?,?,?,?,?)'
const dlt = 'DELETE FROM item WHERE id=?'
const edit = 'UPDATE item SET name=?, categories_id=?, price=?, description=?, image=?, updated_on=? WHERE id=?'
module.exports = {detail,add,dlt,edit}
