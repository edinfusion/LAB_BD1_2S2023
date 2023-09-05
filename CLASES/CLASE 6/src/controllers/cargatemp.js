const db = require('../db/conexion');
const config = require('../db/config')
const mysql = require('mysql2/promise')
const fs = require('fs');
const path = require('path');
const filePath = path.join(__dirname, 'clientes.csv');


//const csvclientes = require('../../carga/clientes.csv');

exports.crearTabtemp = async (req, res) => {

    const scriptCrearTablasTemp = `
    -- Tabla temporal para Clientes
    CREATE TEMPORARY TABLE ejemplo.TempClientes (
        nombre VARCHAR(255) NOT NULL,
        correo VARCHAR(255) NOT NULL,
        direccion VARCHAR(255) NOT NULL
    );

    -- Tabla temporal para Productos
    CREATE TEMPORARY TABLE ejemplo.TempProductos (
        nombre VARCHAR(255) NOT NULL,
        descripcion TEXT,
        precio DECIMAL(10, 2) NOT NULL,
        stock INT NOT NULL
    );

    -- Tabla temporal para Pedidos
    CREATE TEMPORARY TABLE ejemplo.TempPedidos (
        cliente_id INT,
        fecha_pedido DATE NOT NULL
    );

    -- Tabla temporal para DetallesPedido
    CREATE TEMPORARY TABLE ejemplo.TempDetallesPedido (
    pedido_id INT,
    producto_id INT,
    cantidad INT NOT NULL
    );
    `;

    


    try {
        // Crear una conexión que se cerrará automáticamente al terminar
        const connection = await mysql.createConnection(config.db);
        // Eliminar los comentarios del script SQL
        const scriptWithoutComments = scriptCrearTablasTemp.replace(/(--.*)/g, '');

        // Ejecutar el script SQL sin comentarios
        const sqlCommands = scriptWithoutComments.split(";").map(command => command.trim());

        for (let i = 0; i < sqlCommands.length; i++) {
            const sql = sqlCommands[i];
            if (sql.length === 0) {
                continue;
            }
            await db.querywithoutclose(connection, sql, []);
        }

        // carga de datos csv a tabla temporal
        const datosClientes = fs.readFileSync(filePath, 'utf-8');
        const lines = datosClientes.split('\n');
        for (let i = 1; i < lines.length; i++) {
            const fields = lines[i].split(',');
            const nombre = fields[0];
            const correo = fields[1];
            const direccion = fields[2];
            //console.log("vamos dentro: ",nombre, correo, direccion);
            // Insertar los datos en la tabla temporal
            await db.querywithoutclose(connection, `INSERT INTO ejemplo.TempClientes (nombre, correo, direccion) VALUES (?, ?, ?)`, [nombre, correo, direccion]);
        }

        const tempClientesData = await db.querywithoutclose(connection, `SELECT * FROM ejemplo.TempClientes`, []);
        console.log(tempClientesData);

        // por ultimo pasamos los datos de la tabla temporal a la tabla clientes
        await db.querywithoutclose(connection, `INSERT INTO ejemplo.cliente (nombre, correo, direccion) SELECT nombre, correo, direccion FROM ejemplo.TempClientes`, []);

        // Cierra la conexión
        await connection.end();

        res.status(200).json({
            body: { res: true, message: 'TABLAS TEMPORALES HAN SIDO CREADAS EXITOSAMENTE' },
        });
    } catch (error) {
        console.log(error);
        res.status(500).json({
            body: { res: false, message: 'OCURRIÓ UN PROBLEMA AL CREAR TABLAS TEMPORALES', error },
        });
    }
}
