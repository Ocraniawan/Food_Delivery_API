const add = 'INSERT INTO categories (categories_name, image,created_on,updated_on) VALUE(?,?,?,?)'
const edit = 'UPDATE categories SET categories_name=?, image=?, updated_on=? where id_categories=? '
const detail = 'SELECT categories_name, image FROM categories WHERE id_categories=?'
const all = 'SELECT * FROM categories'
const dlt = 'DELETE FROM categories WHERE id_categories=?'

module.exports = {add,edit,detail,dlt, all}
