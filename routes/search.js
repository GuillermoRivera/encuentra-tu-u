const express = require('express');
const router = express.Router();

/* GET search listing. */
router.get('/', function(req, res, next) {
  res.render('search', { title: 'Search page' })
});

module.exports = router;
