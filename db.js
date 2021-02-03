const Pool = require('pg').Pool;
const pool = new Pool({
    username: "postgres",
    password: "admin",
    host: "localhost",
    port: 5432,
    database: "rs_clone_db"
});

module.exports = pool;