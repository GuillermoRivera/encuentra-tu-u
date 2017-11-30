const mysql = require('mysql');

// connection to database
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'encuentra_tu_u',
});

const institutionModel = {};

institutionModel.getConnection = function getConnection() {
  connection.connect((err) => {
    if (err) throw err;
    console.log();
  });
  return 'Connected to database';
};

institutionModel.closeConnection = function closeConnection() {
  connection.end((error) => {
    if (error) throw error;
    console.log('Disconnected from database');
  });
  return 'Disconnected from database';
};

institutionModel.getInstitutions = (callback) => {
  if (institutionModel.getConnection() === 'Connected to database') {
    connection.query(`SELECT * FROM instituciones ORDER BY nombre_inst`, (error, rows) => {
      if (error) throw error;
      callback(null, rows);
    });
    institutionModel.closeConnection();
  }
};

// institutionModel.getInstitutionsByType = (callback, type) => {
//   if (connection) {
//     const a = `SELECT * FROM institution ORDER BY name WHERE type = ${type}`;
//     connection.query( (error, rows) => {
//       if (error) throw error;
//       callback(null, rows);
//     });
//   }
// };

module.exports = institutionModel;
