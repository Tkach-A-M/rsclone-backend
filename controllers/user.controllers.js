const db = require('../db');
const md5 = require('md5');
class UserController {

    async userCreate(req, res){
        const {phone, password} = req.body;
        const phoneExist = await db.query('SELECT count(id_customer) FROM test.customers WHERE user_phone = ($1);', [phone]);
        console.log(phoneExist.rows[0].count);
        if(+phoneExist.rows[0].count) {
            res.json({
                regStatus: 0,
                regText: 'Phone alredy exist',
            });
        }
        else {
            const maxCount = await db.query('SELECT count(id_customer) FROM test.customers');
            const newUser = await db.query('INSERT INTO test.customers (user_phone, user_password, username) VALUES ($1, $2, $3) RETURNING *', [phone, password, `user${(+maxCount.rows[0].count) + 1}`]);
            console.log((maxCount.rows[0].count) + 1);
            console.log(newUser)
            res.json({
                regStatus: 1,
                regText: 'Registered',
                id_customer: newUser.rows[0].id_customer
            });
        }
    }

    async userLogin(req, res){
        const {phone, password} = req.body;
        const passwordRequest = await db.query('SELECT id_customer, user_password from test.customers WHERE user_phone = ($1);', [phone]);
        const tabPassword = passwordRequest.rows[0].user_password;

        const userExist = password === tabPassword ? true : false;
        console.log(userExist);
        if(!userExist){
            res.json({
                loginStatus : 0,
                loginMessage: 'Wrong login or password'
            })
        }
        else{
            res.json({
                loginStatus : 1,
                loginMessage: 'Login success',
                loginToken: md5(Date.now()),
                id_customer: passwordRequest.rows[0].id_customer
            })
        }
    }

    async userChangePassword(req, res){
        const { newPassword, id_customer } = req.body;
        const setNewPass = await db.query('UPDATE test.customers SET password = ($1) WHERE id_customer = ($2)', [newPassword, id_customer]);
    }

    async userChangeName(req, res){
        const { newUsername, id_ustomer } = req.body;
            const setNewUsername = await db.query('UPDATE test.customers SET username = ($1) WHERE id_customer = ($2)', [newUsername, id_ustomer])
    }

}

module.exports = new UserController();