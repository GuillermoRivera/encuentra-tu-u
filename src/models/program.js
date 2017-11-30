const mysql = require('mysql');

// connection to database
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'encuentra_tu_u',
});

const programModel = {};

programModel.getConnection = function getConnection() {
  connection.connect((err) => {
    if (err) throw err;
    console.log();
  });
  return 'Connected to database';
};

programModel.closeConnection = function closeConnection() {
  connection.end((error) => {
    if (error) throw error;
    console.log('Disconnected from database');
  });
  return 'Disconnected from database';
};

programModel.getPrograms = (callback) => {
  if (programModel.getConnection() === 'Connected to database') {
    connection.query(`SELECT * FROM programas ORDER BY nombre_prog`, (error, rows) => {
      if (error) throw error;
      callback(null, rows);
    });
    programModel.closeConnection();
  }
};

module.exports = programModel;
