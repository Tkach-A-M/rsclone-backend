const db = require('../db');
class OrdersControllers{

    async addOrder(req, res){
        const { id_customer, order_list, price } = req.body;
        const orderToAdd = ('INSERT INTO test.orders(id_customer, order_list, status, price) VALUES ($1, $2, $3, $4) RETURNING *', [id_customer, order_list, false, price]);
        res.json(orderToAdd.rows);
    }

    async getOrders(req, res){
        const id_customer = req.params.id;
        console.log(id_customer);
        const unfinishedOrders = ('SELECT order_list, price FROM test.orders WHERE id_customer = 1 AND status = false', [id_customer])
        res.json(unfinishedOrders.rows);
    }

}

module.exports = new OrdersControllers()