const pool = require('../../db');
const bodyParser = require('body-parser');

const getDesigns = async function (req, res) {
  try {
    const query = await pool.query('SELECT * FROM designs_search');

    res.render('100-browse-item', {
      design: query.rows,
    });
  } catch (error) {
    console.log(error);
  }
};

const getShops = async function (req, res) {
  try {
    const query = await pool.query('SELECT * FROM shops_search');

    let results = query.rows;

    for (i = 0; i < results.length; i++) {
      let filaments = await pool.query(
        `SELECT * FROM shops_search_filaments WHERE id=${results[i].id}`
      );
      let images = await pool.query(
        `SELECT * FROM shops_search_images where id=${results[i].id} AND pos='2'`
      );
      let filaments_array = [];
      let min_price = filaments.rows[0].price;
      let max_price = filaments.rows[0].price;

      for (j = 0; j < filaments.rows.length; j++) {
        filaments_array.push(filaments.rows[j].type);
        min_price = Math.min(min_price, filaments.rows[j].price);
        max_price = Math.max(max_price, filaments.rows[j].price);
      }

      results[i].filaments = filaments_array;
      results[i].min_price = min_price;
      results[i].max_price = max_price;
      results[i].image_url = images.rows[0].url;
    }

    console.log(results);

    res.render('104-browse-shop', {
      shop: results,
    });
  } catch (error) {
    console.log(error);
  }
};

module.exports = {
  getDesigns,
  getShops,
};
