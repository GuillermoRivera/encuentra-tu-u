const pool = require('./connection');

const programModel = {};

programModel.getPrograms = (callback) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log('Connected to database');
    connection.query(`SELECT * FROM programas ORDER BY nombre_prog`, (error, rows) => {
      callback(null, rows);
      connection.release();
      if (error) throw error;
    });
  });
};

programModel.getProgramsByInstitution = (institution, callback) => {
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
    WHERE i.nombre_inst LIKE '${institution}%';`;

    connection.query(query, (error, rows) => {
      callback(null, rows);
      connection.release();
      if (error) throw error;
    });
  });
};

module.exports = programModel;
