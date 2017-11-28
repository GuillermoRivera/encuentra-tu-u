const express = require('express');
const router = express.Router();

const Institution = require('../models/institution');
const Program = require('../models/program');

/* GET home page. */
router.get('/', function(req, res, next) {
  Institution.getInstitutions((error, data) => {
    if (error) throw error;
    console.log(data);
    res.render('index', { title: 'Index', data });
  })
});

router.get('/institutions', function(req, res, next) {
  Institution.getInstitutions((error, data) => {
    if (error) throw error;
    res.send(JSON.stringify(data));
  })
});

router.get('/programs', function(req, res, next) {
  Program.getPrograms((error, data) => {
    if (error) throw error;
    res.send(JSON.stringify(data));
  })
});

module.exports = router;
