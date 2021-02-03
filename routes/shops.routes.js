const Routr = require('express');
const router = new Routr();
const shopController = require('../controllers/shops.controllers');

router.post('/shops', shopController.setShop);
router.get('/shops', shopController.getAllShops);
router.get('/shop/:id_shop', shopController.getCityShops);

module.exports = router;