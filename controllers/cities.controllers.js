const db = require('../db');
class CitiesControllers {

    async setCity(req, res){
        const {name} = req.body;
        console.log(name);
        const newCity = await db.query('INSERT INTO cities_info (city_name) VALUES ($1) RETURNING *', [name]);
        res.json(newCity.rows[0]);
    }

    async getCities(req, res){
        const cities = await db.query('SELECT city_id, city_name FROM cities_info');
        res.json(cities.rows);
    }
}

module.exports = new CitiesControllers()