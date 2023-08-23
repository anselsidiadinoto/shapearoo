require('dotenv').config({ path: __dirname + '/.env' });

const express = require('express');
const app = express();
const bodyParser = require('body-parser');
app.use(
    express.urlencoded({
        extended: true,
    })
);
app.use(express.json());

// Static Files
app.use('/css', express.static(__dirname + '/src/css'));
app.use('/js', express.static(__dirname + '/src/js'));

// Templating Engine
app.set('views', './app/views');
app.set('view engine', 'ejs');

// Routes
const router = require('./app/routes/routes');
app.use('/', router);

app.listen(process.env.PORT, function () {
    console.log('Server is listening');
});

// ------------ TEMPLATES FOR OTHER STATIC FILES -----------------
// app.use('/js', express.static(__dirname + '/src/js'));
// app.use('/img', express.static(__dirname + '/public/img'));
