const add = 'INSERT INTO item (item_name,categories_id,restaurant_id,price,description,image,created_on,updated_on) VALUES(?,?,?,?,?,?,?,?)'
const dlt = 'DELETE FROM item WHERE id_item=?'
const edit = 'UPDATE item SET item_name=?, categories_id=?, price=?, description=?, image=?, updated_on=? WHERE id_item=?'
const detail = `SELECT item.id_item, item.item_name, item.price, item.rating, item.description, restaurant.restaurant_name, categories.categories_name, item.image FROM item 
INNER JOIN restaurant ON item.restaurant_id = restaurant.id_restaurant
INNER JOIN categories ON item.categories_id = categories.id_categories
 WHERE id_item=?`
module.exports = {detail,add,dlt,edit}
