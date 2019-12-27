const add = 'INSERT INTO categories (name,created_on,updated_on) VALUE(?,?,?)'
const edit = 'UPDATE categories SET categories_name=?,updated_on=? where id_categories=? '
const detail = 'SELECT * FROM categories WHERE id_categories=?'
const dlt = 'DELETE FROM categories WHERE id_categories=?'

module.exports = {add,edit,detail,dlt}
