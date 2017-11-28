const express = require('express');

const router = express.Router();

const Institution = require('../models/institution');
const Program = require('../models/program');

/* GET home page. */
router.get('/', (req, res) => {
  Institution.getInstitutions((error, data) => {
    if (error) throw error;
    // console.log(data);
    res.render('index', { title: 'Index', data });
  });
});

router.get('/institutions', (req, res) => {
  Institution.getInstitutions((error, data) => {
    if (error) throw error;
    res.send(JSON.stringify(data));
  });
});

router.get('/programs', (req, res) => {
  Program.getPrograms((error, data) => {
    if (error) throw error;
    res.send(JSON.stringify(data));
  });
});

module.exports = router;
