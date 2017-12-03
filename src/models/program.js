const pool = require('./connection');

const programModel = {};

programModel.getPrograms = (callback) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    connection.query(`SELECT * FROM programas ORDER BY nombre_prog`, (error, rows) => {
      callback(null, rows);
      connection.release();
      if (error) throw error;
    });
  });
};

module.exports = programModel;
