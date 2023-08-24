require('dotenv').config({ path: __dirname + '/.env' });
const Pool = require('pg').Pool;

const pool = new Pool({
    connectionString: process.env.DATABASE_URL,
});

module.exports = pool;
