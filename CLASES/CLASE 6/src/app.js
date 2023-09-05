const express = require('express');
const cors = require('cors');
require('dotenv').config();
const app = express();
//configuracion
app.set('port', process.env.SERVER_PORT || 3000);

//middlewares
app.use(express.json());
app.use(cors());

//routes
app.use(require('./routes/rutas'));

module.exports = app;
