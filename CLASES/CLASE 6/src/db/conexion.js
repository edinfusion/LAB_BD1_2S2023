const mysql = require('mysql2/promise')
const config = require('./config')

async function query(sql, params) {
    const connection = await mysql.createConnection(config.db)
    const [results,] = await connection.execute(sql, params)

    connection.end(function (err) {
        console.log("Conexion cerrada")
        if (err) {
            return console.log("error conexion: ", err.message);
        }
        console.log("Conexion cerrada exitosamente");
    });
    connection.destroy()
    return results;
}

//PARA NO CERRAR LA CONEXION
async function querywithoutclose(connection, sql, params) {
    const [results,] = await connection.execute(sql, params);
    return results;
}





module.exports = { query,querywithoutclose };
