const db = require('../db');

class MealsControllers {

    async setShopFeedback(req, res) {
        const {id_shop, id_customer, description, rating} = req.body;
        const new_shop_feedback = await db.query('INSERT INTO test.feedbacks(id_shop, id_customer, description, rating) VALUES ($1, $2, $3, $4);', [id_shop, id_customer, description, rating]);
        res.json(new_shop_feedback.rows[0]);
    }

    async getShopFeedback(req, res) {
        const id_shop = req.params.id;
        const shop_feedback = await db.query('SELECT f.id_customer, description, rating, username FROM test.feedbacks f JOIN test.customers c ON c.id_customer = f.id_customer WHERE id_shop = ($1);', [id_shop]);
        res.json(shop_feedback.rows);
    }

    async setMealFeedback(req, res) {
        const {id_meal, id_customer, description, rating} = req.body;
        const new_meal_feedback = await db.query('INSERT INTO test.feedbacks(id_meal, id_customer, description, rating) VALUES ($1, $2, $3, $4);', [id_meal, id_customer, description, rating]);
        res.json(new_meal_feedback.rows[0]);
    }

    async getMealFeedback(req, res) {
        const id_meal = req.params.id;
        const meal_feedback = await db.query('SELECT f.id_customer, description, rating, username FROM test.feedbacks f JOIN test.customers c ON c.id_customer = f.id_customer WHERE id_meal = ($1);', [id_meal]);
        res.json(meal_feedback.rows);
    }


}

module.exports = new MealsControllers()