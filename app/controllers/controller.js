const pool = require('../../db');
const bodyParser = require('body-parser');

const getDesigns = async function (req, res) {
    try {
        const query = await pool.query(
            'SELECT * FROM designs_search'
        );
        const cart_length = (
            await pool.query(
                'SELECT * FROM user_cart_design'
            )
        ).rows.length;

        res.render('100-browse-item', {
            design: query.rows,
            cart: cart_length,
        });
    } catch (error) {
        console.log(error);
    }
};

const getShops = async function (req, res) {
    try {
        const query = await pool.query(
            'SELECT * FROM shops_search'
        );
        const cart_length = (
            await pool.query(
                'SELECT * FROM user_cart_design'
            )
        ).rows.length;
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
                filaments_array.push(
                    filaments.rows[j].type
                );
                min_price = Math.min(
                    min_price,
                    filaments.rows[j].price
                );
                max_price = Math.max(
                    max_price,
                    filaments.rows[j].price
                );
            }

            results[i].filaments = filaments_array;
            results[i].min_price = min_price;
            results[i].max_price = max_price;
            results[i].image_url = images.rows[0].url;
        }

        res.render('104-browse-shop', {
            shop: results,
            cart: cart_length,
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
        const cart_length = (
            await pool.query(
                'SELECT * FROM user_cart_design'
            )
        ).rows.length;

        const design_info = query_1.rows;
        const design_images = query_2.rows;
        const design_description = query_3.rows;

        res.render('101-browse-item-details', {
            design: design_info,
            images: design_images,
            description: design_description,
            cart: cart_length,
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
        const cart_length = (
            await pool.query(
                'SELECT * FROM user_cart_design'
            )
        ).rows.length;

        const designer_info = query_1.rows;
        const designer_bio = query_2.rows;
        const designer_images = query_3.rows;
        const designer_designs = query_4.rows;

        res.render('105-desinger-profile', {
            designer: designer_info,
            bio: designer_bio,
            images: designer_images,
            designs: designer_designs,
            cart: cart_length,
        });
    } catch (error) {
        console.log(error);
    }
};

const getShop = async function (req, res) {
    const shop_id = req.params.id;
    try {
        const query_1 = await pool.query(
            `SELECT * FROM shop_search WHERE id=${shop_id}`
        );
        const query_2 = await pool.query(
            `SELECT * FROM shop_search_bio WHERE id=${shop_id}`
        );
        const query_3 = await pool.query(
            `SELECT * FROM shop_search_filaments WHERE id=${shop_id}`
        );
        const query_4 = await pool.query(
            `SELECT * FROM shop_search_images WHERE id=${shop_id} ORDER BY pos ASC`
        );
        const query_5 = await pool.query(
            `SELECT * FROM shop_search_printer WHERE id=${shop_id}`
        );
        const cart_length = (
            await pool.query(
                'SELECT * FROM user_cart_design'
            )
        ).rows.length;

        const shop_info = query_1.rows;
        const shop_bio = query_2.rows;
        const shop_filaments = query_3.rows;
        const shop_images = query_4.rows;
        const shop_printers = query_5.rows;

        for (i = 0; i < shop_filaments.length; i++) {
            let colors_array = [];
            const colors = await pool.query(
                `SELECT * FROM shop_search_filament_colors WHERE id=${shop_id} AND type='${shop_filaments[i].type}'`
            );
            for (j = 0; j < colors.rows.length; j++) {
                colors_array.push(colors.rows[j].color);
            }
            shop_filaments[i].colors = colors_array;
            colors_array = [];
        }

        res.render('103-browse-shop-details', {
            shop: shop_info,
            bio: shop_bio,
            filaments: shop_filaments,
            images: shop_images,
            printers: shop_printers,
            cart: cart_length,
        });
    } catch (error) {
        console.log(error);
    }
};

const addShop = async function (req, res) {
    const shop_id = req.params.id;
    try {
        await pool.query(
            `UPDATE user_cart_shop_selection SET shop_id=${shop_id} WHERE user_id=1`
        );

        res.redirect('/cart');
    } catch (error) {
        console.log(error);
    }
};

const removeShop = async function (req, res) {
    try {
        await pool.query(
            `UPDATE user_cart_shop_selection SET shop_id=-1 WHERE user_id=1`
        );

        res.redirect(req.get('referer'));
    } catch (error) {
        console.log(error);
    }
};

const addItem = async function (req, res) {
    const design_id = req.params.id;
    try {
        const query_1 = await pool.query(
            `SELECT * FROM user_cart_design WHERE design_id=${design_id}`
        );

        if (query_1.rows[0] == undefined) {
            await pool.query(
                `INSERT INTO user_cart_design(user_id, design_id, design_quantity)
                VALUES ($1, $2, $3)`,
                [1, design_id, 1]
            );
        }

        res.redirect(req.get('referer'));
    } catch (error) {
        console.log(error);
    }
};

const updateItemQuantity = async function (req, res) {
    const item_quantity = req.body.item_quantity;
    const design_id = req.body.design_id;
    try {
        await pool.query(
            `UPDATE user_cart_design SET design_quantity=${item_quantity} 
            WHERE user_id=1 AND design_id=${design_id}`
        );

        res.redirect(req.get('referer'));
    } catch (error) {
        console.log(error);
    }
};

const removeItem = async function (req, res) {
    const design_id = req.params.id;
    try {
        await pool.query(
            `DELETE FROM user_cart_design WHERE user_id=1 AND design_id=${design_id}`
        );
        res.redirect(req.get('referer'));
    } catch (error) {
        console.log(error);
    }
};

const getCart = async function (req, res) {
    try {
        const query_1 = await pool.query(
            `SELECT * FROM cart_view`
        );
        const query_2 = await pool.query(
            `SELECT * FROM cart_view_items ORDER BY cart_item_order ASC`
        );
        const query_3 = await pool.query(
            `SELECT * FROM cart_view_shop_selection WHERE user_id=1 AND img_pos='2'`
        );

        const query_4 = await pool.query(
            `SELECT * FROM cart_view_items_materials WHERE user_id=1 ORDER BY item_order ASC`
        );

        let designs_info = query_2.rows;
        let materials_info = query_4.rows;
        let materials_subtotal = 0.0;
        let item_subtotal = 0.0;
        let shop_selection = query_3.rows;

        for (j = 0; j < designs_info.length; j++) {
            for (i = 0; i < materials_info.length; i++) {
                let material_details = await pool.query(
                    `SELECT * FROM shop_filaments WHERE shop_id=$1 AND shop_filament_type=$2`,
                    [
                        materials_info[i].shop_id,
                        materials_info[i].material,
                    ]
                );

                materials_info[i].price =
                    material_details.rows[0].shop_filament_price;
                materials_info[i].item_price_each =
                    materials_info[i].design_weight *
                    materials_info[i].price;
                materials_info[i].item_subtotal =
                    materials_info[i].item_price_each *
                    materials_info[i].qtd;

                materials_subtotal +=
                    materials_info[i].item_subtotal;
            }

            designs_info[j].print_subtotal =
                materials_subtotal;
            designs_info[j].item_total =
                +designs_info[j].subtotal +
                materials_subtotal;
        }

        if (shop_selection[0] == undefined) {
            shop_selection = [
                {
                    shop_id: 'unassigned',
                    img_url: '#',
                    shop_name: 'unassigned',
                    shop_address: 'unassigned',
                },
            ];
        }

        console.log(designs_info);

        res.render('102-cart', {
            shop: shop_selection,
            designs: designs_info,
            materials: materials_info,
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
    getShop,
    addShop,
    removeShop,
    addItem,
    removeItem,
    updateItemQuantity,
    getCart,
};
