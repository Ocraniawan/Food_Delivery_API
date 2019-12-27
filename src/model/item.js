const add = 'INSERT INTO item (item_name,categories_id,restaurant_id,price,description,image,created_on,updated_on) VALUES(?,?,?,?,?,?,?,?)'
const dlt = 'DELETE FROM item WHERE id_item=?'
const edit = 'UPDATE item SET item_name=?, categories_id=?, restaurant_id=?, price=?, description=?, image=?, updated_on=? WHERE id_item=?'
const detail = 'SELECT  FROM item WHERE id_item=?'
module.exports = {detail,add,dlt,edit}
