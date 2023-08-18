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

    res.render('104-browse-shop', {
      shop: results,
    });
  } catch (error) {
    console.log(error);
  }
};

const getDesign = async function (req, res) {
  const design_id = req.params.id;
  try {
    const query_1 = await pool.query(
      `SELECT * FROM designs_search WHERE design_id=${design_id}`
    );
    const query_2 = await pool.query(
      `SELECT * FROM design_search_images WHERE design_id=${design_id}`
    );
    const query_3 = await pool.query(
      `SELECT * FROM design_search_description WHERE design_id=${design_id}`
    );
    const design_info = query_1.rows;
    const design_images = query_2.rows;
    const design_description = query_3.rows;

    res.render('101-browse-item-details', {
      design: design_info,
      images: design_images,
      description: design_description,
    });
  } catch (error) {
    console.log(error);
  }
};

const getDesigner = async function (req, res) {
  const designer_id = req.params.id;
  try {
    const query_1 = await pool.query(
      `SELECT * FROM designer_search WHERE id=${designer_id}`
    );
    const query_2 = await pool.query(
      `SELECT * FROM designer_search_bio WHERE id=${designer_id}`
    );
    const query_3 = await pool.query(
      `SELECT * FROM designer_search_images WHERE id=${designer_id} ORDER BY pos ASC`
    );
    const query_4 = await pool.query(
      `SELECT * FROM designs_search WHERE designer_id=${designer_id}`
    );

    const designer_info = query_1.rows;
    const designer_bio = query_2.rows;
    const designer_images = query_3.rows;
    const designer_designs = query_4.rows;

    res.render('105-desinger-profile', {
      designer: designer_info,
      bio: designer_bio,
      images: designer_images,
      designs: designer_designs,
    });
  } catch (error) {
    console.log(error);
  }
};

module.exports = {
  getDesigns,
  getDesign,
  getDesigner,
  getShops,
};
