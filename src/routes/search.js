const express = require('express');

const Institution = require('../models/institution');
const Program = require('../models/program');

const router = express.Router();

/* GET search listing. */
router.get('/', (req, res) => {
  if (req.query.type === 'institution') {

    Program.getProgramsByInstitution(req.query.name, (error, data) => {
      if (error) throw error;
      if (data && data.length) {
        res.render('search', { title: `Programas de educación superior en ${data[0].nombre_inst}`, data, tipo: req.query.type });
      } else {
        res.render('error', { error });
      }
    });
  } else if (req.query.type === 'program') {
    Institution.getInstitutionsByProgram(req.query.name, (error, data) => {
      if (error) throw error;
      if (data && data.length) {
        res.render('search', { title: `${data[0].nombre_prog} en instituciones de Medellín`, data, tipo: req.query.type });
      } else {
        res.render('error', { error });
      }
    });
  } else {
    return new Error('Lo sentimos, criterio de búsqueda inválido');
  }
});

module.exports = router;
