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

institutionModel.getInstitutionsByProgram = (program, callback) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    const query = `SELECT * 
    FROM instituciones i
    INNER JOIN facultad_institucion fi
    ON i.id_inst = fi.instituciones_id_inst
    INNER JOIN facultad_institucion_programa fip
    ON fi.instituciones_id_inst = fip.id_inst_pk AND fi.facultades_id_fac = fip.id_fac_pk
    INNER JOIN programas p
    ON p.id_prog = fip.id_prog_pk
    WHERE p.nombre_prog LIKE '${program}%';`;

    connection.query(query, (error, rows) => {
      callback(null, rows);
      connection.release();
      if (error) throw error;
    });
  });
};
module.exports = institutionModel;
