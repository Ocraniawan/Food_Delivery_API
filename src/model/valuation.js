const add = 'INSERT INTO valuation (rating,review,created_on,updated_on) VALUES(?,?,?,?)'
const detail = 'SELECT * FROM valuation WHERE id=?'


module.exports = {add,detail}