const Routr = require('express');
const router = new Routr();
const cityController = require('../controllers/cities.controllers');

router.post('/city', cityController.setCity)
router.get('/city', cityController.getCities);

module.exports = router;