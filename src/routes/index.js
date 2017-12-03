const express = require('express');

const router = express.Router();

const Institution = require('../models/institution');
const Program = require('../models/program');

/* GET home page. */
router.get('/', (req, res) => {
  res.render('index', { title: 'Index' });
});

router.get('/institutions', (req, res) => {
  Institution.getInstitutions((error, data) => {
    if (error) throw error;
    res.json(data);
  });
});

router.get('/programs', (req, res) => {
  Program.getPrograms((error, data) => {
    if (error) throw error;
    res.json(data);
  });
});

module.exports = router;
