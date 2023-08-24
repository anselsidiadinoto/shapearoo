const express = require('express');
const router = express.Router();
const controller = require('../controllers/controller');

router.get('/', controller.getDesigns );

router.get('/search/item', controller.getDesigns);

router.get('/search/item/details/:id', controller.getDesign);

router.get('/cart', controller.getCart);

router.post('/cart/update_item_quantity',controller.updateItemQuantity);

router.post('/cart/add_item_material', controller.addItemMaterial);

router.post('/cart/update_item_material', controller.updateItemMaterial)

router.get('/cart/remove_item_material/:design_id/:material/:color', controller.removeItemMaterial);

router.get('/cart/remove_item/:id', controller.removeItem);

router.get('/search/shop/details/:id', controller.getShop);

router.get('/search/shop', controller.getShops);

router.get('/add/shop/:id', controller.addShop);

router.get('/remove_shop/:id', controller.removeShop);

router.get('/search/designer/details/:id', controller.getDesigner);

router.get('/add/item/:id', controller.addItem);

module.exports = router;
