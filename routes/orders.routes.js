const Routr = require('express');
const router = new Routr();
const orderController = require('../controllers/order.controller');

router.post('/order/add', orderController.addOrder);
router.get('/order/get/:id', orderController.getOrders);

module.exports = router;