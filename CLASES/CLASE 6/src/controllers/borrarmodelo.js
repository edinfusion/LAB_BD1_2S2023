const db = require('../db/conexion');

exports.borrarmodel = async (req, res) => {

    const script = `
    -- BORRAR BASE DE DATOS
    DROP DATABASE IF EXISTS ejemplo;
    -- BORRAR TABLA CLIENTE
    DROP TABLE IF EXISTS ejemplo.cliente;
    -- BORRAR TABLA PRODUCTO
    DROP TABLE IF EXISTS ejemplo.PRODUCTO;
    -- BORRAR TABLA PEDIDO
    DROP TABLE IF EXISTS ejemplo.PEDIDO;
    -- BORRAR TABLA DETALLE PEDIDO
    DROP TABLE IF EXISTS ejemplo.DETALLE_PEDIDO;
    `;

    try {
        // Eliminar los comentarios del script SQL
        const scriptWithoutComments = script.replace(/(--.*)/g, '');

        // Ejecutar el script SQL sin comentarios
        const sqlCommands = scriptWithoutComments.split(";").map(command => command.trim());

        for (let i = 0; i < sqlCommands.length; i++) {
            sql = sqlCommands[i];
            if (sql.length === 0) {
                continue;
            }
            await db.query(sql,[]);
        }

        res.status(200).json({
            body: { res: true, message: 'MODELO BORRADO EXITOSAMENTE' },
        });
    } catch (error) {
        console.log(error);
        res.status(500).json({
            body: { res: false, message: 'OCURRIÓ UN PROBLEMA AL CREAR EL MODELO', error },
        });
    }
}
