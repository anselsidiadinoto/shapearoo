const express = require('express');
const router = express.Router();
const controller = require('../controllers/controller');

router.get('/', (req, res) => {
  res.render('000-home');
});

router.get('/search/item', controller.getDesigns);

router.get('/search/item/:id', controller.getDesign);

router.get('/cart/:id', (req, res) => {
  res.render('102-cart');
});

router.get('/search/shop/id', (req, res) => {
  res.render('103-browse-shop-details');
});

router.get('/search/shop', controller.getShops);

router.get('/search/designer/:id', controller.getDesigner);

module.exports = router;
