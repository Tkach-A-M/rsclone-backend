const db = require('../db');
class MealsControllers {

    async setMeal(req, res){
        
        res.json(newShop.rows[0]);
    }

    async getAllMealsTypes(req, res) {
        const types = await db.query('SELECT DISTINCT meal_type FROM test.menu WHERE in_menu = true')
        res.json(types.rows);
    }

    async getMealsTypes(req, res){
        const id_city = req.params.id_city;
        console.log(id_city);
        const types = await db.query('SELECT DISTINCT meal_type FROM test.menu m JOIN test.shop_to_menu stm ON stm.id_menu = m.id_menu JOIN test.shop_info si ON stm.id_shop = si.city_id WHERE in_menu = true AND city_id = ($1)', [id_city]);
        res.json(types.rows);
    }

    async getShopMenu(req, res){
        const id_shop = req.params.id_shop;
        const shop_menu = await db.query('SELECT id_shop, id_meal, meal_name, meal_type, meal_ingrids, meal_desc, image, price FROM test.menu m JOIN test.shop_to_menu stm ON m.id_menu = stm.id_menu WHERE stm.id_shop = ($1)', [id_shop]);
        res.json(shop_menu.rows);
    }


    //выбор блюда по фильтрам
    async selectedMeals(req, res){
        const { selectedType, selectedPrice, selectedTime, inputString } = req.body;
        const selectedMeals = await db.query(`SELECT id_shop, id_meal, meal_name, meal_type, meal_ingrids, meal_desc, image, price FROM test.menu m JOIN test.shop_to_menu stm ON m.id_menu = stm.id_menu WHERE stm.id_shop = ($1)`, [id_shop]);
        res.json(selectedMeals.rows);
    }

    //запрос на максимальную цену блюда среди всех
    async getAllMaxPrices(req, res){
        const maxPriceAll = await db.query('SELECT max(price) FROM test.menu');
        res.json(maxPriceAll.rows[0].max);
    }

    //запрос на максимальную цену блюда по городу
    async getMaxPrice(req, res){
        const id_city = req.params.id;
        const maxPriceCity = await db.query('SELECT max(m.price) FROM test.menu m JOIN test.shop_to_menu stm ON m.id_menu = stm.id_menu JOIN test.shop_info si ON si.id_shop = stm.id_shop WHERE si.city_id = ($1);', [id_city]);
        res.json(maxPriceCity.rows[0].max);
    }

    //запрос на максимальное время доставки среди всех
    async getAllMaxDeliveyTimes(req, res){
        const maxDeliveryTimeAll = await db.query('SELECT max(waiting_time) FROM test.shop_info');
        res.json(maxDeliveryTimeAll.rows[0].max);
    }

    //запрос на максимальное время доставки по городу
    async getMaxDeliveyTime(req, res){
        const city_id = req.params.id_city;
        const maxDeliveryTimeCity = await db.query('SELECT max(waiting_time) FROM test.shop_info WHERE city_id = ($1)', [city_id]);
        res.json(maxDeliveryTimeCity.rows[0].max);
    }

    async getMealInfo(req, res){
        const meal_id = req.params.id_meal;
        const mealInfo = await db.query('SELECT meal_name, meal_type, meal_ingrids, meal_desc, image, price FROM test.menu WHERE id_meal = ($1)', [meal_id]);
        res.json(mealInfo.rows);
    }
}

module.exports = new MealsControllers()