const db = require('../db');
class ShopsControllers {

    async setShop(req, res){
        const {shop_name, city_id, waiting_time, shop_description} = req.body;
        const newShop = await db.query('INSERT INTO test.shop_info(shop_name, city_id, waiting_time, shop_description) VALUES ($1, $2, $3, $4);RETURNING *', [shop_name, city_id, waiting_time, shop_description]);
        res.json(newShop.rows[0]);
    }

    async getAllShops(req, res){
        const shops = await db.query('WITH rez as (\n' +
            'SELECT id_shop, shop_name\n' +
            '\t, shop_description\n' +
            '\t, waiting_time\n' +
            '\t, (SELECT min(price) \n' +
            '\t   \t\tFROM test.menu m\n' +
            '\t\t\tJOIN test.shop_to_menu sm ON m.id_menu = sm.id_shop\n' +
            '\t\t\tWHERE si.id_shop = sm.id_shop) || \' p.\' AS "min_price"\n' +
            '\t, case when (NOW()::TIME > c.time_start AND NOW()::TIME < c.time_end) then \'Открыто\'\n' +
            '\telse \'Закрыто\'\n' +
            'END as "shop_status"\n' +
            '\t, (SELECT (sum(rating)::real / count(f.id_shop))::real\n' +
            '\t  FROM test.feedbacks f\n' +
            '\t  WHERE f.id_shop = si.id_shop) as  "rating" \n' +
            '\t, c.number_of_day as "number_of_day"\n' +
            'FROM test.shop_info si\n' +
            'LEFT JOIN test.calendar_to_shop cs ON si.id_shop = cs.id_shop\n' +
            'LEFT JOIN test.calendar c ON c.id_calendar = cs.id_calendar\n' +
            '\t)\n' +
            '\n' +
            'SELECT *  FROM rez\n' +
            'WHERE EXTRACT (DOW FROM NOW()) = number_of_day;');
        
        res.json(shops.rows);

    }

    async getCityShops(req, res){
        const city_id = req.params.id_shop;
    
        const cityShops = await db.query('WITH rez as (\n' +
            'SELECT id_shop, shop_name\n' +
            '\t, shop_description\n' +
            '\t, waiting_time\n' +
            '\t, (SELECT min(price) \n' +
            '\t   \t\tFROM test.menu m\n' +
            '\t\t\tJOIN test.shop_to_menu sm ON m.id_menu = sm.id_shop\n' +
            '\t\t\tWHERE si.id_shop = sm.id_shop) || \' p.\' AS "min_price"\n' +
            '\t, case when (NOW()::TIME > c.time_start AND NOW()::TIME < c.time_end) then \'Открыто\'\n' +
            '\telse \'Закрыто\'\n' +
            'END as "shop_status"\n' +
            '\t, (SELECT (sum(rating)::real / count(f.id_shop))::real\n' +
            '\t  FROM test.feedbacks f\n' +
            '\t  WHERE f.id_shop = si.id_shop) as  "rating" \n' +
            '\t, c.number_of_day as "number_of_day"\n' +
            'FROM test.shop_info si\n' +
            'LEFT JOIN test.calendar_to_shop cs ON si.id_shop = cs.id_shop\n' +
            'LEFT JOIN test.calendar c ON c.id_calendar = cs.id_calendar\n' +
            '\t WHERE si.city_id = ($1))\n' +
            '\n' +
            'SELECT *  FROM rez\n' +
            'WHERE EXTRACT (DOW FROM NOW()) = number_of_day', [city_id]);
        res.json(cityShops.rows);
    }
}

module.exports = new ShopsControllers()