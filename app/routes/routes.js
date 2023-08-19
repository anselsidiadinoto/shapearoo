const express = require('express');
const router = express.Router();
const controller = require('../controllers/controller');

router.get('/', (req, res) => {
  res.render('000-home');
});

router.get('/search/item', controller.getDesigns);

router.get('/search/item/:id', controller.getDesign);

router.get('/cart', controller.getCart);

router.get('/search/shop/:id', controller.getShop);

router.get('/search/shop', controller.getShops);

router.get('/search/designer/:id', controller.getDesigner);

router.get('/add/item/:id', controller.addItem);

module.exports = router;
