const pool = require('./connection');

const institutionModel = {};

institutionModel.getInstitutions = (callback) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log('Connected to database');
    connection.query(`SELECT * FROM instituciones ORDER BY nombre_inst`, (err, rows) => {
      callback(null, rows);
      connection.release();
      if (err) throw err;
    });
  });
};

module.exports = institutionModel;
