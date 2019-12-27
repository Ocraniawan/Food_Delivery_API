const login = 'SELECT * FROM user WHERE username=?'
const detail = 'SELECT * FROM user WHERE id=?'
const add = 'INSERT INTO user (name,username,password,role_id,created_on,updated_on) VALUES(?,?,?,?,?,?)'
const dlt = 'DELETE FROM user WHERE id=?'
const edit = 'UPDATE user SET name=?, username=?, password=?, role_id=?, updated_on=? WHERE id=?'


module.exports = {login,detail,add,dlt,edit}
