const add = 'INSERT INTO categories (name,created_on,updated_on) VALUE(?,?,?)'
const edit = 'UPDATE categories SET name=?,updated_on=? where id=? '
const detail = 'SELECT * FROM categories WHERE id=?'
const dlt = 'DELETE FROM categories WHERE id=?'

module.exports = {add,edit,detail,dlt}
