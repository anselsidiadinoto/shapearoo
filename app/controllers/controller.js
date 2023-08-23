const pool = require('../../db');
const bodyParser = require('body-parser');
const { CLIENT_RENEG_LIMIT } = require('tls');

const getDesigns = async function (req, res) {
    try {
        const query = await pool.query(
            'SELECT * FROM designs_search'
        );
        const cart_length = (
            await pool.query('SELECT * FROM user_cart_design')
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
        const query = await pool.query('SELECT * FROM shops_search');
        const cart_length = (
            await pool.query('SELECT * FROM user_cart_design')
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
                filaments_array.push(filaments.rows[j].type);
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
            await pool.query('SELECT * FROM user_cart_design')
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
            await pool.query('SELECT * FROM user_cart_design')
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
            await pool.query('SELECT * FROM user_cart_design')
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

const addItemMaterial = async function (req, res) {
    const design_id = req.body.design_id;
    const shop_id = req.body.shop_id;
    const quantity = req.body.material_quantity;
    const material = req.body.material_type;
    const color = req.body.material_color;
    try {
        await pool.query(
            'INSERT INTO user_cart_shop(user_id, shop_id, design_id, design_quantity, design_filament, design_color) VALUES($1, $2, $3, $4, $5, $6)',
            [1, shop_id, design_id, quantity, material, color]
        );

        res.redirect(req.get('referer'));
    } catch (error) {
        console.log(error);
    }
};

const updateItemMaterial = async function (req, res) {
    const design_id = req.body.design_id;
    const shop_id = req.body.shop_id;
    const quantity = req.body.material_quantity;
    const material = req.body.material_type;
    const color = req.body.material_color;

    try {
        await pool.query(
            'UPDATE user_cart_shop SET design_quantity=$1, design_color=$2 WHERE user_id=$3 AND shop_id=$4 AND design_id=$5 AND design_filament=$6',
            [quantity, color, 1, shop_id, design_id, material]
        );
        res.redirect(req.get('referer'));
    } catch (error) {
        console.log(error);
    }
};

const removeItemMaterial = async function (req, res) {
    const design_id = req.params.design_id;
    const material = req.params.material;
    const color = req.params.color;
    try {
        await pool.query(
            `DELETE FROM user_cart_shop WHERE user_id=$1 AND design_id=$2 AND design_filament=$3 AND design_color=$4`,
            [1, design_id, material, color]
        );

        res.redirect(req.get('referer'));
    } catch (error) {
        console.log(error);
    }
};

const getCart = async function (req, res) {
    try {
        const query_1 = await pool.query(`SELECT * FROM cart_view`);
        const query_2 = await pool.query(
            `SELECT * FROM cart_view_items ORDER BY cart_item_order ASC`
        );
        const query_3 = await pool.query(
            `SELECT * FROM cart_view_shop_selection WHERE user_id=1 AND img_pos='2'`
        );

        let designs_info = query_2.rows;
        let shop_selection = query_3.rows;

        for (i = 0; i < designs_info.length; i++) {
            let materials_subtotal = 0.0;
            let item_subtotal = 0.0;
            let material_quantity_remaining;
            material_quantity_remaining = designs_info[i].qtd;

            let query_materials = await pool.query(
                `SELECT * FROM cart_view_items_materials WHERE shop_id=$1 AND design_id=$2 ORDER BY item_order ASC`,
                [shop_selection[0].shop_id, designs_info[i].id]
            );

            let material_details = query_materials.rows;

            designs_info[i].materials = query_materials.rows;

            for (j = 0; j < material_details.length; j++) {
                designs_info[i].materials[j].item_price_each =
                    material_details[j].design_weight *
                    material_details[j].price;
                designs_info[i].materials[j].item_subtotal =
                    material_details[j].item_price_each *
                    material_details[j].qtd;

                materials_subtotal +=
                    material_details[j].item_subtotal;

                material_quantity_remaining -=
                    material_details[j].qtd;
            }

            designs_info[i].remaining_qtd =
                material_quantity_remaining;
            designs_info[i].print_subtotal = materials_subtotal;
            designs_info[i].item_total =
                +designs_info[i].subtotal + materials_subtotal;
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

        if (query_3.rows[0] == undefined) {
            query_3.rows = [
                {
                    shop_id: 'unassigned',
                },
            ];
        }
        let query_5 = [];
        if (query_3.rows[0].shop_id == 'unassigned') {
            query_5.rows = [
                {
                    shop_id: 'unassigned',
                    shop_filament_type: 'unassigned',
                    shop_filament_color: 'unassigned',
                },
            ];
        } else {
            query_5 = await pool.query(
                `SELECT * FROM shop_filament_colors WHERE shop_id=${query_3.rows[0].shop_id} `
            );
        }

        let shop_filament_details = query_5.rows;

        res.render('102-cart', {
            shop: shop_selection,
            designs: designs_info,
            material_info: shop_filament_details,
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
    addItemMaterial,
    updateItemMaterial,
    removeItemMaterial,
    removeItem,
    updateItemQuantity,
    getCart,
};
