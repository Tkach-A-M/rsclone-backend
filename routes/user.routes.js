const Routr = require('express');
const router = new Routr();
const userController = require('../controllers/user.controllers');

router.post('/register', userController.userCreate);
router.post('/login', userController.userLogin);
router.put('/user', userController.userChangePassword);
router.put('/user', userController.userChangeName);

module.exports = router;