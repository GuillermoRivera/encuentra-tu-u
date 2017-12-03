const mysql = require('mysql');

// connection to database
const connection = mysql.createPool({
  connectionLimit: 10,
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'encuentra_tu_u',
});

module.exports = connection;
