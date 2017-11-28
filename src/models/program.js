const mysql = require('mysql');

// connection to database
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'encuentra_tu_u',
});

const programModel = {};

programModel.getPrograms = (callback) => {
  if (connection) {
    connection.query(`SELECT * FROM program ORDER BY name`, (error, rows) => {
      if (error) throw error;
      callback(null, rows);
    });
  }
};

module.exports = programModel;
