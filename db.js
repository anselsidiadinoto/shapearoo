const Pool = require('pg').Pool;

const pool = new Pool({
  user: 'anselsidiadinoto',
  host: 'localhost',
  database: 'shapearoo_demo',
  port: 5432,
});

module.exports = pool;
