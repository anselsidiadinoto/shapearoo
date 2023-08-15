const express = require('express');
const routes = express.Router();

routes.get('/', (req, res) => {
  res.render('000-home');
});

routes.get('/search', (req, res) => {
  res.render('100-browse');
});

routes.get('/search/item-id', (req, res) => {
  res.render('101-browse-item-details');
});

routes.get('/cart/id', (req, res) => {
  res.render('102-cart');
});

routes.get('/search/shop/id', (req, res) => {
  res.render('103-browse-shop-details');
});

routes.get('/search/shop', (req, res) => {
  res.render('104-browse-shop');
});

module.exports = routes;
