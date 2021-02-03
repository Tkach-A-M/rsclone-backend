const Routr = require('express');
const router = new Routr();
const mealController = require('../controllers/meals.controller');

router.post('/menu', mealController.setMeal);
router.get('/menu/types/all', mealController.getAllMealsTypes);
router.get('/menu/types/:id_city', mealController.getMealsTypes);
router.get('/menu/shop/:id_shop', mealController.getShopMenu)
router.get('/menu/selected', mealController.selectedMeals)
router.get('/menu/maxprice/all', mealController.getAllMaxPrices);
router.get('/menu/maxprice/:id', mealController.getMaxPrice);
router.get('/menu/maxtime/all', mealController.getAllMaxDeliveyTimes);
router.get('/menu/maxtime/:id_city', mealController.getMaxDeliveyTime);
router.get('/menu/meal/:id_meal', mealController.getMealInfo)

module.exports = router;