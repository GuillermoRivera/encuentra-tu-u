const mysql = require('mysql');

// connection to database
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'encuentra_tu_u',
});

const institutionModel = {};

institutionModel.getInstitutions = (callback) => {
  if (connection) {
    connection.query(`SELECT * FROM institution ORDER BY name`, (error, rows) => {
      if (error) throw error;
      callback(null, rows);
    });
  }
};

institutionModel.getInstitutionsByType = (callback, type) => {
  if (connection) {
    connection.query(`SELECT * FROM institution ORDER BY name WHERE type = ${type}`, (error, rows) => {
      if (error) throw error;
      callback(null, rows);
    });
  }
};

module.exports = institutionModel;
