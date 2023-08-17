const express = require('express');
const router = express.Router();
const controller = require('../controllers/controller');

router.get('/', (req, res) => {
  res.render('000-home');
});

router.get('/search/item', controller.getDesigns);

router.get('/search/item-id', (req, res) => {
  res.render('101-browse-item-details');
});

router.get('/cart/id', (req, res) => {
  res.render('102-cart');
});

router.get('/search/shop/id', (req, res) => {
  res.render('103-browse-shop-details');
});

router.get('/search/shop', controller.getShops);

router.get('/search/designer/id', (req, res) => {
  res.render('105-desinger-profile');
});

module.exports = router;
