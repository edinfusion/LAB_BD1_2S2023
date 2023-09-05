const db = require('../db/conexion');
const script = require('../db/script');

exports.modelo = async (req, res) => {
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
            body: { res: true, message: 'MODELO CREADO EXITOSAMENTE' },
        });
    } catch (error) {
        console.log(error);
        res.status(500).json({
            body: { res: false, message: 'OCURRIÓ UN PROBLEMA AL CREAR EL MODELO', error },
        });
    }
}
