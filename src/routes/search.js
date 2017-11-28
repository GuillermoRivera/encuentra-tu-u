const express = require('express');

const router = express.Router();

/* GET search listing. */
router.get('/', (req, res) => {
  res.render('search', { title: 'Search page' });
});

module.exports = router;
