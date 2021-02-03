const Routr = require('express');
const router = new Routr();
const feedbackController = require('../controllers/feedbacks.controller');

router.post('/feedback/shop/', feedbackController.setShopFeedback);
router.get('/feedback/shop/:id', feedbackController.getShopFeedback);

router.post('/feedback/meal/', feedbackController.setMealFeedback);
router.get('/feedback/meal/:id', feedbackController.getMealFeedback);

module.exports = router;